//
//  ABRoundSwitchToggleLayer.h
//
//  Created by Patrick Richards on 29/06/11.
//  Modified by Andy Brett on 21/04/13
//  MIT License.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface ABFlatSwitchToggleLayer : CALayer

@property (nonatomic, retain) UIColor *onTintColor;
@property (nonatomic, retain) UIColor *offTintColor;
@property (nonatomic, retain) NSString *onString;
@property (nonatomic, retain) NSString *offString;
@property (nonatomic, retain) UIFont *labelFont;
@property (nonatomic, retain) UIColor *labelColor;
@property (nonatomic) BOOL drawOnTint;
@property (nonatomic) BOOL drawOffTint;
@property (nonatomic) BOOL clip;

- (id)initWithOnString:(NSString *)anOnString offString:(NSString *)anOffString onTintColor:(UIColor *)anOnTintColor offTintColor:(UIColor*)anOffTintColor;

@end