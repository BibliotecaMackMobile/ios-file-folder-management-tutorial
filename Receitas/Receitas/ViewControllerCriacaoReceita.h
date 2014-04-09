//
//  ViewControllerCriacaoReceita.h
//  Receitas
//
//  Created by André Gimenez Faria on 09/04/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Receita.h"

@interface ViewControllerCriacaoReceita : UITableViewController {
    Receita *novaReceita;
    UIBarButtonItem *btnCancelar;
    UITextField *txtNome;
}

@end
