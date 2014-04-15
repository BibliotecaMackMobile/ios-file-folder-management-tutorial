//
//  NovaReceitaViewController.m
//  Receitas
//
//  Created by Wesley Scardua on 4/10/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "NovaReceitaViewController.h"
#import "Receita.h"
#import "Ingrediente.h"
#import "ReceitaStore.h"
#import "ReceitaViewController.h"
@interface NovaReceitaViewController () {
    NSMutableArray *igd;
    //Usar NSDictionary para guardar estes vetores
}

@end

@implementation NovaReceitaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    igd = [[NSMutableArray alloc] init];


    _campoNome.delegate =self;
    _quantidade.delegate = self;
    _unidade.delegate = self;
    _ingrediente.delegate = self;
    _passos.delegate =self;
    
    // Do any additional setup after loading the view.
    [_botaoSalvar setHidden:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)adicionarIngrediente:(id)sender {
    if (_campoNome.text.length > 0
        && _ingrediente.text.length >0
        && _quantidade.text.length > 0) {
        
        Ingrediente *aux = [[Ingrediente alloc] initWithNome:_ingrediente.text quantidade:[_quantidade.text floatValue] eUnidade:_unidade.text];
        [igd addObject:aux];
        [_botaoSalvar setHidden:NO];
        _unidade.text = @"";
        _quantidade.text = @"";
        _ingrediente.text = @"";
        
    }
    else {
        NSLog(@"Sem Nome/Ingrediente/Unidade/Quantidade");
    }
}

- (IBAction)voltar:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)salvar:(id)sender {
    NSLog(@"botao Salvar");
    if (_campoNome.text.length > 0) {
        [_botaoSalvar setHidden:YES];
        Receita *r = [[Receita alloc] initWithNome:_campoNome.text passos:_passos.text eIngredientes:igd];
        [[ReceitaStore sharedInstance] addReceita:r];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}
@end
