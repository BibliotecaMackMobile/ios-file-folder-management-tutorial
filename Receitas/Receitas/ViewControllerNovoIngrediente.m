//
//  ViewControllerNovoIngrediente.m
//  Receitas
//
//  Created by André Gimenez Faria on 09/04/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "ViewControllerNovoIngrediente.h"

@interface ViewControllerNovoIngrediente ()

@end

@implementation ViewControllerNovoIngrediente

@synthesize viewCriacao;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
        txtNome = [[UITextField alloc] initWithFrame:CGRectMake(14, 0, window.bounds.size.width - 28, 44)];
        txtNome.placeholder = @"Nome";
        txtUnidadeMedida = [[UITextField alloc] initWithFrame:CGRectMake(14, 0, window.bounds.size.width - 28, 44)];
        txtUnidadeMedida.placeholder = @"Unidade de Medida";
        txtQuantidade = [[UITextField alloc] initWithFrame:CGRectMake(14, 0, window.bounds.size.width - 28, 44)];
        txtQuantidade.placeholder = @"Quantidade";
        txtQuantidade.keyboardType = UIKeyboardTypeNumberPad;
        btnCriarIngrediente = [[UIBarButtonItem alloc] initWithTitle:@"Criar Ingrediente" style:UIBarButtonItemStylePlain target:self action:@selector(criarIngrediente)];
        self.navigationItem.rightBarButtonItem = btnCriarIngrediente;
    }
    return self;
}

-(void)criarIngrediente {
    novoIngrediente = [[Ingrediente alloc] init];
    novoIngrediente.nome = txtNome.text;
    novoIngrediente.unidadeMedida = txtUnidadeMedida.text;
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    novoIngrediente.quantidade = [f numberFromString:txtQuantidade.text];
    [viewCriacao inserirIngrediente:novoIngrediente];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"celulaIngrediente"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"celulaIngrediente"];
    }
    switch (indexPath.row) {
        case 0:
            [cell.contentView addSubview:txtNome];
            break;
        case 1:
            [cell.contentView addSubview:txtUnidadeMedida];
            break;
        case 2:
            [cell.contentView addSubview:txtQuantidade];
            break;
        default:
            break;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}



@end
