//
//  ReceitaStore.m
//  Receitas
//
//  Created by Vinicius Miana on 3/30/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "ReceitaStore.h"

@implementation ReceitaStore {
    NSArray *receitas;
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
        // TODO recuperar as receitas do arquivo
    }
    return self;
}

-(Receita *)atual{
    return [receitas objectAtIndex:current];
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
