//
//  PhoneStateDetectionPlugin.h
//  Smartphoners
//
//  Created by Fabio Cingolani on 29/04/16.
//
//

#import <Cordova/CDV.h>


@interface AutoDimmScreenPlugin : CDVPlugin

@property bool hasToBeDimmed;


- (void) dimmScreen:(CDVInvokedUrlCommand *) command;
- (void) restoreBrightness:(CDVInvokedUrlCommand *) command;


@end
