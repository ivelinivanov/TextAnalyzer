//
//  PlotViewController.h
//  TextAnalyzer
//
//  Created by Ivelin Ivanov on 9/4/13.
//  Copyright (c) 2013 MentorMate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CorePlot-CocoaTouch.h"

@interface PlotViewController : UIViewController <CPTPieChartDataSource, CPTPlotDataSource>

@property (weak, nonatomic) IBOutlet CPTGraphHostingView *graphView;

@property (copy, nonatomic) NSMutableDictionary *wordData;
@property (assign, nonatomic) NSInteger wordCount;

- (IBAction)dismissView:(id)sender;
@end
