//
//  AutoDimmScreenPlugin.m
//  Smartphoners
//
//  Created by Fabio Cingolani on 29/04/16.
//
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <CoreMotion/CoreMotion.h>

#import "AutoDimmScreenPlugin.h"


@implementation AutoDimmScreenPlugin : CDVPlugin
    
- (void) checkForDimming:(CDVInvokedUrlCommand *) command {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appWillResignActive:) name:UIApplicationWillResignActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appWillTerminate:) name:UIApplicationWillTerminateNotification object:nil];
    
    self.motionManager = [[CMMotionManager alloc] init];
    [self.motionManager startAccelerometerUpdates];
    self.oldBrightness = [[UIScreen mainScreen] brightness];
    
    //The call state Ended.
    NSLog(@"hasToBeDimmed");
    NSMutableDictionary *jsonObj = [ [NSMutableDictionary alloc]
                                    initWithObjectsAndKeys :
                                    [NSNumber numberWithBool:_hasToBeDimmed], @"hasToBeDimmed",
                                    nil
                                    ];
    CDVPluginResult *pluginResult = [ CDVPluginResult
                                     resultWithStatus    : CDVCommandStatus_OK
                                     messageAsDictionary : jsonObj
                                     ];
    [pluginResult setKeepCallbackAsBool:YES];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    
    
    
}
    
- (void) stopDimmChecker:(CDVInvokedUrlCommand *) command {
    [self stopUpdates];
}
    
- (void) lowBrightness {
    [[UIScreen mainScreen] setBrightness: 0.1];
}
    
- (void) restoreBrightness  {
    if ([[UIScreen mainScreen] brightness] != self.oldBrightness ) {
        [[UIScreen mainScreen] setBrightness:self.oldBrightness];
    }
}
    
- (void)startAccelerometerUpdates {
    // Check whether the accelerometer is available
    if ([self.motionManager isAccelerometerAvailable] == YES) {
        
        // Update the recurring update interval
        [self.motionManager setAccelerometerUpdateInterval:30];
        
        // Start accelerometer updates
        [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
            
            // Handler to process accelerometer data
            NSLog(@"x = %f, y = %f, z = %f.", accelerometerData.acceleration.x, accelerometerData.acceleration.y, accelerometerData.acceleration.z);
            
        }];
    }
    
}
    
- (void) stopUpdates {
    // Check whether the accelerometer is available
    if ([self.motionManager isAccelerometerActive] == YES) {
        
        // Start accelerometer updates
        [self.motionManager stopAccelerometerUpdates];
        
    }
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillResignActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillTerminateNotification object:nil];
    
    [self restoreBrightness];
}
    
-(void) appWillResignActive:(NSNotification*)note
    {
        [self restoreBrightness];
    }
    
-(void) appWillTerminate:(NSNotification*)note
    {
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillResignActiveNotification object:nil];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationWillTerminateNotification object:nil];
        
        [self restoreBrightness];
        
    }
    
    
    
    @end
