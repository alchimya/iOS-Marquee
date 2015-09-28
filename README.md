# iOS-Marquee
A simple implementation of a marquee effect

# How to implement an h-scrolling
Within this project/tutorial I used a very simple implementation to achive an horizontal scolling.
<br/>
A scrolling motion is a geometric tranlsation on the x-axis, so if you want to scroll (translate) to the left,
you have to subtract an arbitrary value from the current x position, otherwise if you want to scrollto the right 
you have to add this value.

![ScreenShot](https://raw.github.com/alchimya/iOS-Marquee/master/screenshots/scroll.jpg)

When the scrolling view will get to the limit of the right or left side of the grafic context (screen) 
we have to move it to the opposite side of the scolling direction.

![ScreenShot](https://raw.github.com/alchimya/iOS-Marquee/master/screenshots/scroll_left.jpg)

# How to use
To implement a scrolling effect, you have to create an instance of the class <b>L3SDKMarqueeView</b> and 
initialize it with one of the following factory methods:

```objectivec

-(instancetype)initWithFrame:(CGRect)frame
                  andContent:(UIView*)content
                andDirection:(L3SDKMarqueeDirection)direction
                    andSpeed:(float)speed;

-(instancetype)initWithFrame:(CGRect)frame
                  andContent:(UIView*)content
                andDirection:(L3SDKMarqueeDirection)direction
                    andSpeed:(float)speed
                 andAutoPlay:(BOOL)autoPlay;

```
where:
<br/>
- <b>frame</b>:is the frame of the container marquee view.
- <b>content</b>:is the view that you want to applay the scrolling. It, for instance, can be an UILabel,
but also a view with subviews (e.g. UIImageView).
- <b>direction</b>:the direction ofr the scroll and it can assume the values of L3SDKMarqueeDirectionRight or L3SDKMarqueeDirectionLeft.
- <b>speed</b>:is the scroll speed (duration of the view animation).
<br/>
<br/>
The L3SDKMarqueeView interface exposes also other two methods that allow to stop and start/resume the scrolling:
```objectivec
-(void)play;
-(void)stop;
```
![ScreenShot](https://raw.github.com/alchimya/iOS-Marquee/master/screenshots/iOS-Marquee.gif)

Here an example of how to use the L3SDKMarqueeView view.
```objectivec
//deinfes an UILabel
UILabel*leftMarqueeLabel=[[UILabel alloc]initWithFrame:CGRectMake(
                                                                  self.view.bounds.size.width,
                                                                  0,
                                                                  self.view.bounds.size.width/2,
                                                                  50)];
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
```
