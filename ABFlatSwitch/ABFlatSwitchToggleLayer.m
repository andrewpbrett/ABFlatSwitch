//
//  ABRoundSwitchToggleLayer.m
//
//  Created by Patrick Richards on 29/06/11.
//  Modified by Andy Brett on 21/04/13
//  MIT License.
//

#import "ABFlatSwitchToggleLayer.h"

@implementation ABFlatSwitchToggleLayer
@synthesize onString, offString, onTintColor, offTintColor;
@synthesize drawOnTint, drawOffTint;
@synthesize clip;
@synthesize labelFont, labelColor;

- (id)initWithOnString:(NSString *)anOnString offString:(NSString *)anOffString onTintColor:(UIColor *)anOnTintColor offTintColor:(UIColor *)anOffTintColor
{
	if ((self = [super init]))
	{
		self.onString = anOnString;
		self.offString = anOffString;
		self.onTintColor = anOnTintColor;
        self.offTintColor = anOffTintColor;
	}
    
	return self;
}

- (UIFont *)labelFont
{
	if (labelFont != nil)
		return labelFont;
	else
		return [UIFont boldSystemFontOfSize:ceilf(self.bounds.size.height * .6)];
}

- (void)drawInContext:(CGContextRef)context
{
	CGFloat knobRadius = self.bounds.size.height - 2.0;
	CGFloat knobCenter = self.bounds.size.width / 2.0;
    
	if (self.clip)
	{
		UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(-self.frame.origin.x + 0.5, 0, self.bounds.size.width / 2.0 + self.bounds.size.height / 2.0 - 1.5, self.bounds.size.height) cornerRadius:self.bounds.size.height / 2.0];
		CGContextAddPath(context, bezierPath.CGPath);
		CGContextClip(context);
	}
    
	// on tint color
	if (self.drawOnTint)
	{
		CGContextSetFillColorWithColor(context, self.onTintColor.CGColor);
		CGContextFillRect(context, CGRectMake(0, 0, knobCenter, self.bounds.size.height));
	}
    
	// off tint color
    if (self.drawOffTint) {
        CGContextSetFillColorWithColor(context, offTintColor.CGColor);
        CGContextFillRect(context, CGRectMake(knobCenter, 0, self.bounds.size.width - knobCenter, self.bounds.size.height));
    }
    
	// strings
	CGFloat textSpaceWidth = (self.bounds.size.width / 2) - (knobRadius / 2);
    
	UIGraphicsPushContext(context);
    
	// 'ON' state label (self.onString)
	CGSize onTextSize = [self.onString sizeWithFont:self.labelFont];
	CGPoint onTextPoint = CGPointMake((textSpaceWidth - onTextSize.width) / 2.0 + knobRadius * .15, floorf((self.bounds.size.height - onTextSize.height) / 2.0)/* + 1.0*/);

	if (labelColor)
		[labelColor set];
	else
		[[UIColor whiteColor] set];
	[self.onString drawAtPoint:onTextPoint withFont:self.labelFont];
    
	// 'OFF' state label (self.offString)
	CGSize offTextSize = [self.offString sizeWithFont:self.labelFont];
	CGPoint offTextPoint = CGPointMake(textSpaceWidth + (textSpaceWidth - offTextSize.width) / 2.0 + knobRadius * .86, floorf((self.bounds.size.height - offTextSize.height) / 2.0)/* + 1.0*/);

	if (labelColor)
		[labelColor set];
	else
		[[UIColor colorWithWhite:0.96 alpha:1.0] set];
	[self.offString drawAtPoint:offTextPoint withFont:self.labelFont];
    
	UIGraphicsPopContext();
}

@end