//
//  Receita.m
//  Receitas
//
//  Created by Vinicius Miana on 3/30/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "Receita.h"

@implementation Receita

@synthesize nome;
@synthesize passos;
@synthesize ingredientes;

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:passos forKey:@"passos"];
    [aCoder encodeObject:ingredientes forKey:@"ingredientes"];
    [aCoder encodeObject:nome forKey:@"nome"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        passos = [aDecoder decodeObjectForKey:@"passos"];
        ingredientes =[aDecoder decodeObjectForKey:@"ingredientes"];
        nome = [aDecoder decodeObjectForKey:@"nome"];
    }
    return self;
}

- (id)initWithNome:(NSString *)oNome passos:(NSString *)osPassos eIngredientes:(NSArray *)osIngredientes {
    self = [super init];
    if (self) {
        nome = oNome;
        passos = osPassos;
        ingredientes = osIngredientes;
    }
    return self;
}

@end
