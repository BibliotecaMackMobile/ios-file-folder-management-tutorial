//
//  ViewControllerCriacaoReceita.h
//  Receitas
//
//  Created by André Gimenez Faria on 09/04/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Receita.h"
#import "ViewControllerTabelaReceitas.h"

@interface ViewControllerCriacaoReceita : UITableViewController {
    Receita *novaReceita;
    UIBarButtonItem *btnCancelar;
    UITextField *txtNome;
    UIActionSheet *opcoesSemFoto;
    UIActionSheet *opcoesComFoto;
    UIImageView *imgEscolhida;
    UIBarButtonItem *btnCriar;
}

@property ViewControllerTabelaReceitas *telaReceitas;

-(void)atualizarInstrucoes:(NSString *)instrucoes;
-(void)inserirIngrediente:(Ingrediente *)ingrediente;

@end
