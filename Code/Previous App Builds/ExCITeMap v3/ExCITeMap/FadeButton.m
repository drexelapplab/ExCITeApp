//
//  FadingButton.m
//  ExCITeMap
//
//  Created by ExCITe Desk on 11/26/13.
//  Copyright (c) 2013 ExCITe Desk. All rights reserved.
//

#import "FadeButton.h"

@interface FadeButton () {
    NSTimer *timer;
    BOOL shouldFadeIn;
}

@end

@implementation FadeButton

- (void)startFade {
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(fade) userInfo:nil repeats:YES];
}

- (void) fade {
    if (shouldFadeIn) {
        shouldFadeIn = NO;
        [UIView animateWithDuration:1 animations:^{
            self.alpha = 1;
        }];
    } else {
        shouldFadeIn = YES;
        [UIView animateWithDuration:1 animations:^{
            self.alpha = 0.25;
        }];
    }
}

- (void)stopFade {
    [timer invalidate];
    timer = nil;
}

@end
