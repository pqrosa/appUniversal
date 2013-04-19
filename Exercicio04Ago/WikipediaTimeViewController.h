//
//  WikipediaTimeViewController.h
//  Exercicio04Ago
//
//  Created by Afonso Junior on 11/08/12.
//  Copyright (c) 2012 Afonso Junior. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Time;

@interface WikipediaTimeViewController : UIViewController {
	Time *time;
}

@property (retain, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic, retain) Time *time;

- (id)initWithTime:(Time *)_time;

@end
