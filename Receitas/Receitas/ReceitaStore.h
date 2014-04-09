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

-(Receita *)next;
-(Receita *)previous;
-(void)addReceita:(Receita*)novaReceita;
-(void)testarCriacaoReceita;
-(Receita *)obterReceitaDoIndice:(NSUInteger)indice;
-(NSArray *)obterReceitas;
-(NSUInteger)quantidadeReceitas;

@end
