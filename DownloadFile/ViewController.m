//
//  ViewController.m
//  DownloadFile
//
//  Created by JESUS HURTADO on 18/05/14.
//  Copyright (c) 2014 JHM. All rights reserved.
//
#import <SVProgressHUD/SVProgressHUD.h>

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.urlTextField.delegate = self;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.urlTextField resignFirstResponder];
    //[self.urlTextField endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.urlTextField  resignFirstResponder];
    return NO;
}


- (IBAction)downloadFile:(id)sender {
    
    if ([self.urlTextField.text isEqualToString:@""]) {
        [SVProgressHUD showErrorWithStatus:@"Introduce a valid url file."];
        [self.urlTextField becomeFirstResponder];
        
    }
    
        
}
@end
