//
//  GaleriaDoTimeViewController.m
//  Exercicio04Ago
//
//  Created by Afonso Junior on 11/08/12.
//  Copyright (c) 2012 Afonso Junior. All rights reserved.
//

#import "GaleriaDoTimeViewController.h"
#import "Time.h"

@interface GaleriaDoTimeViewController ()

@end

@implementation GaleriaDoTimeViewController

@synthesize scrollView;
@synthesize time;

-(id)init
{
    self = [super init];
    if (self) {
		self.title = @"Galeria";
    }
    return self;  
}

- (id)initWithTime:(Time *)_time
{
    self = [super init];
    if (self) {
        self.time = _time;
		self.title = @"Galeria";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	
    // Temos que tratar o caso do iPad
    if (self.time)
    {
       	[self configuraScrollView];
	}
    else 
    {
        self.scrollView.hidden = YES;
    }
}

- (void)viewDidUnload
{
    [self setScrollView:nil];
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
    
    [self configuraScrollView];
    self.scrollView.hidden = NO; 
}

#pragma mark - Private

- (UIImageView *)imageViewComNomeImagem:(NSString *)nomeImagem naPosicao:(NSInteger)pos{
	UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:nomeImagem] highlightedImage:nil];
	
	//configurando o frame
	CGRect frame = self.scrollView.frame;
	frame.origin = CGPointMake(pos * frame.size.width, 0);
	imageView.frame = frame;
	
	return [imageView autorelease];
}

- (void)configuraScrollView
{
    CGSize size = self.scrollView.frame.size;
    self.scrollView.contentSize = CGSizeMake(size.width * [self.time.imagens count], size.height);
    
    for (int i = 0; i < [self.time.imagens count]; i++) {
        NSString *imagem = [self.time.imagens objectAtIndex:i];
        [self.scrollView addSubview:[self imageViewComNomeImagem:imagem naPosicao:i]]; 
    }
}

#pragma mark -

- (void)dealloc {
    [scrollView release];
	[time release];
    [super dealloc];
}
@end
