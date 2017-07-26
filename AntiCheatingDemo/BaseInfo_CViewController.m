//
//  BaseInfo_CViewController.m
//  AntiCheatingDemo
//
//  Created by leo on 2017/7/20.
//  Copyright © 2017年 leo. All rights reserved.
//

#import "BaseInfo_CViewController.h"
#import <sys/utsname.h>
#import <sys/mount.h>
#import <SystemConfiguration/CaptiveNetwork.h>
#import "Reachability.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <NetworkExtension/NetworkExtension.h>
#import <CoreTelephony/CTCarrier.h>

#if DEBUG

#define NLLog(FORMAT, ...) fprintf(stderr,"[%s:%d行] %s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

#else

#define NSLog(FORMAT, ...) nil

#endif


@interface BaseInfo_CViewController ()

@end

@implementation BaseInfo_CViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    UIButton *tempButton =[UIButton buttonWithType:UIButtonTypeCustom];
    self.title =@"BaseInfo-C";
    self.view.backgroundColor =[UIColor whiteColor];
    
//    [self GetProcessInfo];
//    [self GetDiviceInfo];
//    [self GetLocalInfo];
//    [self GetSystemInfo];
//    [self GetDiskInfo];
//    [self GetMemoryInfo];
//    [self GetBatteryInfo];
//    [self GetScreenInfo];
//    [self GetNetWorkInfo];
//    [self GetProjectInfo];
//    [self GetDeviceVPNInfo];
    [self GetTelephonyNetworkInfo];
//    [self GetLocationInfo];
    
}

- (void)GetProcessInfo{
     NSLog(@"******************GetProcessInfo************************ \n");
    
    NSProcessInfo *processInfo =[NSProcessInfo processInfo];
    NSInteger proCount = processInfo.processorCount; //当前设备的核数 如： 2
    NSLog(@"proCount : %ld",proCount);
    NSInteger acproCount = processInfo.activeProcessorCount; //当前活跃的核数 如： 2
    NSLog(@"acproCount : %ld",(long)acproCount);
    NSInteger systemUptime = processInfo.systemUptime; //从重启后到现在的系统运行时长  如： 190349
    NSLog(@"systemUptime:%ld",(long)systemUptime);
    NSString * processName =processInfo.processName;    //当前执行的进程名称 如：AntiCheatingDemo
    NSLog(@"processName :%@",processName);
    NSArray * arguments =processInfo.arguments; //当前进程所在路径 如： "/var/mobile/Containers/Bundle/Application/203BE3DB-5AC7-46D8-B95A-30FDC6E61B28/AntiCheatingDemo.app/AntiCheatingDemo"
    NSLog(@"arguments :%@",arguments);
    NSDictionary *environmentDict =processInfo.environment; //进程启动的环境中的变量名（key）及其值
    NSLog(@"environmentDict:%@",environmentDict);
    NSInteger  processIdentifier =processInfo.processIdentifier; //当前进程id 如： 4273
    NSLog(@"processIdentifier : %ld",(long)processIdentifier);
    NSString *hostName = processInfo.hostName; //主机名称 如：iphone2.local
    NSLog(@"hostName ：%@",hostName);
    
    NSInteger majorVersion = processInfo.operatingSystemVersion.majorVersion; //主版本号 如： 9
    NSLog(@"operatingSystemVersion-majorVersion:%ld",(long)majorVersion);
    
    NSInteger minorVersion = processInfo.operatingSystemVersion. minorVersion; //次要版本号 如 1
    NSLog(@"operatingSystemVersion-majorVersion:%ld",(long)minorVersion);
    
    NSInteger patchVersion = processInfo.operatingSystemVersion.patchVersion; //描述版本号 如 0
    NSLog(@"operatingSystemVersion-majorVersion:%ld",(long)patchVersion);

    NSString * operatingSystemVersionString = processInfo.operatingSystemVersionString; //操作系统的build版本号 如 Version 9.1 (Build 13B143)
    NSLog(@"operatingSystemVersionString : %@",operatingSystemVersionString);
}

- (void)GetDiviceInfo{
    
     NSLog(@"******************GetDiviceInfo************************ \n");
    
    UIDevice * device =[UIDevice currentDevice];
    NSString * sysName =device.systemName;  // 操作系统名称 如：iPhone OS
    NSLog(@"sysName : %@",sysName);
    NSString * sysVersion = device.systemVersion; // 当前系统版本 如： 9.1
    NSLog(@"sysVersion : %@",sysVersion);
    BOOL mulSup = device.multitaskingSupported; // 是否支持多任务
    NSLog(@"mulSup : %@",mulSup?@"YES":@"NO");
    NSString *IDFV = [device.identifierForVendor UUIDString]; // 获取IDFV独一标识符 如：C0D7EC10-0009-49EF-B2F1-573BF0CA7FD1
    NSLog(@"IDFV : %@",IDFV);
    NSString * currentDeviceName = device.name; // 当前手机名称 如：iPhone2
    NSLog(@"currentDeviceName : %@",currentDeviceName);
    NSString * currentDeviceType =device.model; // 当前手机类型 如：iPhone
    NSLog(@"currentDeviceType : %@",currentDeviceType);
    NSString * localizedModel = device.localizedModel;  // 如 iPhone
    NSLog(@"localizedModel : %@",localizedModel);
   
    switch (device.userInterfaceIdiom) {
        case UIUserInterfaceIdiomUnspecified:
            NSLog(@"userInterfaceIdiom : UIUserInterfaceIdiomUnspecified");
            break;
        case UIUserInterfaceIdiomPhone:
            NSLog(@"userInterfaceIdiom : UIUserInterfaceIdiomPhone");
            break;
        case UIUserInterfaceIdiomPad:
            NSLog(@"userInterfaceIdiom : UIUserInterfaceIdiomPad");
            break;
        case UIUserInterfaceIdiomTV:
            NSLog(@"userInterfaceIdiom : UIUserInterfaceIdiomTV");
            break;
        case UIUserInterfaceIdiomCarPlay:
            NSLog(@"userInterfaceIdiom : UIUserInterfaceIdiomCarPlay");
            break;
        default:
            break;
    }
    
    switch (device.orientation) {
        case UIDeviceOrientationUnknown:
            NSLog(@"orientation : UIDeviceOrientationUnknown");
            break;
        case UIDeviceOrientationPortrait:
            NSLog(@"orientation : UIDeviceOrientationPortrait");
            break;
        case UIDeviceOrientationPortraitUpsideDown:
            NSLog(@"orientation : UIDeviceOrientationPortraitUpsideDown");
            break;
        case UIDeviceOrientationLandscapeLeft:
            NSLog(@"orientation : UIDeviceOrientationLandscapeLeft");
            break;
        case UIDeviceOrientationLandscapeRight:
            NSLog(@"orientation : UIDeviceOrientationLandscapeRight");
            break;
        case UIDeviceOrientationFaceUp:
            NSLog(@"orientation : UIDeviceOrientationFaceUp");
            break;
        case UIDeviceOrientationFaceDown:
            NSLog(@"orientation : UIDeviceOrientationFaceDown");
            break;
        default:
            break;
    }
}
- (void)GetLocalInfo{
    /*****************************GetLocalInfo*******************************************/
    
    NSLocale *locale = [NSLocale currentLocale];
    
    NSArray *languageArray = [NSLocale preferredLanguages];
    NSString *language = [languageArray objectAtIndex:0];  //当前系统语言环境 如：zh-Hans-CN
    NSLog(@"语言：%@", language);
    //API_AVAILABLE ios 10.0
    NSString *country = [locale localeIdentifier]; //当前手机所在设置的国家  如： zh_CN
    NSLog(@"国家：%@", country);
    NSString *countryCode  = [locale countryCode]; // 地区代码 如：CN
    NSLog(@"countryCode : %@",countryCode);
    
    NSString *languageCode  = [locale languageCode]; // 本地语言代码 如：zh
    NSLog(@"languageCode : %@",languageCode);
    
    NSString *scriptCode = [locale scriptCode]; // 本地脚本代码 如：
    NSLog(@"scriptCode : %@",scriptCode);
    
    NSString *variantCode  = [locale variantCode]; //本地语言变体代码 如：
    NSLog(@"countryCode : %@",variantCode);
    
    NSCharacterSet *exemplarCharacterSet  = [locale exemplarCharacterSet]; // 实例区域的字符集 如：
    NSLog(@"exemplarCharacterSet : %@",exemplarCharacterSet);
    
    NSString *collationIdentifier  = [locale collationIdentifier]; // 区域设置的排序标识 如：
    NSLog(@"collationIdentifier : %@",collationIdentifier);
    
    NSString *collatorIdentifier  = [locale collatorIdentifier]; // 区域设置的排序标识对照 如： zh-Hans-CN
    NSLog(@"collatorIdentifier : %@",collatorIdentifier);
    
    NSString * decimalSeparator  = [locale decimalSeparator]; // 用于区域设置的小数分隔符 如：.
    NSLog(@"decimalSeparator : %@",decimalSeparator);
    
    NSString * groupingSeparator  = [locale groupingSeparator]; // 用于区域设置的分组分隔符 如：,
    NSLog(@"groupingSeparator : %@",groupingSeparator);
    
    NSString * currencyCode  = [locale currencyCode]; // 本地语言的货币代码 如： CNY
    NSLog(@"currencyCode : %@",currencyCode);
    
    NSString * currencySymbol  = [locale currencySymbol]; // 区域设置的区域符号 如：￥
    NSLog(@"currencySymbol : %@",currencySymbol);
    
    NSString * calendarIdentifier  = [locale calendarIdentifier]; // 区域设置的日历标识符 如：gregorian
    NSLog(@"calendarIdentifier : %@",calendarIdentifier);
    
    NSString * quotationBeginDelimiter  = [locale quotationBeginDelimiter]; // 用于区域设置的开始引号 如： “
    NSLog(@"quotationBeginDelimiter : %@",quotationBeginDelimiter);
    
    NSString * quotationEndDelimiter  = [locale quotationEndDelimiter]; // 用于区域设置的结束引号 如：”
    NSLog(@"quotationEndDelimiter : %@",quotationEndDelimiter);
    
    
    NSString * alternateQuotationBeginDelimiter  = [locale alternateQuotationBeginDelimiter]; // 用于区域交替开始引号 如：‘
    NSLog(@"alternateQuotationBeginDelimiter : %@",alternateQuotationBeginDelimiter);
    
    
    NSString * alternateQuotationEndDelimiter  = [locale alternateQuotationEndDelimiter]; // 用于区域交替结束引号 如：’
    NSLog(@"alternateQuotationEndDelimiter : %@",alternateQuotationEndDelimiter);

}

- (void)GetSystemInfo{
    
    NSLog(@"******************GetSystemInfo************************ \n");
    
    //#import <sys/utsname.h>
    struct utsname systemInfo;
    uname(&systemInfo);
    NSDictionary *utsNameDic = @{@"sysname":[NSString stringWithCString:systemInfo.sysname encoding:NSUTF8StringEncoding],@"nodename":[NSString stringWithCString:systemInfo.nodename encoding:NSUTF8StringEncoding],@"release":[NSString stringWithCString:systemInfo.release encoding:NSUTF8StringEncoding],@"version":[NSString stringWithCString:systemInfo.version encoding:NSUTF8StringEncoding],@"machine":[NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding]};
    
    NSString * kernelVersion = utsNameDic[@"release"]; //获取当前设置XNU内核版本号
    NSLog(@"kernelVersion : %@",kernelVersion);
    NSString * DarwinBuildInfo = utsNameDic[@"version"]; // 得到内核描述信息
    NSLog(@"DarwinBuildInfo: %@",DarwinBuildInfo);
    NSString * OSName = utsNameDic[@"sysname"]; //内核操作系统名称
    NSLog(@"OSName: %@ ",OSName);
    NSString * machineType = utsNameDic[@"machine"]; //机器类型 如：iPhone 6,2
    NSLog(@"machineType:%@",machineType);
    NSString * iPhoneType  =[self GetiPhoneSysTypeWithMachine:machineType];
    NSLog(@"iPhoneType:%@ ",iPhoneType);
    NSString * netWordNodeName = utsNameDic[@"nodename"]; // 网络节点名称
    NSLog(@"netWordNodeName: %@ ",netWordNodeName);
    
}

- (void)GetDiskInfo{
    
    NSLog(@"*****************************GetDiskInfo******************************\n");
    
    NSError *error = nil;
    NSDictionary *attrs = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&error];  /*
                                                                                                                           
                                                                                                                           NSFileSystemFreeNodes = 2394699;
                                                                                                                           NSFileSystemFreeSize = 9808687104;
                                                                                                                           NSFileSystemNodes = 3124179;
                                                                                                                           NSFileSystemNumber = 16777219;
                                                                                                                           NSFileSystemSize = 12796645376;
                                                                                                                           
                                                                                                                           */
    NSLog(@"DiskInfo: %@",attrs);
    
    NSLog(@"error :%@",error);
    int64_t space =  [[attrs objectForKey:NSFileSystemSize] longLongValue];  //磁盘总容量
    NSLog(@"disk space total :%lld \n FormatData:%@",space,[self p_getSizeFromString:space]);
    
    struct statfs buff;
    unsigned long long totalSpace = -1;
    if (statfs("/var", &buff) >= 0) {
        totalSpace = (unsigned long long)(buff.f_bsize * buff.f_blocks); //磁盘总容量
    }
    NSLog(@"totalSpace:%lld \n FormatData:%@",totalSpace,[self p_getSizeFromString:totalSpace]);
    
    
    NSDictionary *attrsFree = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&error];
    NSLog(@"error :%@",error);
    int64_t spaceFree =  [[attrsFree objectForKey:NSFileSystemFreeSize] longLongValue]; // 可用磁盘容量
    
    NSLog(@"disk space free :%lld \n FormatData:%@",spaceFree,[self p_getSizeFromString:spaceFree]);
    
    
    //#import <sys/mount.h>
    struct statfs buf;
    unsigned long long freeSpace = -1;
    if (statfs("/var", &buf) >= 0) {
        freeSpace = (unsigned long long)(buf.f_bsize * buf.f_bavail); //可用磁盘容量
    }
    NSLog(@"freeSpace:%llu \n FormatData:%@",freeSpace,[self p_getSizeFromString:freeSpace]);
    
    
}

-(void)GetMemoryInfo{
    
    NSLog(@"******************GetMemoryInfo************************ \n");
    NSProcessInfo * proInfo =[NSProcessInfo processInfo];
    unsigned long long menoryTotal = -1;
    menoryTotal =proInfo.physicalMemory;  //物理总内存 如：1048576000
    NSLog(@"menoryTotal: %lld \n FormatData:%@",menoryTotal,[self p_getSizeFromString:menoryTotal]);
    
}

/**
 *  得到规格化的存储大小
 *
 *  @param size 原始大小
 *
 *  @return 规格化存储大小
 */
- (NSString *)p_getSizeFromString:(long long)size {
    
    if (size>1024*1024*1024) {
        return [NSString stringWithFormat:@"%.1fGB",size/1024.f/1024.f/1024.f];   //大于1G转化成G单位字符串
    }
    
    if (size<1024*1024*1024 && size>1024*1024) {
        return [NSString stringWithFormat:@"%.1fMB",size/1024.f/1024.f];   //转成M单位
    }
    
    if (size>1024 && size<1024*1024) {
        return [NSString stringWithFormat:@"%.1fkB",size/1024.f]; //转成K单位
    }else {
        return [NSString stringWithFormat:@"%lldB",size];   //转成B单位
    }
    
}

- (void)GetBatteryInfo{
    
    NSLog(@"******************GetBatteryInfo************************ \n");
    
    UIDevice *device = [UIDevice currentDevice];
    
    device.batteryMonitoringEnabled =YES;  // 默认 NO 如果为NO batteryLevel = -1 ； batteryState=UIDeviceBatteryStateUnknown；
    
    float batteryLevel =device.batteryLevel;  // 电池电量
    NSString * batteryState;
    
    switch (device.batteryState) {
        case UIDeviceBatteryStateFull:
            batteryState =@"UIDeviceBatteryStateFull"; //满电
            break;
        case UIDeviceBatteryStateUnknown:
            batteryState =@"UIDeviceBatteryStateUnknown"; //未知
            break;
        case UIDeviceBatteryStateCharging:
            batteryState =@"UIDeviceBatteryStateCharging"; //充电
            break;
        case UIDeviceBatteryStateUnplugged:
            batteryState =@"UIDeviceBatteryStateUnplugged"; //正在使用未充电
            break;
            
        default:
            break;
    }
    
    
    
    BOOL isBatteyMonitoring = device.isBatteryMonitoringEnabled; // 电池是否可以监控
    
    NSLog(@"batteryLevel: %f \n batteryState:%@ \n isBatteyMonitoring:%@",batteryLevel,batteryState,isBatteyMonitoring?@"YES":@"NO");
    
}

- (void)GetScreenInfo{
    
    NSLog(@"******************GetScreenInfo************************ \n");
    
    UIScreen *screen = [UIScreen mainScreen];
    CGRect screenBounds =screen.bounds;  //屏幕尺寸 如：(0.000000,0.000000,320.000000,568.000000)
    NSString *screenBoundsStr = [NSString stringWithFormat:@"(%f,%f,%f,%f)",screenBounds.origin.x,screenBounds.origin.y,screenBounds.size.width,screenBounds.size.height];
    NSLog(@"screenBounds:%@ ",screenBoundsStr);
    
    CGRect nativeBounds =screen.nativeBounds;  //屏幕尺寸 如：(0.000000,0.000000,640.000000,1136.000000)
    NSString *nativeBoundsStr = [NSString stringWithFormat:@"(%f,%f,%f,%f)",nativeBounds.origin.x,nativeBounds.origin.y,nativeBounds.size.width,nativeBounds.size.height];
    NSLog(@"nativeBoundsStr:%@ ",nativeBoundsStr);
    float screenBrightness = screen.brightness; //屏幕亮度 如：0.355394
    NSLog(@" screenBrightness:%f ",screenBrightness);
    float screenScale = screen.scale;  //屏幕dpi 如：2.000000
    NSLog(@"screenScale: %f",screenScale);
    
    float nativeScale = screen.nativeScale;  //屏幕dpi 如：2.000000
    NSLog(@"nativeScale: %f",nativeScale);
    
    NSArray *screens =[UIScreen screens];  // 如：("<UIScreen: 0x12763a060; bounds = {{0, 0}, {320, 568}}; mode = <UIScreenMode: 0x12763a5a0; size = 640.000000 x 1136.000000>>")
    NSLog(@"screens : %@",screens);
    
    CGRect coordinateSpace_Bounds  = screen.coordinateSpace.bounds; //
    NSString * coordinateSpace_BoundsStr =[NSString stringWithFormat:@"(%f,%f,%f,%f)",coordinateSpace_Bounds.origin.x,coordinateSpace_Bounds.origin.y,coordinateSpace_Bounds.size.width,coordinateSpace_Bounds.size.height];
    NSLog(@"coordinateSpace_BoundsStr :%@",coordinateSpace_BoundsStr);
    
    CGRect fixedCoordinateSpace_Bounds  = screen.fixedCoordinateSpace.bounds; // 如:(0.000000,0.000000,320.000000,568.000000)
    NSString * fixedCoordinateSpace_BoundsStr =[NSString stringWithFormat:@"(%f,%f,%f,%f)",fixedCoordinateSpace_Bounds.origin.x,fixedCoordinateSpace_Bounds.origin.y,fixedCoordinateSpace_Bounds.size.width,fixedCoordinateSpace_Bounds.size.height];
    NSLog(@"fixedCoordinateSpace_BoundsStr :%@",fixedCoordinateSpace_BoundsStr);
    
    CGSize currentMode_size =[screen currentMode].size; // 如：(640.000000,1136.000000)
    NSLog(@"currentMode_size :%@ ",[NSString stringWithFormat:@"(%f,%f)",currentMode_size.width,currentMode_size.height]);
    float currentMode_pixelAspectRatio = [screen currentMode].pixelAspectRatio; // 如：1.000000
    NSLog(@"currentMode_pixelAspectRatio :%f",currentMode_pixelAspectRatio);
    
    CGSize preferredMode_size = [screen preferredMode].size; // (640.000000,1136.000000)
    NSLog(@"preferredMode_size :%@ ",[NSString stringWithFormat:@"(%f,%f)",preferredMode_size.width,preferredMode_size.height]);
    float preferredMode_pixelAspectRatio = [screen preferredMode].pixelAspectRatio; // 1.000000
    NSLog(@"preferredMode_pixelAspectRatio :%f",preferredMode_pixelAspectRatio);
    
    NSArray *availableModes =[screen availableModes]; // ("<UIScreenMode: 0x12763a5a0; size = 640.000000 x 1136.000000>")
    NSLog(@"availableModes : %@",availableModes);
    [screen snapshotViewAfterScreenUpdates:YES];
    UIView * focusedView =[screen focusedView];
    NSLog(@"focusedView : %@",focusedView);
    
//    NSInteger  maximumFramesPerSecond = [screen maximumFramesPerSecond]; //NS_AVAILABLE_IOS(10_3)
//    NSLog(@"maximumFramesPerSecond :%ld",(long)maximumFramesPerSecond);
//    
    
}

-(void)GetNetWorkInfo{
    
    NSLog(@"******************GetNetWorkInfo************************ \n");
    
    //#import <SystemConfiguration/CaptiveNetwork.h>
    CFArrayRef myArray = CNCopySupportedInterfaces();
    if (myArray != nil) {
        CFDictionaryRef wifi_Dict =CNCopyCurrentNetworkInfo(CFArrayGetValueAtIndex(myArray, 0)); //获取当前连接WiFi信息
        NSDictionary *wifiDict =(__bridge NSDictionary *)wifi_Dict;  /*   BSSID = "b8:f8:83:c5:72:58"; SSID = TPlin --xx; SSIDDATA = <5465wwwd 696e6174 6f7231>;*/
        NSLog(@"wifi_Dict: %@",wifiDict);
    }
    
    CFDictionaryRef proxySettings = CFNetworkCopySystemProxySettings();
    NSLog(@"proxySettings :%@",proxySettings);
    
    NSDictionary *dictProxy = (__bridge_transfer id)proxySettings;  /* HTTPSEnable = 1; HTTPSPort = 8888; HTTPSProxy = "192.168.11.1";*/
    NSLog(@"dictProxy : %@",dictProxy);
    if ([[dictProxy objectForKey:@"HTTPEnable"] boolValue]) {
        NSLog(@"使用了代理");
    }
    
    //#import "Reachability.h"
    //#import <CoreTelephony/CTTelephonyNetworkInfo.h>
    Reachability *reach = [Reachability reachabilityWithHostName:@"www.apple.com"];
    NSString * netStatus ;
    switch ([reach currentReachabilityStatus]) {
        case NotReachable:
            netStatus =@"NotReachable"; //无连接
            break;
        case ReachableViaWiFi:
            netStatus =@"ReachableViaWiFi"; //使用WiFi
            break;
        case ReachableViaWWAN:      //使用移动网络
        {
            netStatus =@"ReachableViaWWAN";
            
            CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
            
            NSString *currentStatus = info.currentRadioAccessTechnology;
            
            if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyGPRS"]) {
                
                netStatus = @"GPRS";
            }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyEdge"]) {
                
                netStatus = @"2.75G EDGE";
            }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyWCDMA"]){
                
                netStatus = @"3G";
            }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyHSDPA"]){
                
                netStatus = @"3.5G HSDPA";
            }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyHSUPA"]){
                
                netStatus = @"3.5G HSUPA";
            }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyCDMA1x"]){
                
                netStatus = @"2G";
            }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyCDMAEVDORev0"]){
                
                netStatus = @"3G";
            }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyCDMAEVDORevA"]){
                
                netStatus = @"3G";
            }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyCDMAEVDORevB"]){
                
                netStatus = @"3G";
            }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyeHRPD"]){
                
                netStatus = @"HRPD";
            }else if ([currentStatus isEqualToString:@"CTRadioAccessTechnologyLTE"]){
                
                netStatus = @"4G";
            }
            
        }
            break;
            
        default:
            break;
    }
    
    NSLog(@"netStatus: %@",netStatus);

    
}


- (void)GetProjectInfo{
    NSLog(@"******************GetProjectInfo************************ \n");
    
    NSBundle *bundleInfo = [NSBundle mainBundle];
    NSDictionary  * bundleInfoDict =[bundleInfo infoDictionary];
    NSLog(@"bundleInfoDict : %@",bundleInfoDict);
    /*
     {
     BuildMachineOSBuild = 16G29;
     CFBundleDevelopmentRegion = en;
     CFBundleExecutable = AntiCheatingDemo;
     CFBundleIdentifier = "com.leo.AntiCheatingDemo";
     CFBundleInfoDictionaryVersion = "6.0";
     CFBundleInfoPlistURL = "Info.plist -- file:///var/mobile/Containers/Bundle/Application/BA985001-4586-4DE2-9BC9-8BD53EFBAB73/AntiCheatingDemo.app/";
     CFBundleName = "\U53cd\U4f5c\U5f0aDemo";
     CFBundleNumericVersion = 16809984;
     CFBundlePackageType = APPL;
     CFBundleShortVersionString = "1.0";
     CFBundleSupportedPlatforms =     (
     iPhoneOS
     );
     CFBundleVersion = 1;
     DTCompiler = "com.apple.compilers.llvm.clang.1_0";
     DTPlatformBuild = 14E8301;
     DTPlatformName = iphoneos;
     DTPlatformVersion = "10.3";
     DTSDKBuild = 14E8301;
     DTSDKName = "iphoneos10.3";
     DTXcode = 0833;
     DTXcodeBuild = 8E3004b;
     LSRequiresIPhoneOS = 1;
     MinimumOSVersion = "9.0";
     UIDeviceFamily =     (
     1,
     2
     );
     UILaunchStoryboardName = LaunchScreen;
     UIMainStoryboardFile = Main;
     UIRequiredDeviceCapabilities =     (
     arm64
     );
     UISupportedInterfaceOrientations =     (
     UIInterfaceOrientationPortrait,
     UIInterfaceOrientationLandscapeLeft,
     UIInterfaceOrientationLandscapeRight
     );
     }
     */
    NSArray * allFrameworksInfo = [NSBundle allFrameworks];
    NSLog(@"allFrameworksInfo :%@",allFrameworksInfo);
    /*
     (
     "NSBundle </System/Library/Frameworks/CoreMotion.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/SAObjects.framework> (loaded)",
     "NSBundle </System/Library/Frameworks/JavaScriptCore.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/CoreDuet.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/FrontBoardServices.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/SpringBoardUIServices.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/IncomingCallFilter.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/FontServices.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/IDS.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/ToneLibrary.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/Accessibility.framework/Frameworks/AccessibilityUIUtilities.framework> (loaded)",
     "NSBundle </System/Library/Frameworks/CoreData.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/Accessibility.framework/Frameworks/AccessibilityUI.framework> (loaded)",
     "NSBundle </System/Library/Frameworks/ModelIO.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/UserNotificationServices.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/CrashReporterSupport.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/Celestial.framework> (loaded)",
     "NSBundle </System/Library/Frameworks/GLKit.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/StoreServices.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/IMFoundation.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/SpringBoardUI.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/ConstantClasses.framework> (loaded)",
     "NSBundle </var/mobile/Containers/Bundle/Application/BA985001-4586-4DE2-9BC9-8BD53EFBAB73/AntiCheatingDemo.app/Frameworks> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/AccessibilityUtilities.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/CoreDuetDaemonProtocol.framework> (loaded)",
     "NSBundle </System/Library/Frameworks/Foundation.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/SpringBoardServices.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/CoreUI.framework> (loaded)",
     "NSBundle </System/Library/Frameworks/CoreText.framework> (loaded)",
     "NSBundle </System/Library/Frameworks/OpenGLES.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/MobileInstallation.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/AssistantServices.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/AggregateDictionary.framework> (loaded)",
     "NSBundle </Developer/Library/PrivateFrameworks/DTDDISupport.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/LanguageModeling.framework> (loaded)",
     "NSBundle </System/Library/Frameworks/AudioToolbox.framework> (loaded)",
     "NSBundle </System/Library/Frameworks/AddressBook.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/VoiceServices.framework> (loaded)",
     "NSBundle </System/Library/Frameworks/CoreTelephony.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/BaseBoardUI.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/ProofReader.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/FaceCore.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/CommunicationsFilter.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/IntlPreferences.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/SpringBoardFoundation.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/Marco.framework> (loaded)",
     "NSBundle </System/Library/Frameworks/MobileCoreServices.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/TextToSpeech.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/MobileAsset.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/DiagnosticLogCollection.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/TextInput.framework> (loaded)",
     "NSBundle </System/Library/Frameworks/CoreFoundation.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/AppSupport.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/OAuth.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/BackBoardServices.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/PhysicsKit.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/DataMigration.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/ProgressUI.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/WebCore.framework> (loaded)",
     "NSBundle </System/Library/Frameworks/NetworkExtension.framework> (loaded)",
     "NSBundle </System/Library/Frameworks/CFNetwork.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/IDSFoundation.framework> (loaded)",
     "NSBundle </System/Library/Frameworks/MetalPerformanceShaders.framework> (loaded)",
     "NSBundle </usr/lib/system> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/WebKitLegacy.framework> (loaded)",
     "NSBundle </Library/MobileSubstrate/DynamicLibraries> (loaded)",
     "NSBundle </System/Library/Frameworks/AVFoundation.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/TelephonyUI.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/MediaRemote.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/PowerLog.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/GraphicsServices.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/PersistentConnection.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/AssertionServices.framework> (loaded)",
     "NSBundle </System/Library/Frameworks/Accounts.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/BulletinBoard.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/BaseBoard.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/ManagedConfiguration.framework> (loaded)",
     "NSBundle </System/Library/Frameworks/QuartzCore.framework> (loaded)",
     "NSBundle </System/Library/Frameworks/CoreMedia.framework> (loaded)",
     "NSBundle </System/Library/Frameworks/Metal.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/NotificationsUI.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/CoreTime.framework> (loaded)",
     "NSBundle </System/Library/Frameworks/UIKit.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/ScreenReaderCore.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/CaptiveNetwork.framework> (loaded)",
     "NSBundle </System/Library/Frameworks/Accelerate.framework/Frameworks/vecLib.framework> (loaded)",
     "NSBundle </System/Library/Frameworks/MediaToolbox.framework> (loaded)",
     "NSBundle </usr/lib/system/introspection> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/FTServices.framework> (loaded)",
     "NSBundle </System/Library/Frameworks/CoreImage.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/DataAccessExpress.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/Network.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/TelephonyUtilities.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/CommonUtilities.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/DictionaryServices.framework> (loaded)",
     "NSBundle </System/Library/Frameworks/CoreAudio.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/Quagga.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/HangTracer.framework> (loaded)",
     "NSBundle </System/Library/Frameworks/CoreBluetooth.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/CoreDuetDebugLogging.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/MediaServices.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/ProtocolBuffer.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/Accessibility.framework/Frameworks/ZoomServices.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/UIFoundation.framework> (loaded)",
     "NSBundle </System/Library/Frameworks/CoreVideo.framework> (loaded)",
     "NSBundle </System/Library/PrivateFrameworks/NetworkStatistics.framework> (loaded)"
     )
     */
    NSArray * allBundles = [NSBundle allBundles];
    NSLog(@"allBundles: %@",allBundles);
    /*
     (
     "NSBundle </usr/lib> (loaded)",
     "NSBundle </var/mobile/Containers/Bundle/Application/BA985001-4586-4DE2-9BC9-8BD53EFBAB73/AntiCheatingDemo.app> (loaded)",
     "NSBundle </System/Library/Frameworks/UIKit.framework/Artwork.bundle> (not yet loaded)",
     "NSBundle </System/Library/AccessibilityBundles/AccessibilitySettingsLoader.bundle> (loaded)"
     )
     */
    
    //file:///var/mobile/Containers/Bundle/Application/B5ACD742-EBBB-434F-8CF0-B23AE3EC49A1/AntiCheatingDemo.app/
    NSString * resourceURL = [NSString stringWithFormat:@"%@",[bundleInfo resourceURL]];
    NSLog(@"resourceURL :%@",resourceURL);
    
    NSString * executableURL = [NSString stringWithFormat:@"%@",[bundleInfo executableURL]];
    NSLog(@"executableURL ; %@",executableURL);

}

- (void)GetDeviceVPNInfo{
    NSLog(@"******************GetDeviceVPNInfo************************ \n");
    //#import <NetworkExtension/NetworkExtension.h>
    NEVPNManager *vpnManage = [NEVPNManager sharedManager];
    
    [vpnManage loadFromPreferencesWithCompletionHandler:^(NSError * _Nullable error) {
        NSLog(@"%@",error.localizedDescription);
    }];
    NEVPNConnection *connection = vpnManage.connection;
    NSString *vpnStatus;
    switch (connection.status) {
        case NEVPNStatusInvalid:    //未配置
            vpnStatus =@"NEVPNStatusInvalid";
            break;
        case NEVPNStatusConnected: //vpn 连接
            vpnStatus =@"NEVPNStatusConnected";
            break;
        case NEVPNStatusConnecting: //VPN 正在连接
            vpnStatus =@"NEVPNStatusConnecting";
            break;
        case NEVPNStatusReasserting: //VPN连接在底层网络连接丢失
            vpnStatus =@"NEVPNStatusReasserting";
            break;
        case NEVPNStatusDisconnected: //VPN失去连接
            vpnStatus =@"NEVPNStatusDisconnected";
            break;
        case NEVPNStatusDisconnecting: //VPN正在断开连接
            vpnStatus =@"NEVPNStatusDisconnecting";
            break;
        default:
            break;
    }
    
    NSLog(@"vpnStatus : %@",vpnStatus);
    
    
    NSArray * onDemandRules = [vpnManage onDemandRules];
    NSLog(@"onDemandRules: %@",onDemandRules);
    
    NSString * localizedDescription = [vpnManage localizedDescription];
    NSLog(@"localizedDescription : %@",localizedDescription);
    
    NEVPNProtocol * protocolConfiguration = [vpnManage protocolConfiguration];
    NSLog(@"protocolConfiguration :%@",protocolConfiguration);
    
    NEVPNConnection * myconnection =[vpnManage connection];
    NSLog(@"connection :%@",myconnection);
    
    
    

}

- (void)GetTelephonyNetworkInfo{
     NSLog(@"******************GetTelephonyNetworkInfo************************ \n");
    //#import <CoreTelephony/CTTelephonyNetworkInfo.h>
    //#import <CoreTelephony/CTCarrier.h>
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [info subscriberCellularProvider];
    NSString *carrierName =[carrier carrierName];  // 运营商名称
    NSString *isoCountryCode = [carrier isoCountryCode]; //国家代码
    NSString *mobileCountryCode =[carrier mobileCountryCode]; // 国家移动码
    NSString *mobileNetworkCode = [carrier mobileNetworkCode]; //
    
    NSLog(@"carrierName: %@ \n isoCountryCode:%@ \n mobileCountryCode:%@ \n mobileNetworkCode:%@",carrierName,isoCountryCode,mobileCountryCode,mobileNetworkCode);
}

- (void)GetLocationInfo{
    NSLog(@"******************GetLocationInfo************************ \n");
}


- (NSString *)GetiPhoneSysTypeWithMachine:(NSString *)machineStr{

    if ([machineStr isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([machineStr isEqualToString:@"iPhone3,2"])    return @"iPhone 4";
    if ([machineStr isEqualToString:@"iPhone3,3"])    return @"iPhone 4";
    if ([machineStr isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([machineStr isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([machineStr isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (GSM+CDMA)";
    if ([machineStr isEqualToString:@"iPhone5,3"])    return @"iPhone 5c (GSM)";
    if ([machineStr isEqualToString:@"iPhone5,4"])    return @"iPhone 5c (GSM+CDMA)";
    if ([machineStr isEqualToString:@"iPhone6,1"])    return @"iPhone 5s (GSM)";
    if ([machineStr isEqualToString:@"iPhone6,2"])    return @"iPhone 5s (GSM+CDMA)";
    if ([machineStr isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([machineStr isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([machineStr isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([machineStr isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([machineStr isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    // 日行两款手机型号均为日本独占，可能使用索尼FeliCa支付方案而不是苹果支付
    if ([machineStr isEqualToString:@"iPhone9,1"])    return @"国行、日版、港行iPhone 7";
    if ([machineStr isEqualToString:@"iPhone9,2"])    return @"港行、国行iPhone 7 Plus";
    if ([machineStr isEqualToString:@"iPhone9,3"])    return @"美版、台版iPhone 7";
    if ([machineStr isEqualToString:@"iPhone9,4"])    return @"美版、台版iPhone 7 Plus";
    
    if ([machineStr isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([machineStr isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([machineStr isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([machineStr isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([machineStr isEqualToString:@"iPod5,1"])      return @"iPod Touch (5 Gen)";
    
    if ([machineStr isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([machineStr isEqualToString:@"iPad1,2"])      return @"iPad 3G";
    if ([machineStr isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([machineStr isEqualToString:@"iPad2,2"])      return @"iPad 2";
    if ([machineStr isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([machineStr isEqualToString:@"iPad2,4"])      return @"iPad 2";
    if ([machineStr isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
    if ([machineStr isEqualToString:@"iPad2,6"])      return @"iPad Mini";
    if ([machineStr isEqualToString:@"iPad2,7"])      return @"iPad Mini (GSM+CDMA)";
    if ([machineStr isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([machineStr isEqualToString:@"iPad3,2"])      return @"iPad 3 (GSM+CDMA)";
    if ([machineStr isEqualToString:@"iPad3,3"])      return @"iPad 3";
    if ([machineStr isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([machineStr isEqualToString:@"iPad3,5"])      return @"iPad 4";
    if ([machineStr isEqualToString:@"iPad3,6"])      return @"iPad 4 (GSM+CDMA)";
    if ([machineStr isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
    if ([machineStr isEqualToString:@"iPad4,2"])      return @"iPad Air (Cellular)";
    if ([machineStr isEqualToString:@"iPad4,4"])      return @"iPad Mini 2 (WiFi)";
    if ([machineStr isEqualToString:@"iPad4,5"])      return @"iPad Mini 2 (Cellular)";
    if ([machineStr isEqualToString:@"iPad4,6"])      return @"iPad Mini 2";
    if ([machineStr isEqualToString:@"iPad4,7"])      return @"iPad Mini 3";
    if ([machineStr isEqualToString:@"iPad4,8"])      return @"iPad Mini 3";
    if ([machineStr isEqualToString:@"iPad4,9"])      return @"iPad Mini 3";
    if ([machineStr isEqualToString:@"iPad5,1"])      return @"iPad Mini 4 (WiFi)";
    if ([machineStr isEqualToString:@"iPad5,2"])      return @"iPad Mini 4 (LTE)";
    if ([machineStr isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
    if ([machineStr isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
    if ([machineStr isEqualToString:@"iPad6,3"])      return @"iPad Pro 9.7";
    if ([machineStr isEqualToString:@"iPad6,4"])      return @"iPad Pro 9.7";
    if ([machineStr isEqualToString:@"iPad6,7"])      return @"iPad Pro 12.9";
    if ([machineStr isEqualToString:@"iPad6,8"])      return @"iPad Pro 12.9";
    
    if ([machineStr isEqualToString:@"AppleTV2,1"])      return @"Apple TV 2";
    if ([machineStr isEqualToString:@"AppleTV3,1"])      return @"Apple TV 3";
    if ([machineStr isEqualToString:@"AppleTV3,2"])      return @"Apple TV 3";
    if ([machineStr isEqualToString:@"AppleTV5,3"])      return @"Apple TV 4";
    
    if ([machineStr isEqualToString:@"i386"])         return @"Simulator";
    if ([machineStr isEqualToString:@"x86_64"])       return @"Simulator";
    
    return @"未查找到对应型号" ;
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
