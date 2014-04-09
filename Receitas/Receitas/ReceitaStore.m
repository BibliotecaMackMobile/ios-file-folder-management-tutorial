//
//  ReceitaStore.m
//  Receitas
//
//  Created by Vinicius Miana on 3/30/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "ReceitaStore.h"

@implementation ReceitaStore {
    NSMutableArray *receitas;
    NSInteger current;
}

+ (ReceitaStore *)sharedInstance
{
    static ReceitaStore *sharedInstance = nil;
    if (!sharedInstance) {
        sharedInstance = [[super allocWithZone:nil] initPrivado];
    }
    return sharedInstance;
}

-(id)initPrivado {
    self = [super init];
    if(self) {
        receitas = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void) testarCriacaoReceita {
    Receita *teste = [[Receita alloc] init];
    teste.nome = @"Teste";
    teste.instrucoes = @"Fazer testes";
    teste.imagem = UIImageJPEGRepresentation([UIImage imageNamed:@"imgteste.jpg"], 1.00);
    [receitas addObject:teste];
}
-(NSUInteger) quantidadeReceitas {
    return [receitas count];
}

-(Receita *)obterReceitaDoIndice:(NSUInteger)indice {
    return [receitas objectAtIndex:indice];
}

-(NSArray *)obterReceitas {
    return receitas;
}

-(Receita*)previous {
    if(current == 0) {
        current = receitas.count - 1;
    } else {
        current--;
    }
    return [receitas objectAtIndex:current];
}

-(Receita*)next {
    if(current == receitas.count - 1) {
        current = 0;
    } else {
        current++;
    }
    return [receitas objectAtIndex:current];
}

-(void)addReceita:(Receita*)novaReceita {
    // TODO implementar este metodo -> adicionar no array e no arquivo!!!
}




@end
