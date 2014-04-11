//
//  ViewControllerDetalhesReceita.h
//  Receitas
//
//  Created by André Gimenez Faria on 09/04/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Receita.h"

@interface ViewControllerDetalhesReceita : UIViewController {
    Receita *receita;
    UIScrollView *scrollView;
    UIImageView *imgReceita;
    UILabel *txtNome;
    UITextView *txtIngredientes;
    UITextView *txtInstrucoes;
}

-(ViewControllerDetalhesReceita *) initComReceita:(Receita *)r;

@end
