//
//  NewsViewController.m
//  BWStarry1604C
//
//  Created by 李非非 on 2018/7/9.
//  Copyright © 2018年 移动学院. All rights reserved.
//

#import "NewsViewController.h"
#import <SMS_SDK/SMSSDK.h>
#import "AFNetworking.h"

@interface NewsViewController ()
{
    UITextField *_phone_textField;//手机号
    UITextField *_code_textField;//验证码
    UITextField *_zbar_textField;// 二维码信息
    UIImageView *_showScanImageView;//展示扫描二维码
    
}
@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //手机号输入
    UITextField *textField_phone = [[UITextField alloc]initWithFrame:CGRectMake(20.0, 90.0, 150.0, 40)];
    textField_phone.keyboardType = UIKeyboardTypeNumberPad;
    textField_phone.backgroundColor = [UIColor whiteColor];
    textField_phone.placeholder = @"请输入手机号";
    [self.view addSubview:textField_phone];
    _phone_textField = textField_phone;
    //SMSSDK
    UIButton *smsdk = [[UIButton alloc]initWithFrame:CGRectMake(20.0, 140.0, 100.0, 40)];
    [smsdk setTitle:@"发送短信验证" forState:UIControlStateNormal];
    smsdk.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:smsdk];
    
    [smsdk addTarget:self action:@selector(smsdkClick:) forControlEvents:UIControlEventTouchDown];
    [smsdk setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];//:[UIColor blackColor]];
    [self.view addSubview:smsdk];
    //验证码输入
    UITextField *textField_code = [[UITextField alloc]initWithFrame:CGRectMake(140.0, 140.0, 100.0, 40)];
    textField_code.keyboardType = UIKeyboardTypeNumberPad;
    textField_code.backgroundColor = [UIColor whiteColor];
    textField_code.placeholder = @"请输入验证码";
    [self.view addSubview:textField_code];
    _code_textField = textField_code;
    
    //SMSSDK code
    
    UIButton *smsdkCommitCode = [[UIButton alloc]initWithFrame:CGRectMake(240.0, 140.0, 100.0, 40)];
    [smsdkCommitCode setTitle:@"验证短信验证码" forState:UIControlStateNormal];
    smsdkCommitCode.backgroundColor = [UIColor whiteColor];
    [smsdkCommitCode setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];//:[UIColor blackColor]];
    [self.view addSubview:smsdkCommitCode];
    
    [smsdkCommitCode addTarget:self action:@selector(smsdkCommitCodeClick:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:smsdkCommitCode];
    
    //二维码
    UIImageView *imgV  = [[UIImageView alloc]initWithFrame:CGRectMake(20, 240.0, 100, 100)];
    imgV.backgroundColor = [UIColor greenColor];
    [imgV setImage:[UIImage imageWithCIImage:[self creatQRcodeWithUrlstring:@"feifei"]]];
    
    [self.view addSubview:imgV];
    _showScanImageView = imgV;
    
    UIButton *create_button = [[UIButton alloc]initWithFrame:CGRectMake(130.0, 240.0, 100.0, 40)];
    [create_button setTitle:@"生成二维码" forState:UIControlStateNormal];
    create_button.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:create_button];
    
    [create_button addTarget:self action:@selector(createClick:) forControlEvents:UIControlEventTouchDown];
    [create_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];//:[UIColor blackColor]];
    //Scan
    UIButton *scan_button = [[UIButton alloc]initWithFrame:CGRectMake(20.0, 140.0, 100.0, 40)];
    [scan_button setTitle:@"扫描二维码" forState:UIControlStateNormal];
    scan_button.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:scan_button];
    [scan_button addTarget:self action:@selector(scanClick:) forControlEvents:UIControlEventTouchDown];
    [scan_button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    NSArray *array = [self readQRCodeFromImage:imgV.image];
    
    NSLog(@"fei%@-",array);
    //
    // Do any additional setup after loading the view.
}
/** * 读取图片中的二维码
 * * @param image 图片
 * * @return 图片中的二维码数据集合 CIQRCodeFeature对象 */
- (NSArray *)readQRCodeFromImage:(UIImage *)image{
    // 创建一个CIImage对象
    CIImage *ciImage = [[CIImage alloc] initWithCGImage:image.CGImage options:nil];
    
    CIContext *context = [CIContext contextWithOptions:@{kCIContextUseSoftwareRenderer : @(YES)}];// 软件渲染
    
    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:context options:@{CIDetectorAccuracy : CIDetectorAccuracyHigh}];// 二维码识别
    
    // 注意这里的 CIDetectorTypeQRCode
    NSArray *features = [detector featuresInImage:ciImage]; NSLog(@"features = %@",features);
    
    // 识别后的结果集
    for (CIQRCodeFeature *feature in features) {
        NSLog(@"msg = %@",feature.messageString);// 打印二维码中的信息
    }
    return features;
}



/** * 根据字符串生成二维码 CIImage 对象
 * * @param urlString 需要生成二维码的字符串
 * * @return 生成的二维码
 */
- (CIImage *)creatQRcodeWithUrlstring:(NSString *)urlString{
    // 1.实例化二维码滤镜
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    // 2.恢复滤镜的默认属性 (因为滤镜有可能保存上一次的属性)
    [filter setDefaults];
    // 3.将字符串转换成NSdata
    NSData *data = [urlString dataUsingEncoding:NSUTF8StringEncoding];
    // 4.通过KVO设置滤镜, 传入data, 将来滤镜就知道要通过传入的数据生成二维码
    [filter setValue:data forKey:@"inputMessage"];
    // 5.生成二维码
    CIImage *outputImage = [filter outputImage]; return outputImage;
    
}



-(void)smsdkClick:(UIButton *)butten {
    NSLog(@"fei 点击了短信验证");
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:_phone_textField.text zone:@"86" template:nil result:^(NSError *error) {
        if (!error) {
            //请求成功
            NSLog(@"成功");
        }else{
            //失败 error
            NSLog(@"%@",error.description);
        }
    }];
    
}
-(void)smsdkCommitCodeClick:(UIButton *)butten {
    NSLog(@"fei 点击了短信验证码验证");
   
    [SMSSDK commitVerificationCode:@"4019" phoneNumber:_code_textField.text zone:@"86" result:^(NSError *error) {
        if (!error) {
            //请求成功
            NSLog(@"成功");
        }else{
            //失败 error
            NSLog(@"%@",error.description);
        }
    }];

    
    
}
-(void)createClick:(UIButton *)butten {
    NSLog(@"fei 点击了生成二维码");
}
-(void)scanClick:(UIButton *)butten {
    NSLog(@"fei 点击了扫一扫");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
