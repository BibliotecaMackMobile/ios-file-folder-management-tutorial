//
//  Ingredientes.h
//  Receitas
//
//  Created by Tatiana Mourão Diorio on 4/14/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Ingredientes : NSObject <NSCoding>
{


NSInteger quantidade;
NSString *nomeIngrediente;


}

@property NSString *nomeIngrediente;
@property NSInteger quantidade;



@end
