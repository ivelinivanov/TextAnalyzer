//
//  ViewController.h
//  TextAnalyzer
//
//  Created by Ivelin Ivanov on 9/4/13.
//  Copyright (c) 2013 MentorMate. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextAnalyzerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (strong, atomic) NSMutableDictionary *analyzedData;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

- (IBAction)analyzeButtonPressed:(id)sender;

@end
