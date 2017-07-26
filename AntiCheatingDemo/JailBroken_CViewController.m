//
//  JailBroken_CViewController.m
//  AntiCheatingDemo
//
//  Created by leo on 2017/7/6.
//  Copyright © 2017年 leo. All rights reserved.
//

#import "JailBroken_CViewController.h"

#include <sys/stat.h>
#include <unistd.h>
#include <stdio.h>
#include <dlfcn.h>
#include <mach-o/loader.h>

@interface JailBroken_CViewController ()

@end

@implementation JailBroken_CViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    struct stat buf;
    stat("/etc/fstab", &buf);
    printf("/etc/hosts file size = %lld\n", buf.st_size);
    
    
    struct stat s;
    lstat("/Library/Wallpaper",&s);
    if(s.st_mode &  S_IFLNK)
    {
        printf("the device is jailbroken");
    }else{
        printf("the device is in jail");
    }
    
    [self isJailBreak];
}

#define CYDIA_APP_PATH  "/Applications/Cydia.app"

int checkInject()
{
    int ret;
    Dl_info dylib_info;
    int (*func_stat)(const char*, struct stat*) = stat;
    
//    if ((ret = dladdr(func_stat, &dylib_info)) && strncmp(dylib_info.dli_fname, dylib.name,strlen(dylib.name))) {
//        return 0;
//    }
    return 1;
}

int checkCydia()
{
    // first ,check whether library is inject
    struct stat stat_info;
    
    if (!checkInject()) {
        if (0 == stat(CYDIA_APP_PATH, &stat_info)) {
            return 1;
        }
    } else {
        return 1;
    }
    return 0;
}

- (BOOL)isJailBreak
{
    if (checkCydia()) {
        NSLog(@"The device is jail broken!");
        return YES;
    }
    NSLog(@"The device is NOT jail broken!");
    return NO;
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
