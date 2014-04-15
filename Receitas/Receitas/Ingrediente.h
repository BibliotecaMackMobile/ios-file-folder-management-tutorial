//
//  Ingrediente.h
//  Receitas
//
//  Created by Wesley Scardua on 4/7/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ingrediente : NSObject <NSCoding> {
    float quantidade;
    NSString *unidade;
    NSString *nome;
}

@property NSString *nome;
@property float quantidade;
@property NSString *unidade;

- (id)initWithNome:(NSString *) ingrediente quantidade:(float) qte eUnidade:(NSString *) und;
@end
