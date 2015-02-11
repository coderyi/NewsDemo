//
//  ViewController.m
//  NewsDemo
//
//  Created by apple on 15/2/9.
//  Copyright (c) 2015年 coderyi. All rights reserved.
//

#import "ViewController.h"
#import "SwitchView.h"
#import "NewsTableViewCell.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UIScrollView *scrollView;
    int currentIndex;
    UITableView *tableView1;
    UITableView *tableView2;
    UITableView *tableView3;
    UITableView *tableView4;
    float titleHeight;
    float bgViewHeight;
    SwitchView *switchView;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    [self initTitle];
    
    titleHeight=35;
    bgViewHeight=HScreen-64-titleHeight;
    if (iOS7) {
        self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
        
    }
    self.view.backgroundColor=[UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1];
    
   
    switchView=[[SwitchView alloc] initWithFrame:CGRectMake(0, 0, WScreen, titleHeight)];
    [self.view addSubview:switchView];
    
    [self initScroll];
    [self initTable];
    
    
}
-(void)initTitle{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    
    titleLabel.backgroundColor = [UIColor clearColor];
    
    titleLabel.font = [UIFont boldSystemFontOfSize:20];
    
    titleLabel.textColor = [UIColor whiteColor];
    
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    titleLabel.text = @"新闻";
    self.navigationItem.titleView = titleLabel;
}
-(void)initScroll{
 
   
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, titleHeight, WScreen, bgViewHeight)];
    scrollView.alwaysBounceHorizontal=YES;
    scrollView.bounces = YES;
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    scrollView.userInteractionEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    
    [scrollView setContentSize:CGSizeMake(WScreen * (4), bgViewHeight)];
    [scrollView setContentOffset:CGPointMake(0, 0)];
    [scrollView scrollRectToVisible:CGRectMake(0,0,WScreen,bgViewHeight) animated:NO];
    
}

-(void)initTable{
    
    
    tableView1=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, WScreen, bgViewHeight) style:UITableViewStylePlain];
    [scrollView addSubview:tableView1];
    tableView1.showsVerticalScrollIndicator = NO;
    
    tableView1.dataSource=self;
    tableView1.delegate=self;
    tableView1.tag=11;
    tableView1.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    UIImageView *title1=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WScreen, 185)];
    title1.image=[UIImage imageNamed:@"t1"];
    [tableView1 setTableHeaderView:title1];
    
    
    switchView.ButtonActionBlock=^(int buttonTag){
        
        currentIndex=buttonTag-100;
        [scrollView scrollRectToVisible:CGRectMake(WScreen * (currentIndex-1),0,WScreen,bgViewHeight) animated:NO];
        [scrollView setContentOffset:CGPointMake(WScreen* (currentIndex-1),0)];
        
        if (currentIndex==1) {
            
            
        }else if (currentIndex==2){
            if (tableView2==nil) {
                tableView2=[[UITableView alloc] initWithFrame:CGRectMake(WScreen, 0, WScreen, bgViewHeight) style:UITableViewStylePlain];
                [scrollView addSubview:tableView2];
                tableView2.showsVerticalScrollIndicator = NO;

                tableView2.tag=12;
                tableView2.dataSource=self;
                tableView2.delegate=self;
                tableView2.separatorStyle=UITableViewCellSeparatorStyleNone;
                
                
            }

        }else if (currentIndex==3){
            if (tableView3==nil) {
                tableView3=[[UITableView alloc] initWithFrame:CGRectMake(WScreen*2, 0, WScreen, bgViewHeight) style:UITableViewStylePlain];
                [scrollView addSubview:tableView3];
                tableView3.showsVerticalScrollIndicator = NO;

                UIImageView *title3=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WScreen, 185)];
                title3.image=[UIImage imageNamed:@"t2"];
                [tableView3 setTableHeaderView:title3];
                tableView3.tag=13;
                
                tableView3.dataSource=self;
                tableView3.delegate=self;
                tableView3.separatorStyle=UITableViewCellSeparatorStyleNone;
                
                
            }

        }else if (currentIndex==4){
            if (tableView4==nil) {
                tableView4=[[UITableView alloc] initWithFrame:CGRectMake(WScreen*3, 0, WScreen, bgViewHeight) style:UITableViewStylePlain];
                [scrollView addSubview:tableView4];
                tableView4.showsVerticalScrollIndicator = NO;

                UIImageView *title4=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WScreen, 185)];
                title4.image=[UIImage imageNamed:@"t3"];
                [tableView4 setTableHeaderView:title4];
                
                
                tableView4.tag=14;
                
                tableView4.dataSource=self;
                tableView4.delegate=self;
                tableView4.separatorStyle=UITableViewCellSeparatorStyleNone;
                
            }

        }
        
        
    };
    
    currentIndex=1;
    
    
}


#pragma mark scrollView

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView1
{
    CGFloat pagewidth = scrollView.frame.size.width;
    int currentPage = floor((scrollView.contentOffset.x - pagewidth/ (4)) / pagewidth) + 1;
    
    if (currentPage==0)
    {
 
        [scrollView scrollRectToVisible:CGRectMake(0,0,WScreen,bgViewHeight) animated:NO];
        [scrollView setContentOffset:CGPointMake(0,0)];
    }
    else if (currentPage==(3))
    {
    
        [scrollView scrollRectToVisible:CGRectMake(WScreen * 3,0,WScreen,bgViewHeight) animated:NO];
        [scrollView setContentOffset:CGPointMake(WScreen* 3,0)];
    }
   
    currentIndex=currentPage+1;
  
    [switchView swipeAction:(100+currentPage+1)];
    
}

#pragma mark tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView.tag==11) {
        return 22;
    }else if (tableView.tag==12){
    return 31;
    
    }else if (tableView.tag==13){
        return 41;
        
    }else if (tableView.tag==14){
        
        return 21;
    }
    return 11;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView.tag==11) {
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id1"];
    
        
        if (cell == nil) {
            cell = [[NewsTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id1"];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
          
            
        }
    // Configure the cell...
            cell.mainIV.image=[UIImage imageNamed:@"l1"];
        cell.mainLabel.text=@"塞浦路斯将为俄供海外基地";
        cell.detailLabel.text=@"该基地距离英军安克罗蒂里空军基地仅50公里。";
        return cell;
     
     }else if (tableView.tag==12){
        
             UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id2"];
             if (cell == nil) {
                 cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"id2"];
                 cell.contentView.backgroundColor=[UIColor colorWithRed:0.96f green:0.96f blue:0.96f alpha:1.00f];
                 cell.selectionStyle=UITableViewCellSelectionStyleNone;
                 UIView *lineView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, WScreen, 8)];
                 [cell.contentView addSubview:lineView];
                 lineView.backgroundColor=[UIColor colorWithRed:0.91f green:0.91f blue:0.91f alpha:1.00f];
             }
             // Configure the cell...
             cell.textLabel.text=@"我小时偷西瓜，爪农来了。大一点的跑了，我也要跑，可太小跳不过水沟，刚哭，爪农就说不要跳，小心掉下去。后来还是爪农抱我过去，还把我偷的不熟西瓜拿了，换了个好的给我。谢谢了哈";
            cell.textLabel.numberOfLines=0;
             return cell;
             
         
     
     }else if (tableView.tag==13){
         
         NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id1"];
         
         
         if (cell == nil) {
             cell = [[NewsTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id1"];
             cell.selectionStyle=UITableViewCellSelectionStyleNone;
             
             
         }
         // Configure the cell...
         cell.mainIV.image=[UIImage imageNamed:@"l2"];
         cell.mainLabel.text=@"日：疑似朝5枚导弹坠入日本海";
         cell.detailLabel.text=@"该导弹发射前无需注入燃料，外界事前较难掌握动向。";
         return cell;
         
         
         
     }else if (tableView.tag==14){
         
         
         NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id1"];
         
         
         if (cell == nil) {
             cell = [[NewsTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id1"];
             cell.selectionStyle=UITableViewCellSelectionStyleNone;
             
             
         }
         // Configure the cell...
         cell.mainIV.image=[UIImage imageNamed:@"l3"];
         cell.mainLabel.text=@"美公布高超声速武器失败原因";
         cell.detailLabel.text=@"调查组认为用于调节发动机温度的设备发生故障。";
         return cell;
         
         
         
     }
    return nil;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag==11) {
        return 100;
    }else if (tableView.tag==12){
        return 170;
        
    }else if (tableView.tag==13){
        return 100;
        
    }else if (tableView.tag==14){
        
        return 100;
    }
    return 11;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
