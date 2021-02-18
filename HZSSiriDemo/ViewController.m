//
//  ViewController.m
//  HZSSiriDemo
//
//  Created by H&L on 2019/11/27.
//  Copyright © 2019 H&L. All rights reserved.
//

#import "ViewController.h"
#import <Intents/Intents.h>
#import <CoreSpotlight/CoreSpotlight.h>
#import <IntentsUI/IntentsUI.h>
#import "GOHomeIntent.h"

@interface ViewController () <INUIAddVoiceShortcutViewControllerDelegate,INUIEditVoiceShortcutViewControllerDelegate,NSUserActivityDelegate>

@property (nonatomic, strong) NSUserActivity *userActivity;

@end

@implementation ViewController


/*
 ***************** NSUserActivity *******
 ** 1.需要打开App进行操作时使用
 ** 2.仅仅表示在Spotlight中的索引项目时
 ** 3.Siri建议的颗粒度较大
 ** 4.存储相应的信息，字典或字符串
 ** 5.在AppDelegate，获取NSUserActivity所存储的信息
 ** 6.发送通知给所需要的地方
 ** 7.接收到同质化主程序进行相应的操作
 */


/*
 **************** Intents ********
 ** 1.需要在Siri界面直接操作时使用
 ** 2.需要对操作添加自定义短语或自定义UI时
 ** 3.Siri会根据不同情况给出相对精确的建议
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *_addSiriBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, 151, 200, 50)];
    [_addSiriBtn setTitle:@"Add to Siri(Intent)" forState:UIControlStateNormal];
    [_addSiriBtn setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
    [_addSiriBtn addTarget:self action:@selector(buildShortcutInCurrentViewController) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_addSiriBtn];
    
    
}

- (void)buildShortcutInCurrentViewController {
    
    [self addNSUserAcitity];
    
//    [self addCustomVoiceShortcutView];
    
    
}

- (void)addNSUserAcitity {
    NSUserActivity *userActivity = [[NSUserActivity alloc] initWithActivityType:@"com.zhys.siritest"];
    userActivity.eligibleForSearch = YES;
    userActivity.title = @"这是siri";
    if (@available(iOS 10.0, *)) {
        // 新属性，赋值为trueh后可以暴露给sirikit
        [userActivity setEligibleForPrediction:YES];
        userActivity.suggestedInvocationPhrase = @"我要回家";
    }
    
    CSSearchableItemAttributeSet *attributeSet = [[CSSearchableItemAttributeSet alloc] init];
    UIImage *iconImage = [UIImage imageNamed:@""];
    attributeSet.thumbnailData = UIImagePNGRepresentation(iconImage);
    attributeSet.contentDescription = @"我要开车回家";
    userActivity.contentAttributeSet = attributeSet;
    self.userActivity = userActivity;
    userActivity.title = @"回家";
    
    INUIAddVoiceShortcutViewController *inVC = [[INUIAddVoiceShortcutViewController alloc] initWithShortcut:[[INShortcut alloc] initWithUserActivity:self.userActivity]];
    inVC.delegate = self;
    [self presentViewController:inVC animated:YES completion:^{
        
    }];
}

- (void)addCustomVoiceShortcutView {
    GOHomeIntent *intents = [[GOHomeIntent alloc] init];
    intents.location = @"智恒科技路";
    intents.time = @"下午5点";
    intents.suggestedInvocationPhrase = @"骑车回家";
    INUIAddVoiceShortcutViewController *inVC = [[INUIAddVoiceShortcutViewController alloc] initWithShortcut:[[INShortcut alloc] initWithIntent:intents]];
    inVC.delegate = self;
    [self presentViewController:inVC animated:YES completion:^{
        
    }];
}

- (void)deleteNSUserActivity {
    // 删除某个NSUserActivity
    [NSUserActivity deleteSavedUserActivitiesWithPersistentIdentifiers:@[@"com.zhys.siritest"] completionHandler:^{
        
    }];
    
    // 删除所有的NSUserActivity
    [NSUserActivity deleteAllSavedUserActivitiesWithCompletionHandler:^{
        
    }];
}

- (void)deleteShortcuts {
    // 删除全部
    [INInteraction deleteAllInteractionsWithCompletion:^(NSError * _Nullable error) {
        
    }];
    
    // 删除某个cuts
    [INInteraction deleteInteractionsWithIdentifiers:@[@""] completion:^(NSError * _Nullable error) {
        
    }];
    
    // 删除某个cuts组
    [INInteraction deleteInteractionsWithGroupIdentifier:@"" completion:^(NSError * _Nullable error) {
        
    }];
}



#pragma mark - NSUserActivityDelegate

- (void)userActivityWillSave:(NSUserActivity *)userActivity {
    
}

#pragma mark - INUIAddVoiceShortcutViewControllerDelegate

- (void)addVoiceShortcutViewController:(INUIAddVoiceShortcutViewController *)controller didFinishWithVoiceShortcut:(INVoiceShortcut *)voiceShortcut error:(NSError *)error {
    [controller dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)addVoiceShortcutViewControllerDidCancel:(INUIAddVoiceShortcutViewController *)controller {
    [controller dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark - INUIEditVoiceShortcutViewControllerDelegate

- (void)editVoiceShortcutViewController:(INUIEditVoiceShortcutViewController *)controller didUpdateVoiceShortcut:(INVoiceShortcut *)voiceShortcut error:(NSError *)error {
    
}

- (void)editVoiceShortcutViewController:(INUIEditVoiceShortcutViewController *)controller didDeleteVoiceShortcutWithIdentifier:(NSUUID *)deletedVoiceShortcutIdentifier {
    
}

- (void)editVoiceShortcutViewControllerDidCancel:(INUIEditVoiceShortcutViewController *)controller {
    
}


@end
