//
//  ViewController.m
//  iOS-Marquee
//
//  Created by Domenico Vacchiano on 28/09/15.
//  Copyright © 2015 DomenicoVacchiano. All rights reserved.
//

#import "ViewController.h"
#import "L3SDKMarqueeView.h"

@interface ViewController ()
@property (nonatomic,strong) L3SDKMarqueeView*leftMarqueeView;
@property (nonatomic,strong) L3SDKMarqueeView*rightMarqueeView;
@property (nonatomic,strong) L3SDKMarqueeView*imagesMarqueeView;
-(IBAction)stopMarquee:(id)sender;
-(IBAction)playMarquee:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    

    [super viewDidLoad];
    
    //deinfes an UILabel
    UILabel*leftMarqueeLabel=[[UILabel alloc]initWithFrame:
                              CGRectMake(
                                        self.view.bounds.size.width,
                                        0,
                                        self.view.bounds.size.width/2,
                                        50)
                              ];
    leftMarqueeLabel.textColor=[UIColor whiteColor];
    leftMarqueeLabel.text=@"marquee scrolling to the left side";
    leftMarqueeLabel.font=[UIFont fontWithName:@"Verdana" size:40];
    [leftMarqueeLabel sizeToFit];

    //init a L3SDKMarqueeView instance with a label
    self.leftMarqueeView=[[L3SDKMarqueeView alloc] initWithFrame:
                      CGRectMake(0, self.view.bounds.size.height/4, self.view.bounds.size.width, 50)
                                                  andContent:leftMarqueeLabel
                                                andDirection:L3SDKMarqueeDirectionLeft
                                                    andSpeed:0.5];
    
    self.leftMarqueeView.backgroundColor=[UIColor redColor];
    [self.view addSubview:self.leftMarqueeView];
    
    
    //deinfes an UILabel
    UILabel*rightMarqueeLabel=[[UILabel alloc]initWithFrame:
                               CGRectMake(
                                          0,
                                          0,
                                          self.view.bounds.size.width/2,
                                          50
                                          )
                               ];
    rightMarqueeLabel.textColor=[UIColor whiteColor];
    rightMarqueeLabel.text=@"marquee scrolling to the right side.";
    rightMarqueeLabel.font=[UIFont fontWithName:@"Verdana" size:40];
    [rightMarqueeLabel sizeToFit];

    //init a L3SDKMarqueeView instance with a label
    self.rightMarqueeView=[[L3SDKMarqueeView alloc] initWithFrame:
                          CGRectMake(0, self.view.bounds.size.height/3+15, self.view.bounds.size.width, 50)
                                                      andContent:rightMarqueeLabel
                                                    andDirection:L3SDKMarqueeDirectionRight
                                                        andSpeed:0.3 andAutoPlay:YES];
    
    self.rightMarqueeView.backgroundColor=[UIColor blueColor];
    [self.view addSubview:self.rightMarqueeView];
    
    
    //init a view with some square subviews: you can replace square subviews with UIImageView
    UIView*scollableView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
    
    UIImageView*square1=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, scollableView.frame.size.width/3, 200)];
    square1.image=[UIImage imageNamed:@"mountain_1.jpg"];
    
    UIImageView*square2=[[UIImageView alloc] initWithFrame:CGRectMake(square1.frame.origin.x + square1.frame.size.width +15, 0, scollableView.frame.size.width/3, 200)];
    square2.image=[UIImage imageNamed:@"mountain_2.jpeg"];
    
    UIImageView*square3=[[UIImageView alloc] initWithFrame:CGRectMake(square2.frame.origin.x + square2.frame.size.width +15, 0, scollableView.frame.size.width/3, 200)];
    square3.image=[UIImage imageNamed:@"mountain_3.jpg"];
    

    
    [scollableView addSubview:square1];
    [scollableView addSubview:square2];
    [scollableView addSubview:square3];

    //init a L3SDKMarqueeView instance with a view
    self.imagesMarqueeView=[[L3SDKMarqueeView alloc] initWithFrame:
                           CGRectMake(0, self.view.bounds.size.height/2, self.view.bounds.size.width, 200)
                                                       andContent:scollableView
                                                     andDirection:L3SDKMarqueeDirectionLeft
                                                         andSpeed:0.3 andAutoPlay:YES];
    

    [self.view addSubview:self.imagesMarqueeView];
    

}
-(IBAction)stopMarquee:(id)sender{
    [self.leftMarqueeView stop];
    [self.rightMarqueeView stop];
    [self.imagesMarqueeView stop];
}
-(IBAction)playMarquee:(id)sender{
    [self.leftMarqueeView play];
    [self.rightMarqueeView play];
    [self.imagesMarqueeView play];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
