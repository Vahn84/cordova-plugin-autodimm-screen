//
//  PhoneStateDetectionPlugin.m
//  Smartphoners
//
//  Created by Fabio Cingolani on 29/04/16.
//
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

#import "AutoDimmScreenPlugin"


@implementation AutoDimmScreenPlugin : CDVPlugin
    
- (void) checkForDimming:(CDVInvokedUrlCommand *) command {
  
            
            //The call state Ended.
            NSLog(@"hasToBeDimmed");
            NSMutableDictionary *jsonObj = [ [NSMutableDictionary alloc]
                                            initWithObjectsAndKeys :
                                            [NSNumber numberWithBool:_isPhoneRinging], @"isPhoneRinging",
                                            [NSNumber numberWithBool:_isInPhoneCall], @"isInPhoneCall",
                                            [NSNumber numberWithBool:_isMissedCall], @"isMissedCall",
                                            [NSNumber numberWithBool:_isHeadsetOn], @"isHeadsetOn",
                                            [NSNumber numberWithBool:_isCallEnded], @"isCallEnded",
                                            nil
                                            ];
            CDVPluginResult *pluginResult = [ CDVPluginResult
                                             resultWithStatus    : CDVCommandStatus_OK
                                             messageAsDictionary : jsonObj
                                             ];
            [pluginResult setKeepCallbackAsBool:YES];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        
        
 
}
    
- (void) restoreBrightness:(CDVInvokedUrlCommand *) command {
   
}
    

    
    
    @end
