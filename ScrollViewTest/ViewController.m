//
//  ViewController.m
//  ScrollViewTest
//
//  Created by Jinho Son on 2014. 1. 7..
//  Copyright (c) 2014년 STD1. All rights reserved.
//

#import "ViewController.h"

#define TAG_CONTENT 99

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController
// 너비맞추기
- (IBAction)fitToWidth:(id)sender
{
    UIView *contentView = [self.view viewWithTag:TAG_CONTENT];
    float scale = self.scrollView.frame.size.width / contentView.frame.size.width;
    NSLog(@"scale: %f", scale);
    
    [self.scrollView setZoomScale:scale animated:YES];
}

// 높이맞추기
- (IBAction)fitToHeight:(id)sender
{
    UIView *contentView = [self.view viewWithTag:TAG_CONTENT];
    float scale = self.scrollView.frame.size.height / contentView.frame.size.height;
    NSLog(@"scale: %f", scale);
    
    [self.scrollView setZoomScale:scale animated:YES];

}

// 2배로확대
- (IBAction)scaleDouble:(id)sender
{
    float x= self.scrollView.contentOffset.x;
    float y = self.scrollView.contentOffset.y;
    float w = self.scrollView.frame.size.width / 2;
    float h = self.scrollView.frame.size.height / 2;
    
    CGRect doubleRect = CGRectMake(x, y, w, h);
    
    [self.scrollView zoomToRect:doubleRect animated:YES];

}

// 확대/축소대상분류
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return [self.view viewWithTag:TAG_CONTENT];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // 화면보다 큰 뷰를 IB에서 다루기 힘들다. 코드로작성
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"image" ofType:@"jpg"];
    UIImage *image = [UIImage imageWithContentsOfFile:filePath];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.tag = TAG_CONTENT;
    
    [self.scrollView addSubview:imageView];
    self.scrollView.delegate = self;
    self.scrollView.contentSize = imageView.frame.size;
    self.scrollView.minimumZoomScale = self.scrollView.frame.size.width / imageView.frame.size.width;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
