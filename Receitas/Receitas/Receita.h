//
//  Receita.h
//  Receitas
//
//  Created by Vinicius Miana on 3/30/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Ingrediente.h"

@interface Receita : NSObject <NSCoding>

@property NSString *nome;
@property NSString *instrucoes;
@property NSData *imagem;
@property NSMutableArray *ingredientes;

@end
