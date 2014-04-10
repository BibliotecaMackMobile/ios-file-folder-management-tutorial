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
@synthesize instrucoes;
@synthesize imagem;
@synthesize ingredientes;

-(Receita *) init {
    self = [super init];
    if (self) {
        self.ingredientes = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.nome forKey:@"nome"];
    [aCoder encodeObject:self.instrucoes forKey:@"instrucoes"];
    [aCoder encodeObject:self.imagem forKey:@"imagem"];
    [aCoder encodeObject:self.ingredientes forKey:@"ingredientes"];
}

-(id)initWithCoder:(NSCoder *)aDecoder { self = [super init ];
    if(self) {
        self.nome = [aDecoder decodeObjectForKey:@"nome"];
        self.instrucoes = [aDecoder decodeObjectForKey:@"instrucoes"];
        self.imagem = [aDecoder decodeObjectForKey:@"imagem"];
        self.ingredientes = [NSMutableArray arrayWithArray:[aDecoder decodeObjectForKey:@"ingredientes"]];
        // fazer isso para todos os atributos
    }
    return self; }

@end
