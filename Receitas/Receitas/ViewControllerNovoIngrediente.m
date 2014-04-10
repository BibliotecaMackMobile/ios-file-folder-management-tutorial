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
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
