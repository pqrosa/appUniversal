//
//  WikipediaTimeViewController.m
//  Exercicio04Ago
//
//  Created by Afonso Junior on 11/08/12.
//  Copyright (c) 2012 Afonso Junior. All rights reserved.
//

#import "WikipediaTimeViewController.h"
#import "Time.h"

@interface WikipediaTimeViewController ()

@end

@implementation WikipediaTimeViewController

@synthesize webView;
@synthesize time;

- (id)init
{
    self = [super init];
    if (self) {
		self.title = @"Wikipédia";
    }
    return self;
}

- (id)initWithTime:(Time *)_time {
    self = [super init];
    if (self) {
		self.time = _time;
		self.title = @"Wikipédia";
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Para iPad temos que tratar o caso de não termos um time selecionado
    if (self.time)
    {
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.time.url]]];
    }
    else
    {
        self.webView.hidden = YES;
    }
}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if (isIpadDevice)
    {
        return YES;
    }
    else
    {
        return (interfaceOrientation == UIInterfaceOrientationPortrait);
    }
}

- (void) setTime:(Time *)_time
{
    [time release];
    time = _time;
    [time retain];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.time.url]]];
    self.webView.hidden = NO;    
}

- (void)dealloc {
    [webView release];
	[time release];
    [super dealloc];
}
@end
