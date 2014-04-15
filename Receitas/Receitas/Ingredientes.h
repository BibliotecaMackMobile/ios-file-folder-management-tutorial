//
//  Ingredientes.h
//  Receitas
//
//  Created by Bárbara Perretti on 4/14/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ingredientes : NSObject <NSCoding>
{
    NSInteger quantidade;
    NSString *nomeIngrediente;
}

@property NSInteger quantidade;
@property NSString *nomeIngrediente;

@end
