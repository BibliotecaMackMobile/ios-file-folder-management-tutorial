//
//  ViewControllerCriacaoReceita.m
//  Receitas
//
//  Created by André Gimenez Faria on 09/04/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "ViewControllerCriacaoReceita.h"
#import "ViewControllerTelaCriacaoInstrucoes.h"
#import "ViewControllerNovoIngrediente.h"

@interface ViewControllerCriacaoReceita ()

@end

@implementation ViewControllerCriacaoReceita

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        novaReceita = [[Receita alloc] init];
        UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
        txtNome = [[UITextField alloc] initWithFrame:CGRectMake(14, 0, window.bounds.size.width - 24, 44)];
        txtNome.placeholder = @"Nome";
        txtNome.delegate = self;
        [txtNome addTarget:self action:@selector(atualizarNome) forControlEvents:UIControlEventEditingChanged];
        btnCancelar = [[UIBarButtonItem alloc] initWithTitle:@"Cancelar" style:UIBarButtonItemStylePlain target:self action:@selector(voltar)];
        self.navigationItem.leftBarButtonItem = btnCancelar;
        self.navigationItem.title = @"Nova Receita";
        opcoesSemFoto = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancelar" destructiveButtonTitle:nil otherButtonTitles:@"Escolher Foto da Biblioteca",@"Tirar Foto", nil];
        opcoesComFoto = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancelar" destructiveButtonTitle:@"Remover Foto" otherButtonTitles:@"Escolher Foto da Biblioteca",@"Tirar Foto", nil];
    }
    return self;
}

-(void)atualizarNome {
    novaReceita.nome = txtNome.text;
}

-(void)atualizarInstrucoes:(NSString *)instrucoes {
    novaReceita.instrucoes = instrucoes;
    [self.tableView reloadData];
}

-(void)inserirIngrediente:(Ingrediente *)ingrediente {
    [novaReceita.ingredientes addObject:ingrediente];
    [self.tableView reloadData];
}



-(void)voltar {
    [self dismissViewControllerAnimated:YES completion:nil];
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
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 2;
        case 1:
            return [novaReceita.ingredientes count] + 1;
        default:
            return 1;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"celulaCriacao"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"celulaCriacao"];
    }
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    [cell.contentView addSubview:txtNome];
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    cell.textLabel.textColor = [UIColor blackColor];
                    break;
                default:
                    if (novaReceita.instrucoes == nil || [novaReceita.instrucoes isEqualToString:@""]) {
                        cell.textLabel.text = @"Adicionar Instruções";
                    }
                    else cell.textLabel.text = novaReceita.instrucoes;
                    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                    cell.textLabel.textColor = [UIColor blackColor];
                    break;
            }
            break;
        case 1:
            if ((indexPath.row == 0 && [novaReceita.ingredientes count] == 0) || (indexPath.row == [novaReceita.ingredientes count])) {
                cell.textLabel.text = @"Adicionar Ingrediente";
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.textLabel.textColor = [UIColor blackColor];
            }
            else {
                NSString *nome = [[novaReceita.ingredientes objectAtIndex:indexPath.row] nome];
                NSNumber *quantidade = [[novaReceita.ingredientes objectAtIndex:indexPath.row] quantidade];
                NSString *unidadeMedida = [[novaReceita.ingredientes objectAtIndex:indexPath.row] unidadeMedida];
                cell.textLabel.text = [NSString stringWithFormat:@"%@ %@ de %@",quantidade,unidadeMedida,nome];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.accessoryType = UITableViewCellSelectionStyleNone;
                cell.textLabel.textColor = [UIColor blackColor];
            }
            break;
        default:
            if (novaReceita.imagem == nil) {
                cell.textLabel.text = @"Inserir Imagem";
                cell.textLabel.textColor = [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0];
            }
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ViewControllerTelaCriacaoInstrucoes *telaInstrucoes = [[ViewControllerTelaCriacaoInstrucoes alloc] initComTexto:novaReceita.instrucoes];
    [telaInstrucoes setViewCriacao:self];
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 1:
                    [self.navigationController pushViewController:telaInstrucoes animated:YES];
                    break;
                    
                default:
                    break;
            }
            break;
        case 1:
            if ((indexPath.row == 0 && [novaReceita.ingredientes count] == 0) || (indexPath.row == [novaReceita.ingredientes count])) {
                ViewControllerNovoIngrediente *telaNovoIngrediente = [[ViewControllerNovoIngrediente alloc] initWithStyle:UITableViewStyleGrouped];
                [telaNovoIngrediente setViewCriacao:self];
                [self.navigationController pushViewController:telaNovoIngrediente animated:YES];
            }
            break;
        case 2:
            if (novaReceita.imagem == nil) {
                [opcoesSemFoto showInView:self.view];
            }
            else [opcoesComFoto showInView:self.view];
            break;
    }
}

- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {
    
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
