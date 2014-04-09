//
//  Ingrediente.h
//  Receitas
//
//  Created by André Gimenez Faria on 09/04/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ingrediente : NSObject <NSCoding>

@property NSString *nome;
@property NSNumber *quantidade;

@end
