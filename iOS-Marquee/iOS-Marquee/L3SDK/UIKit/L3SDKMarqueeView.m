//
//  L3SDKMarqueeView.m
//  iOS-Marquee
//
//  Created by Domenico Vacchiano on 28/09/15.
//  Copyright © 2015 DomenicoVacchiano. All rights reserved.
//

#import "L3SDKMarqueeView.h"

@interface L3SDKMarqueeView ()
//local property to store the scroll direction
@property (nonatomic,assign)L3SDKMarqueeDirection direction;
//local property to store the animation speed
@property (nonatomic,assign)float speed;
//local property to store the content view
@property (nonatomic,strong)UIView*content;
//local property to store the scrolling state (play/stop)
@property (nonatomic,assign)BOOL isPlaying;
//allows to start the scrolling animation
-(void)scrollContentView:(UIView*)content toDirection:(L3SDKMarqueeDirection)direction withSpeed:(float)speed;
//allows to stop the scrolling animation
-(void)pauseLayer:(CALayer*)layer;
//allows to resume the scrolling animation
-(void)resumeLayer:(CALayer*)layer;
@end
@implementation L3SDKMarqueeView


-(instancetype)initWithFrame:(CGRect)frame
                  andContent:(UIView*)content
                andDirection:(L3SDKMarqueeDirection)direction
                    andSpeed:(float)speed{

    
    return [self initWithFrame:frame andContent:content andDirection:direction andSpeed:speed andAutoPlay:YES];

}
-(instancetype)initWithFrame:(CGRect)frame
                  andContent:(UIView*)content
                andDirection:(L3SDKMarqueeDirection)direction
                    andSpeed:(float)speed andAutoPlay:(BOOL)autoPlay{

    self=[super initWithFrame:frame];
    if (self) {
        //add conten view
        [self addSubview:content];
        //init local properties
        self.content=content;
        self.direction=direction;
        self.speed=speed;
        self.isPlaying=autoPlay;
        if (autoPlay) {
            //start animation
            [self scrollContentView:self.content toDirection:self.direction withSpeed:self.speed];
        }
    }
    return self;
    
}


-(void)scrollContentView:(UIView*)content toDirection:(L3SDKMarqueeDirection)direction withSpeed:(float)speed{
    
    CGRect newFrame;
    CGRect resetFrame;
    
    //defines the amount of the translation (scrolling) to the x axis
    int xProgression=15;

    
    float newX=0;
    float resetX=0;
    
    switch (direction) {
        case L3SDKMarqueeDirectionLeft:
            //if the scrolling happens to the left, to define a new translate frame
            //we have to subtract the translation amount (xProgression) from the current x position
            newX=content.frame.origin.x-xProgression;
            //when the scroll will be completed (out of the left side) we have to restart
            //the scrolling from the right side
            resetX=self.frame.size.width;
            break;
        case L3SDKMarqueeDirectionRight:
            //if the scrolling happens to the right, to define a new translate frame
            //we have to add the translation amount (xProgression) from the current x position
            newX=content.frame.origin.x+xProgression;
            //when the scroll will be completed (out of the right side) we have to restart
            //the scrolling from the left side
            resetX=self.frame.origin.x-content.frame.size.width;
            break;
        default:
            break;
    }
    
    //defines the scrolling frame
    newFrame=CGRectMake(
                        newX,
                        content.frame.origin.y,
                        content.frame.size.width,
                        content.frame.size.height
                        );
    //this frame will be applied to the content view to restart the scolling
    //on the opposite side
    resetFrame=CGRectMake(
                          resetX,
                          content.frame.origin.y,
                          content.frame.size.width,
                          content.frame.size.height
                          );
    
    //defines an animation
    [UIView animateWithDuration:speed
                          delay:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         content.frame =newFrame;
                     }
                     completion:^(BOOL finished){
                         BOOL isResetFrame=NO;

                          //checks if the scrolling is completed on the right/left side
                         // and restart the scrolling on the opposite side
                         switch (direction) {
                             case L3SDKMarqueeDirectionRight:
                                
                                 if (content.frame.origin.x >=self.frame.size.width) {
                                     isResetFrame=YES;
                                 }
                                 break;
                             case L3SDKMarqueeDirectionLeft:
                                 if ((content.frame.origin.x+content.frame.size.width)<=-self.frame.origin.x) {
                                     isResetFrame=YES;
                                 }
                                 break;
                             default:
                                 break;
                         }

                         if (isResetFrame) {
                             content.frame = resetFrame;
                         }
                         //recursive call
                         [self scrollContentView:content toDirection:direction withSpeed:speed];
                     }];

    
}
-(void)play{
    //play/restart animation
    if (self.isPlaying) {
        return;
    }
    self.isPlaying=YES;
    [self resumeLayer:self.content.layer];
}
-(void)stop{
    //stop current animation
    if (self.isPlaying) {
        self.isPlaying=NO;
        [self pauseLayer:self.content.layer];
    }
}

/////////////////////////////////////////////////////////////////
//see
//https://developer.apple.com/library/ios/qa/qa1673/_index.html
-(void)pauseLayer:(CALayer*)layer{
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;
}
-(void)resumeLayer:(CALayer*)layer{
    CFTimeInterval pausedTime = [layer timeOffset];
    layer.speed = 1.0;
    layer.timeOffset = 0.0;
    layer.beginTime = 0.0;
    CFTimeInterval timeSincePause = [layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    layer.beginTime = timeSincePause;
}
/////////////////////////////////////////////////////////////////

@end
