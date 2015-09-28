//
//  L3SDKMarqueeView.h
//  iOS-Marquee
//
//  Created by Domenico Vacchiano on 28/09/15.
//  Copyright © 2015 DomenicoVacchiano. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    L3SDKMarqueeDirectionRight,
    L3SDKMarqueeDirectionLeft
} L3SDKMarqueeDirection;

@interface L3SDKMarqueeView : UIView

//init view
-(instancetype)initWithFrame:(CGRect)frame
                  andContent:(UIView*)content
                andDirection:(L3SDKMarqueeDirection)direction
                    andSpeed:(float)speed;

-(instancetype)initWithFrame:(CGRect)frame
                  andContent:(UIView*)content
                andDirection:(L3SDKMarqueeDirection)direction
                    andSpeed:(float)speed andAutoPlay:(BOOL)autoPlay;

//start scrolling animation
-(void)play;
//stop scrolling animation
-(void)stop;
@end
