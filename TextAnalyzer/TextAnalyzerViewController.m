//
//  ViewController.m
//  TextAnalyzer
//
//  Created by Ivelin Ivanov on 9/4/13.
//  Copyright (c) 2013 MentorMate. All rights reserved.
//

#import "TextAnalyzerViewController.h"
#import "TextAnalyzer.h"

@interface TextAnalyzerViewController ()

@end

@implementation TextAnalyzerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.activityIndicator.hidden = YES;
}


- (IBAction)analyzeButtonPressed:(id)sender
{
    self.activityIndicator.hidden = NO;
    [self.activityIndicator startAnimating];
    self.activityIndicator.hidesWhenStopped = YES;
    
    [TextAnalyzer analyzeText:self.textView.text withCompletion:^(NSMutableDictionary *result)
     {
         NSLog(@"%@", result);
         
         self.analyzedData = result;
         
         [self.activityIndicator stopAnimating];
         
         [self performSegueWithIdentifier:@"toPlotView" sender:self];
     }];
}

@end
