//
//  ViewControllerNovoIngrediente.h
//  Receitas
//
//  Created by André Gimenez Faria on 09/04/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ingrediente.h"

@interface ViewControllerNovoIngrediente : UITableViewController {
    Ingrediente *novoIngrediente;
    UITextField *txtNome;
    UITextField *txtQuantidade;
}

@end
