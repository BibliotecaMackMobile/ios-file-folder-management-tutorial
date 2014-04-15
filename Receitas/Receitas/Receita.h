//
//  Receita.h
//  Receitas
//
//  Created by Vinicius Miana on 3/30/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Receita : NSObject <NSCoding>
// TODO Definir os atributos da receita e permitir que ela seja armazenada em arquivo.

{
    NSString *nome;
    NSString *passos;
    NSArray *ingredientes;
    
}

@property NSString *nome;
@property NSString *passos;
@property NSArray *ingredientes;


- (id) initWithNome:(NSString *) oNome passos:(NSString *) osPassos eIngredientes: (NSArray *)osIngredientes ;

@end
