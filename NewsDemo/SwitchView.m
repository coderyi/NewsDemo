//
//  SwitchView.m
//  NewsDemo
//
//  Created by apple on 15/2/10.
//  Copyright (c) 2015年 coderyi. All rights reserved.
//

#import "SwitchView.h"

@implementation SwitchView
int currentTag;
UIColor *black;
UIColor *light;
UIFont *normalFont;
UIFont *lightFont;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor=[UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1];
        float h=35;
        float space=30;
        float width=35;
        float height=h;
        float w=space+width;
         black=[UIColor colorWithRed:0.35 green:0.35 blue:0.35 alpha:1];
        light=[UIColor colorWithRed:0.86 green:0.2 blue:0.22 alpha:1];
     
        normalFont=[UIFont boldSystemFontOfSize:15];
        lightFont=[UIFont boldSystemFontOfSize:17];
       
        _button1=[UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_button1];
        _button1.frame=CGRectMake(space, (h-height)/2, width, height);
        [_button1 setTitle:@"头条" forState:UIControlStateNormal];
        _button1.titleLabel.font = normalFont;
        
        [_button1 setTitleColor:black forState:UIControlStateNormal];
        _button1.tag=101;
        [_button1 addTarget:self action:@selector(btAction:) forControlEvents:UIControlEventTouchUpInside];
        
        
        _button2=[UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_button2];
        _button2.frame=CGRectMake(w+space, (h-height)/2, width, height);
        [_button2 setTitle:@"段子" forState:UIControlStateNormal];
        _button2.titleLabel.font = normalFont;
        [_button2 setTitleColor:black forState:UIControlStateNormal];
        _button2.tag=102;
        [_button2 addTarget:self action:@selector(btAction:) forControlEvents:UIControlEventTouchUpInside];
        
        
        _button3=[UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_button3];
        _button3.frame=CGRectMake(w*2+space, (h-height)/2, width, height);
        [_button3 setTitle:@"科技" forState:UIControlStateNormal];
        _button3.titleLabel.font = normalFont;
        [_button3 setTitleColor:black forState:UIControlStateNormal];
        _button3.tag=103;
        [_button3 addTarget:self action:@selector(btAction:) forControlEvents:UIControlEventTouchUpInside];
        
        _button4=[UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_button4];
        _button4.frame=CGRectMake(w*3+space, (h-height)/2, width, height);
        [_button4 setTitle:@"军事" forState:UIControlStateNormal];
        _button4.titleLabel.font = normalFont;
        [_button4 setTitleColor:black forState:UIControlStateNormal];
        _button4.tag=104;
        [_button4 addTarget:self action:@selector(btAction:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        //        默认情况
        currentTag=101;
      
        [_button1 setTitleColor:light forState:UIControlStateNormal];
        _button1.titleLabel.font = lightFont;
    }
    return self;
}
-(void)swipeAction:(int)tag{
    UIColor *black=[UIColor blackColor];
    switch (tag) {
        case 101:
                        currentTag=101;
            [_button1 setTitleColor:light forState:UIControlStateNormal];
            [_button2 setTitleColor:black forState:UIControlStateNormal];
            [_button3 setTitleColor:black forState:UIControlStateNormal];
            [_button4 setTitleColor:black forState:UIControlStateNormal];
            
            _button1.titleLabel.font = lightFont;
            _button2.titleLabel.font = normalFont;
            _button3.titleLabel.font = normalFont;
            _button4.titleLabel.font = normalFont;
            break;
        case 102:
         
            currentTag=102;
            [_button1 setTitleColor:black forState:UIControlStateNormal];
            [_button2 setTitleColor:light forState:UIControlStateNormal];
            [_button3 setTitleColor:black forState:UIControlStateNormal];
            [_button4 setTitleColor:black forState:UIControlStateNormal];
            
            _button1.titleLabel.font = normalFont;
            _button2.titleLabel.font = lightFont;
            _button3.titleLabel.font = normalFont;
            _button4.titleLabel.font = normalFont;
            
            
            break;
        case 103:
            
            currentTag=103;
            [_button1 setTitleColor:black forState:UIControlStateNormal];
            [_button2 setTitleColor:black forState:UIControlStateNormal];
            [_button3 setTitleColor:light forState:UIControlStateNormal];
            [_button4 setTitleColor:black forState:UIControlStateNormal];
            
            _button1.titleLabel.font = normalFont;
            _button2.titleLabel.font = normalFont;
            _button3.titleLabel.font = lightFont;
            _button4.titleLabel.font = normalFont;
            
            
            break;
        case 104:
          
            currentTag=104;
            [_button1 setTitleColor:black forState:UIControlStateNormal];
            [_button2 setTitleColor:black forState:UIControlStateNormal];
            [_button3 setTitleColor:black forState:UIControlStateNormal];
            [_button4 setTitleColor:light forState:UIControlStateNormal];
            
            _button1.titleLabel.font = normalFont;
            _button2.titleLabel.font = normalFont;
            _button3.titleLabel.font = normalFont;
            _button4.titleLabel.font = lightFont;
            break;
        default:
            break;
    }
    if (_ButtonActionBlock) {
        _ButtonActionBlock(currentTag);
    }
    
}
-(void)btAction:(UIButton *)button{
    [self swipeAction:button.tag];
}

@end
