//
//  Ingredientes.h
//  Receitas
//
//  Created by Leonardo Felipe da Silva on 4/15/14.
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
