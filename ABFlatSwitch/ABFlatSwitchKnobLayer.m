//
//  ABRoundSwitchKnobLayer.m
//
//  Created by Patrick Richards on 29/06/11.
//  Modified by Andy Brett on 21/04/13
//  MIT License.
//

#import "ABFlatSwitchKnobLayer.h"

CGGradientRef CreateGradientRefWithColors(CGColorSpaceRef colorSpace, UIColor* startColor, UIColor* endColor);

@implementation ABFlatSwitchKnobLayer
@synthesize gripped;

- (void)drawInContext:(CGContextRef)context
{
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
    int insetRadius = 2;
    if (self.inset) insetRadius = 5;
	CGRect knobRect = CGRectInset(self.bounds, insetRadius, insetRadius);
	CGFloat knobRadius = self.bounds.size.height - insetRadius;

	// knob outline
	CGContextSetStrokeColorWithColor(context, [UIColor colorWithWhite:0.62 alpha:1.0].CGColor);
	CGContextSetLineWidth(context, 1.5);
	CGContextStrokeEllipseInRect(context, knobRect);
	CGContextSetShadowWithColor(context, CGSizeMake(0, 0), 0, NULL);

	// no gradient, just fill
	CGContextAddEllipseInRect(context, knobRect);
	CGContextClip(context);
	UIColor* knobStartColor = [UIColor colorWithWhite:0.82 alpha:1.0];
    UIColor* knobEndColor = knobStartColor;
	CGPoint topPoint = CGPointMake(0, 0);
	CGPoint bottomPoint = CGPointMake(0, knobRadius + 2);
	CGGradientRef knobGradient = CreateGradientRefWithColors(colorSpace, knobStartColor, knobEndColor);
	CGContextDrawLinearGradient(context, knobGradient, topPoint, bottomPoint, 0);
	CGGradientRelease(knobGradient);

	// knob inner circle
	CGContextAddEllipseInRect(context, CGRectInset(knobRect, 0.5, 0.5));
	CGContextAddEllipseInRect(context, CGRectInset(knobRect, 1.5, 1.5));
	CGContextEOClip(context);
	CGGradientRef knobHighlightGradient = CreateGradientRefWithColors(colorSpace, [UIColor whiteColor], [UIColor colorWithWhite:1.0 alpha:1.0]);
	CGContextDrawLinearGradient(context, knobHighlightGradient, topPoint, bottomPoint, 0);
	CGGradientRelease(knobHighlightGradient);

	CGColorSpaceRelease(colorSpace);
}

CGGradientRef CreateGradientRefWithColors(CGColorSpaceRef colorSpace, UIColor* startColor, UIColor* endColor)
{
	CGFloat colorStops[2] = {0.0, 1.0};
    NSArray *colors = [NSArray arrayWithObjects:(__bridge id)startColor.CGColor, (__bridge id) endColor.CGColor, nil];
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)(colors), colorStops);
	return gradient;
}

- (void)setGripped:(BOOL)newGripped
{
	gripped = newGripped;
	[self setNeedsDisplay];
}

@end
