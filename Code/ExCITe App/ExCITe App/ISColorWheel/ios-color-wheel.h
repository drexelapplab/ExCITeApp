

#import <UIKit/UIKit.h>

@class ISColorWheel;

@protocol ISColorWheelDelegate <NSObject>
- (void)colorWheelDidChangeColor:(UIColor *)color;
@end


@interface ISColorWheel : UIView
{
    UIImage *_radialImage;
    CGPoint _touchPoint;
}

@property (nonatomic, assign) float radius;
@property (nonatomic, assign) float cursorRadius;
@property (nonatomic, assign) float brightness;
@property (nonatomic, assign) bool continuous;
@property (nonatomic, assign) id <ISColorWheelDelegate> delegate;

- (void)updateImage;
- (UIColor *)currentColor;
- (void)setTouchPoint:(CGPoint)point;

@end
