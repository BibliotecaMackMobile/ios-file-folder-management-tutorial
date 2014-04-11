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
       NSString *caminho = [[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0]stringByAppendingPathComponent:@"receitas.txt"];
        NSLog(@"%@",caminho);
        NSData *leitura = [[NSData alloc] initWithContentsOfFile:caminho];
        receitas = [[NSMutableArray alloc] initWithArray:[NSKeyedUnarchiver unarchiveObjectWithData:leitura]];
    }
    return self;
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
    [receitas addObject:novaReceita];
    NSString *caminho = [[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) objectAtIndex:0]stringByAppendingPathComponent:@"receitas.txt"];
    NSData *dadosParaEscrever = [NSKeyedArchiver archivedDataWithRootObject:receitas];
    BOOL resultado = [dadosParaEscrever writeToFile:caminho atomically:YES];
    if (!resultado) {
        NSLog(@"Erro de escrita");
    }
}




@end
