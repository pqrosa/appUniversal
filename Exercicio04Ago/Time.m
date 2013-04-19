//
//  Times.m
//  Exercicio04Ago
//
//  Created by Afonso Junior on 11/08/12.
//  Copyright (c) 2012 Afonso Junior. All rights reserved.
//

#import "Time.h"

@implementation Time

@synthesize nome, url, estado, imagens;

+ (NSDictionary *)timesDoArquivo {
	NSString *path = [[NSBundle mainBundle] pathForResource:@"times" ofType:@"plist"];
	NSArray *timesDoPlist = [NSArray arrayWithContentsOfFile:path];
	
	NSMutableDictionary *times = [NSMutableDictionary dictionary];
	for (NSDictionary *dicionarioTime in timesDoPlist) {
		Time *umTime = [[Time alloc] init];
		umTime.nome = [dicionarioTime objectForKey:@"nome"];
		umTime.url = [dicionarioTime objectForKey:@"url"];
		umTime.estado = [dicionarioTime objectForKey:@"estado"];
		umTime.imagens = [dicionarioTime objectForKey:@"imagens"];
		
		if ([times objectForKey:umTime.estado]) {
			[[times objectForKey:umTime.estado] addObject:umTime];
		} else {
			[times setObject:[NSMutableArray arrayWithObject:umTime] forKey:umTime.estado];
		}
		
		[umTime release];
	}
	return times;
}


#pragma mark -

- (void)dealloc
{
    [nome release];
	[url release];
	[estado release];
	[imagens release];
    [super dealloc];
}

@end
