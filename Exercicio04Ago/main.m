//
//  main.m
//  Exercicio04Ago
//
//  Created by Afonso Junior on 11/08/12.
//  Copyright (c) 2012 Afonso Junior. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"
#import "Time.h"

int main(int argc, char *argv[])
{
	@autoreleasepool {
		[Time timesDoArquivo];
		
	    return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
	}
}