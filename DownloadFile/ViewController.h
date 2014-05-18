//
//  ViewController.h
//  DownloadFile
//
//  Created by JESUS HURTADO on 18/05/14.
//  Copyright (c) 2014 JHM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AGTSimpleCoreDataStack.h"

@interface ViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UILabel *progressLabel;
@property (weak, nonatomic) IBOutlet UITextField *fileNameTextField;
@property (weak, nonatomic) IBOutlet UIButton *saveImageButton;
@property (weak, nonatomic) IBOutlet UIView *customView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) AGTSimpleCoreDataStack * model;
- (IBAction)downloadFile:(id)sender;
- (IBAction)saveImage:(id)sender;



@end
