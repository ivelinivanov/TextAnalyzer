//
//  ViewController.m
//  TextAnalyzer
//
//  Created by Ivelin Ivanov on 9/4/13.
//  Copyright (c) 2013 MentorMate. All rights reserved.
//

#import "TextAnalyzerViewController.h"
#import "TextAnalyzer.h"
#import "PlotViewController.h"

@interface TextAnalyzerViewController ()
{
    NSInteger wordCount;
}

@end

@implementation TextAnalyzerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.activityIndicator.hidden = YES;
    self.textView.delegate = self;
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
         wordCount = 0;
         for (NSString *key in [self.analyzedData allKeys])
         {
             wordCount += [self.analyzedData[key] integerValue];
         }
         
         
         [self.activityIndicator stopAnimating];
         
         [self performSegueWithIdentifier:@"toPlotView" sender:self];
     }];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    PlotViewController *target = (PlotViewController *)segue.destinationViewController;
    target.wordData = self.analyzedData;
    target.wordCount = wordCount;
}

#pragma mark - TextView Delegate Methods

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    
    if([text isEqualToString:@"\n"])
    {
        [self.textView resignFirstResponder];
        
        return NO;
    }
    
    return YES;
}

@end
