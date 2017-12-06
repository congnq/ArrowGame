//
//  SXWebOpenViewController.m
//  game2048
//
//  Created by Cong Nguyen on 11/28/17.
//  Copyright © 2017 Sun Xi. All rights reserved.
//

#import "SXWebOpenViewController.h"

@interface SXWebOpenViewController () <UIWebViewDelegate, UIAlertViewDelegate>

@end

@implementation SXWebOpenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.dataObject.wapurl]]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSLog(@"%@", webView.request.URL.absoluteString);
    return YES;
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"%@",error);
    NSString *desc = [NSString stringWithFormat:@"Error when try to load URL %@ --- %@", webView.request.URL.absoluteString, error.description];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Eror" message:desc delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alertView show];
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        [[[UIApplication sharedApplication].keyWindow.rootViewController.view viewWithTag:1001] removeFromSuperview];
    }];
}

@end
