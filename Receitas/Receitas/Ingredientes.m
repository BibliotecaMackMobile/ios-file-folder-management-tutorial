//
//  Ingredientes.m
//  Receitas
//
//  Created by Leonardo Felipe da Silva on 4/15/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "Ingredientes.h"

@implementation Ingredientes
@synthesize nomeIngrediente;
@synthesize quantidade;
- (void) encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInteger: quantidade forKey:@"quantidade"];
    [aCoder encodeObject:nomeIngrediente forKey:@"nomeIngrediente"];
}

- (id) initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        quantidade = [aDecoder decodeIntegerForKey:@"quantidade"];
        nomeIngrediente = [aDecoder decodeObjectForKey:@"nomeIngrediente"];
        
    }
    return self;
}

@end
