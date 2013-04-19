//
//  Times.h
//  Exercicio04Ago
//
//  Created by Afonso Junior on 11/08/12.
//  Copyright (c) 2012 Afonso Junior. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Time : NSObject {
	NSString *nome, *url, *estado;
	NSArray *imagens;
}

@property (nonatomic, copy) NSString *nome, *url, *estado;
@property (nonatomic, retain) NSArray *imagens;

+ (NSDictionary *)timesDoArquivo;


@end
