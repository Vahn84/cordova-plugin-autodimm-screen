//
//  AutoDimmScreenPlugin.h
//  Smartphoners
//
//  Created by Fabio Cingolani on 29/04/16.
//
//

#import <Cordova/CDV.h>
#import <CoreMotion/CoreMotion.h>


@interface AutoDimmScreenPlugin : CDVPlugin
    
    @property bool hasToBeDimmed;
    @property CMMotionManager* motionManager;
    @property NSInteger updateInterval;
    @property float oldBrightness;
    
    
- (void) checkForDimming:(CDVInvokedUrlCommand *) command;
- (void) stopDimmChecker:(CDVInvokedUrlCommand *) command;
- (void) lowBrightness;
- (void) restoreBrightness;
- (void) startAccelerometerUpdates;
- (void) stopUpdates;
    
    
    @end
