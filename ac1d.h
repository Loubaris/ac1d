#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <AppSupport/CPDistributedMessagingCenter.h>
#import <CoreFoundation/CoreFoundation.h>
#import <CoreLocation/CoreLocation.h>
#import <AudioToolbox/AudioToolbox.h>
#import <MediaPlayer/MediaPlayer.h>
#import <UIKit/UIAlertView.h>
#import <UIKit/UIKit.h>

#include "SpringBoardServices/SpringBoardServices.h"

@interface ac1d : NSObject {
}

CFArrayRef SBSCopyApplicationDisplayIdentifiers(bool onlyActive, bool debuggable);
extern int SBSLaunchApplicationWithIdentifier(CFStringRef identifier, Boolean suspended);

@property (retain) UIDevice *thisUIDevice;
@property (retain) CPDistributedMessagingCenter *messagingCenter;

-(void)alert:(NSString *)title:(NSString *)message;
-(void)battery;
-(void)locate;
-(void)getvol;
-(void)openurl:(NSString *)url;
-(void)openapp:(NSString *)application;
-(void)sysinfo;
-(void)player:(NSString *)option;

-(void)send_command:(NSString *)command;
-(void)send_reply_command:(NSString *)command;

@end
