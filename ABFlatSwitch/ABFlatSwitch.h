//
//  ABRoundSwitch.h
//
//  Created by Patrick Richards on 29/06/11.
//  Modified by Andy Brett on 21/04/13
//  MIT License.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@class ABFlatSwitchToggleLayer;
@class ABFlatSwitchKnobLayer;

@interface ABFlatSwitch : UIControl

@property (nonatomic, strong) UIColor *onTintColor;		// default: blue (matches normal UISwitch)
@property (nonatomic, strong) UIColor *offTintColor;    // default: white (matches normal UISwitch)
@property (nonatomic) BOOL knobInset;                   // default: NO
@property (nonatomic, getter=isOn) BOOL on;				// default: NO
@property (nonatomic, strong) NSString *onText;         // default: 'ON' - automatically localized
@property (nonatomic, strong) NSString *offText;        // default: 'OFF' - automatically localized
@property (nonatomic, strong) UIFont *labelFont;
@property (nonatomic, strong) UIColor *labelColor;

+ (Class)knobLayerClass;
+ (Class)toggleLayerClass;

- (void)setOn:(BOOL)newOn animated:(BOOL)animated;
- (void)setOn:(BOOL)newOn animated:(BOOL)animated ignoreControlEvents:(BOOL)ignoreControlEvents;

@end