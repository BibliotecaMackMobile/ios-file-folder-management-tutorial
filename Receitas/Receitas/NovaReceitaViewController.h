//
//  NovaReceitaViewController.h
//  Receitas
//
//  Created by Wesley Scardua on 4/10/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NovaReceitaViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *botaoSalvar;
@property (weak, nonatomic) IBOutlet UITextField *campoNome;
@property (weak, nonatomic) IBOutlet UITextField *ingrediente;
@property (weak, nonatomic) IBOutlet UITextField *unidade;
@property (weak, nonatomic) IBOutlet UITextField *quantidade;
@property (weak, nonatomic) IBOutlet UITextView *passos;

- (IBAction)adicionarIngrediente:(id)sender;
- (IBAction)voltar:(id)sender;
- (IBAction)salvar:(id)sender;

@end
