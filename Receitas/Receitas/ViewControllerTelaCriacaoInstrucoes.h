//
//  ViewControllerTelaCriacaoInstrucoes.h
//  Receitas
//
//  Created by André Gimenez Faria on 09/04/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewControllerCriacaoReceita.h"

@interface ViewControllerTelaCriacaoInstrucoes : UIViewController {
    UITextView *txtInstrucoes;
}

-(ViewControllerTelaCriacaoInstrucoes *) initComTexto:(NSString *)texto;

@property ViewControllerCriacaoReceita *viewCriacao;

@end
