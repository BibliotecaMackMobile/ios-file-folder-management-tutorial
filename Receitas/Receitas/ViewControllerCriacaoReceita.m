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
#import "ReceitaStore.h"

@interface ViewControllerCriacaoReceita ()

@end

@implementation ViewControllerCriacaoReceita

@synthesize telaReceitas;

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
        opcoesSemFoto = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancelar" destructiveButtonTitle:nil otherButtonTitles:@"Escolher Foto da Biblioteca",@"Tirar Foto", nil];
        opcoesComFoto = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancelar" destructiveButtonTitle:@"Remover Foto" otherButtonTitles:@"Escolher Foto da Biblioteca",@"Tirar Foto", nil];
        imgEscolhida = [[UIImageView alloc] initWithFrame:CGRectMake(0.25*window.bounds.size.width, 0.25*window.bounds.size.width, 0.5*window.bounds.size.width, 0.5*window.bounds.size.width)];
        imgEscolhida.contentMode = UIViewContentModeScaleAspectFill;
        btnCriar = [[UIBarButtonItem alloc] initWithTitle:@"Criar" style:UIBarButtonItemStylePlain target:self action:@selector(criarReceita)];
        btnCriar.enabled = NO;
        self.navigationItem.rightBarButtonItem = btnCriar;
    }
    return self;
}

-(void)validarPermissaoCriarReceita {
    BOOL nomePreenchido = ![novaReceita.nome isEqualToString:@""];
    BOOL instrucoesPreenchidas = (![novaReceita.instrucoes isEqualToString:@""]) && novaReceita.instrucoes != nil;
    if (nomePreenchido && instrucoesPreenchidas) {
        btnCriar.enabled = YES;
    }
    else btnCriar.enabled = NO;
}

-(void)criarReceita {
    ReceitaStore *receitaStore = [ReceitaStore sharedInstance];
    [receitaStore addReceita:novaReceita];
    [telaReceitas atualizarReceitas];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)atualizarNome {
    novaReceita.nome = txtNome.text;
    [self validarPermissaoCriarReceita];
}

-(void)atualizarInstrucoes:(NSString *)instrucoes {
    novaReceita.instrucoes = instrucoes;
    [self validarPermissaoCriarReceita];
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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
            else {
                [cell.contentView addSubview:imgEscolhida];
                cell.textLabel.text = nil;
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

-(void) removerFoto {
    imgEscolhida.image = nil;
    novaReceita.imagem = nil;
    [self.tableView reloadData];
}

-(void) pegarImagemDaBibliotecaDeFotos {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    [imagePicker setDelegate:self];
    [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self presentViewController:imagePicker animated:YES completion:nil];
}

-(void) pegarFotoCamera {
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        [imagePicker setDelegate:self];
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
    else {
        UIAlertView *cameraNaoDisponivel = [[UIAlertView alloc] initWithTitle:@"Câmera Não Disponível" message:@"Esse dispositivo não possui uma câmera disponível." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [self.tableView deselectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:2] animated:NO];
        [cameraNaoDisponivel show];
        
    }
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    UIImage *imagemOriginal = (UIImage *)[info objectForKey:UIImagePickerControllerOriginalImage];
    UIImage *img = [self imageWithImage:imagemOriginal scaledToSize:CGSizeMake(0.5 * window.bounds.size.width, 0.5 * window.bounds.size.width)];
    novaReceita.imagem = UIImageJPEGRepresentation(img, 1);
    imgEscolhida.image = img;
    [self.tableView reloadData];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    CGSize scaledSize = newSize;
    float scaleFactor = 1.0;
    if( image.size.width > image.size.height ) {
        scaleFactor = image.size.width / image.size.height;
        scaledSize.width = newSize.width;
        scaledSize.height = newSize.height / scaleFactor;
    }
    else {
        scaleFactor = image.size.height / image.size.width;
        scaledSize.height = newSize.height;
        scaledSize.width = newSize.width / scaleFactor;
    }
    
    UIGraphicsBeginImageContextWithOptions( scaledSize, NO, 0.0 );
    CGRect scaledImageRect = CGRectMake( 0.0, 0.0, scaledSize.width, scaledSize.height );
    [image drawInRect:scaledImageRect];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaledImage;
}

- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (popup == opcoesSemFoto) {
        switch (buttonIndex) {
            case 0:
                [self pegarImagemDaBibliotecaDeFotos];
                break;
            case 1:
                [self pegarFotoCamera];
                break;
            default:
                [self.tableView deselectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:2] animated:NO];
                break;
        }
    }
    else {
        switch (buttonIndex) {
            case 0:
                [self removerFoto];
                break;
            case 1:
                [self pegarImagemDaBibliotecaDeFotos];
                break;
            case 2:
                [self pegarFotoCamera];
                break;
            default:
                [self.tableView deselectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:2] animated:NO];
                break;
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    if (indexPath.section == 2) {
        return novaReceita.imagem == nil ? 44 : window.bounds.size.width;
    }
    else return 44;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


@end
