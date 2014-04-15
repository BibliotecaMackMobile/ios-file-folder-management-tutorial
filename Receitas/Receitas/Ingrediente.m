//
//  Ingrediente.m
//  Receitas
//
//  Created by Wesley Scardua on 4/7/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "Ingrediente.h"

@implementation Ingrediente

@synthesize nome;
@synthesize quantidade;
@synthesize unidade;


-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        nome = [aDecoder decodeObjectForKey:@"nome"];
        quantidade = [aDecoder decodeFloatForKey:@"quantidade"];
        unidade = [aDecoder decodeObjectForKey:@"unidade"];
    }
    return self;
}
-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:nome forKey:@"nome"];
    [aCoder encodeFloat:quantidade forKey:@"quantidade"];
    [aCoder encodeObject:unidade forKey:@"unidade"];
}

- (id)initWithNome:(NSString *) ingrediente quantidade:(float) qte eUnidade:(NSString *) und{
    if (self = [super init]) {
        nome = ingrediente;
        quantidade = qte;
        unidade = und;
    }
    return self;
}

@end
