//
//  Ingredientes.m
//  Receitas
//
//  Created by Bárbara Perretti on 4/14/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "Ingredientes.h"

@implementation Ingredientes
@synthesize quantidade, nomeIngrediente;


-(void) encodeWithCoder: (NSCoder *)aCoder{
    [aCoder encodeInteger:quantidade forKey:@"quantidade"];
    [aCoder encodeObject:nomeIngrediente forKey:@"nomeIngrediente"];
    
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if(self) {
        quantidade = [aDecoder decodeIntegerForKey:@"quantidade"];
        nomeIngrediente = [aDecoder decodeObjectForKey:@"nomeIngredientes"];
    }
    return self;
}

@end
