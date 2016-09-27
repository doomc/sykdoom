//
//  RootViewController.m
//  SYK
//
//  Created by 熊维东 on 16/9/12.
//  Copyright © 2016年 熊维东. All rights reserved.
//

#import "RootViewController.h"
#import <WebKit/WebKit.h>
//#define  urlString "http://www.4chan.org/b"
#define  urlString "http://www.51suk.com/3g"

@interface RootViewController ()<WKNavigationDelegate,UIScrollViewDelegate>

@property(nonatomic,strong)WKWebView * wkwebView;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   
    
    self.wkwebView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 20, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height -20)];
    [self.wkwebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@urlString]]];
    self.wkwebView.navigationDelegate = self;
    self.wkwebView.scrollView.bounces = NO;
    [self.view addSubview:self.wkwebView];
    _wkwebView.navigationDelegate = self;
    _wkwebView.scrollView.delegate = self;
    
//    UIWebView * webView =[[UIWebView alloc]initWithFrame:CGRectMake(0, 20, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height -20) ];
//    NSURL * url = [NSURL URLWithString:@"http://www.51suk.com/3g/"];
//    NSURLRequest * request = [NSURLRequest requestWithURL:url];
//    [webView loadRequest:request];
//    webView.delegate =self;
//    webView.scrollView.bounces = NO;
//    [self.view addSubview:webView];
    
    
    for (UIView *_aView in [_wkwebView subviews])
    {
        if ([_aView isKindOfClass:[UIScrollView class]])
        {
            [(UIScrollView *)_aView setShowsVerticalScrollIndicator:NO];
            //右侧的滚动条
            
            [(UIScrollView *)_aView setShowsHorizontalScrollIndicator:NO];
            //下侧的滚动条
            
            for (UIView *_inScrollview in _aView.subviews)
            {
                if ([_inScrollview isKindOfClass:[UIImageView class]])
                {
                    _inScrollview.hidden = YES;  //上下滚动出边界时的黑色的图片
                }
            }
        }
    }
    
    
    
    [self viewForZoomingInScrollView:_wkwebView.scrollView];
    
}


- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return nil;
}


#pragma mark - webView delegate
//-(void)webViewDidFinishLoad:(UIWebView *)webView
//{
//    // 禁用用户选择
//    [webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitUserSelect='none';"];
//    
//    // 禁用长按弹出框
//    [webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitTouchCallout='none';"];
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
