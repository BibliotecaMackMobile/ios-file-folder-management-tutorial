//
//  Ingrediente.m
//  Receitas
//
//  Created by André Gimenez Faria on 09/04/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "Ingrediente.h"

@implementation Ingrediente

@synthesize nome;
@synthesize quantidade;



-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.nome forKey:@"nome"];
    [aCoder encodeObject:self.quantidade forKey:@"quantidade"];
    [aCoder encodeObject:self.unidadeMedida forKey:@"unidadeMedida"];
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.nome = [aDecoder decodeObjectForKey:@"nome"];
        self.quantidade = [aDecoder decodeObjectForKey:@"quantidade"];
        self.unidadeMedida = [aDecoder decodeObjectForKey:@"unidadeMedida"];
    }
    return self;
}

@end
