//
//  ViewController.m
//  DownloadFile
//
//  Created by JESUS HURTADO on 18/05/14.
//  Copyright (c) 2014 JHM. All rights reserved.
//
#import <SVProgressHUD/SVProgressHUD.h>

#import "ViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "Photo.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [self.customView setAlpha:0];
    self.model = [AGTSimpleCoreDataStack coreDataStackWithModelName:@"Model"];

    
    self.urlTextField.delegate = self;
    self.fileNameTextField.delegate = self;
    self.progressView.progress = 0;
    self.progressView.alpha = 0;
    self.progressLabel.text = @"";
}

- (void)viewDidUnload {
    [self setProgressView:nil];
    [self setProgressLabel:nil];
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.urlTextField resignFirstResponder];
    [self.fileNameTextField resignFirstResponder];
    //[self.urlTextField endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    return NO;
}


- (IBAction)downloadFile:(id)sender {
    [self.customView setAlpha:0];

    if ([self.urlTextField.text isEqualToString:@""]) {
        [SVProgressHUD showErrorWithStatus:@"Introduce a valid url file."];
        [self.urlTextField becomeFirstResponder];
        
    } else {
        
        self.progressView.alpha = 0;
        NSURL *url = [NSURL URLWithString:self.urlTextField.text];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        AFHTTPRequestOperation *op;
        op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
        
        NSString *documentsDirectory = nil;
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        documentsDirectory = [paths objectAtIndex:0];
        
        NSString *targetFilename = [url lastPathComponent];
        NSString *targetPath = [documentsDirectory stringByAppendingPathComponent:targetFilename];
        
        
        //[op setResponseFilePath:targetPath];
        op.responseSerializer = [AFImageResponseSerializer serializer];
        
        //http://www.montevideo.com.uy/imgnoticias/201103/316705.jpg
        
        //http://upload.wikimedia.org/wikipedia/commons/b/bf/HMAS_Canberra_1_2-100605_bigger.jpg
        [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            [self.customView setAlpha:1];

            self.imageView.image = responseObject;
          
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            //failure case
            NSLog(@"Error: %@", error);
            [self.customView setAlpha:0];

            [SVProgressHUD showErrorWithStatus:@"Error downloading file"];

        }];
        
        
        
        
        [op setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
            
            if (totalBytesExpectedToRead>0) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.progressView.alpha = 1;
                    self.progressView.progress =  (float) totalBytesRead / (float) totalBytesExpectedToRead;
                    self.progressLabel.text = [NSString stringWithFormat:@"Downloaded %lld of %lld bytes",
                                               totalBytesRead,
                                               totalBytesExpectedToRead];
                });
            }
        }];
        
        [op start];
    }
}

- (IBAction)saveImage:(id)sender {
    
    if ([self.fileNameTextField.text isEqual:@""]) {
        [SVProgressHUD showErrorWithStatus:@"Introduce a valid name file."];
        [self.fileNameTextField becomeFirstResponder];
    } else {
        Photo * photo = [Photo photoWithName:self.fileNameTextField.text
                                   imageData:UIImagePNGRepresentation(self.imageView.image)
                                     context:self.model.context];
        
        
        
        
        [self.model saveWithErrorBlock:^(NSError *error) {
            [SVProgressHUD showErrorWithStatus:@"Error saving file in Database"];
            

            NSLog(@"Error saving %s \n\n %@",__func__, error);
        }];
        
        [SVProgressHUD showSuccessWithStatus:@"Image saved with success"];
        
        
        
    }
    
}




















@end
