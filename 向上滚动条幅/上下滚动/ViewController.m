//
//  ViewController.m
//  上下滚动
//
//  Created by chinajes on 2017/7/10.
//  Copyright © 2017年 chinajes. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, weak)UILabel *label1;

@property(nonatomic, weak)UILabel *label2;

@property(nonatomic, strong)NSArray *array;

@property(nonatomic, assign)NSInteger count;

@property(nonatomic, strong)NSTimer *timer;
@end

@implementation ViewController

- (NSArray *)array{
    
    if (_array == nil) {
        _array = @[@"我就想说:还有谁?",@"我可以一直杀",@"国服第一JS",@"我一贱,你就笑"];
    }
    return _array;
}

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:4 repeats:1 block:^(NSTimer * _Nonnull timer) {
        
        [UIView animateWithDuration:1 animations:^{
            
            self.label1.frame = CGRectMake(0, -15, 100, 15);
            
            self.label2.frame = CGRectMake(0, 0, 100, 15);
            
        } completion:^(BOOL finished) {
            
            self.label1.frame = CGRectMake(0, 15, 100, 15);
            
            if (self.count < self.array.count - 1) {
                self.count ++;
                
                self.label1.text = self.array[self.count];
                
            }else{
                self.count = 0;
                self.label1.text = self.array[self.count];
            }
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [UIView animateWithDuration:1 animations:^{
                    
                    self.label2.frame = CGRectMake(0, -15, 100, 15);
                    self.label1.frame = CGRectMake(0, 0, 100, 15);
                    
                } completion:^(BOOL finished) {
                    
                    self.label2.frame = CGRectMake(0, 15, 100, 15);
                    
                    if (self.count < self.array.count - 1) {
                        self.count ++;
                        
                        self.label2.text = self.array[self.count];
                        
                    }else{
                        self.count = 0;
                        self.label2.text = self.array[self.count];
                    }
                }];
                
            });
            
            
        }];
    }];
    
    
    self.timer = timer;
    
    // 开启定时器
    
    [timer setFireDate:[NSDate distantPast]];
    
    [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
}

-(void)viewDidDisappear:(BOOL)animated{
    
    [super viewDidDisappear:animated];
    
    
    // 关闭定时器
    [self.timer invalidate];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 按钮
//    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(50, 50, 30, 30)];
//    button.backgroundColor = [UIColor redColor];
//    
//    [self.view addSubview:button];
//    
//    [button addTarget:self action:@selector(didClickBtn) forControlEvents:UIControlEventTouchUpInside];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // bgView
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 150, 15)];
    
    bgView.layer.masksToBounds = YES;
    bgView.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:bgView];
    
    // 11111
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 15)];
    self.label1 = label1;
    self.label1.font = [UIFont systemFontOfSize:12];

    
    label1.text = self.array[0];;
    
    label1.backgroundColor = [UIColor redColor];
    
    [bgView addSubview:label1];
    
    
    // 22222
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 15, 100, 15)];
    self.label2 = label2;
    self.label2.font = [UIFont systemFontOfSize:12];
    label2.backgroundColor = [UIColor blueColor];
    
    label2.text = self.array[1];
    
    [bgView addSubview:label2];
    
    self.count = 1;
    

   
    
}

//- (void)didClickBtn{
//    
//    [UIView animateWithDuration:1 animations:^{
//        
//        self.label1.frame = CGRectMake(0, -15, 100, 15);
//        
//        self.label2.frame = CGRectMake(0, 0, 100, 15);
//        
//    } completion:^(BOOL finished) {
//        
//        self.label1.frame = CGRectMake(0, 15, 100, 15);
//        
//        [UIView animateWithDuration:1 animations:^{
//            self.label2.frame = CGRectMake(0, -15, 100, 15);
//            self.label1.frame = CGRectMake(0, 0, 100, 15);
//        } completion:^(BOOL finished) {
//            self.label2.frame = CGRectMake(0, 15, 100, 15);
//        }];
//        
//    }];
//    
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
