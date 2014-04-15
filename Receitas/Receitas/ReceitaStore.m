//
//  ReceitaStore.m
//  Receitas
//
//  Created by Vinicius Miana on 3/30/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "ReceitaStore.h"
#import "MackenzieAppDelegate.h"

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
        
        NSURL *caminho = [MackenzieAppDelegate caminhoDoArquivo];
        receitas = [NSKeyedUnarchiver unarchiveObjectWithFile:[caminho path]];
        if (!receitas) {
            receitas = [[NSMutableArray alloc] init];
        }
        current = 0;
    }
    return self;
}

-(Receita *)atual {
    if (current < 0 || current >= [receitas count]) {
        return nil;
    }
    else {
        return [receitas objectAtIndex:current];
    }
}

-(Receita*)previous {
    if(current == 0) {
        current = receitas.count - 1;
    } else {
        current--;
    }
    return [self atual];
}

-(Receita*)next {
    if(current == receitas.count - 1) {
        current = 0;
    } else {
        current++;
    }
    return [self atual];
}

-(void)addReceita:(Receita*)novaReceita {
    // TODO implementar este metodo -> adicionar no array e no arquivo!!!
    [receitas addObject:novaReceita];
    NSURL *caminho = [MackenzieAppDelegate caminhoDoArquivo];
    [receitas addObject:novaReceita];
    [NSKeyedArchiver archiveRootObject:(NSArray *)receitas toFile:[caminho path]];
}




@end
