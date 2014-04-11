//
//  ReceitaStore.h
//  Receitas
//
//  Created by Vinicius Miana on 3/30/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Receita.h"

@interface ReceitaStore : NSObject

+ (ReceitaStore *)sharedInstance;

-(void)addReceita:(Receita*)novaReceita;
-(Receita *)obterReceitaDoIndice:(NSUInteger)indice;
-(NSArray *)obterReceitas;
-(NSUInteger)quantidadeReceitas;
-(void)deletarReceita:(Receita *)receita;

@end
