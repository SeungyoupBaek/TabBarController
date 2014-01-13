//
//  SecondViewController.m
//  TabBarController
//
//  Created by SDT-1 on 2014. 1. 13..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "SecondViewController.h"
#import "AppDelegate.h"
@interface SecondViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation SecondViewController
// 엔터를 치면 키보드 감추기
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

// 편집 상태에서 완료될때, 입력값을 공유 데이터에 저장
-(void)textFieldDidEndEditing:(UITextField *)textField{
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    delegate.sharedStr = textField.text;
}

// 나타날 때에는 공유 데이터에서 값을 얻어와서 뷰에 갱신한다.
-(void)viewWillAppear:(BOOL)animated{
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    self.textField.text = delegate.sharedStr;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
