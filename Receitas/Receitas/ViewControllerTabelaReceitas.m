//
//  ViewControllerTabelaReceitas.m
//  Receitas
//
//  Created by André Gimenez Faria on 09/04/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "ViewControllerTabelaReceitas.h"
#import "ReceitaStore.h"
#import "Receita.h"
#import "ViewControllerDetalhesReceita.h"
#import "ViewControllerCriacaoReceita.h"

@interface ViewControllerTabelaReceitas ()

@end

@implementation ViewControllerTabelaReceitas

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        receitaStore = [ReceitaStore sharedInstance];
        btnNovaReceita = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(irParaTelaDeCriacao)];
        btnEditar = [[UIBarButtonItem alloc] initWithTitle:@"Editar" style:UIBarButtonItemStylePlain target:self action:@selector(mudarEstadoEdicao)];
        [self mudarEstadoBotaoEditar];
        self.navigationItem.leftBarButtonItem = btnEditar;
        self.navigationItem.rightBarButtonItem = btnNovaReceita;
        self.navigationItem.title = @"Receitas";
    }
    return self;
}

-(void) irParaTelaDeCriacao {
    ViewControllerCriacaoReceita *telaCriacao = [[ViewControllerCriacaoReceita alloc] initWithStyle:UITableViewStyleGrouped];
    [telaCriacao setTelaReceitas:self];
    UINavigationController *barraNavegacao = [[UINavigationController alloc] initWithRootViewController:telaCriacao];
    [self presentViewController:barraNavegacao animated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
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
    return [receitaStore quantidadeReceitas];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"celulaReceita"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"celulaReceita"];
    }
    
    Receita *receitaCelula = [receitaStore obterReceitaDoIndice:indexPath.row];
    
    cell.textLabel.text = receitaCelula.nome;
    cell.detailTextLabel.text = receitaCelula.instrucoes;
    
    UIImage *imagemReceita = [self imageWithImage:[UIImage imageWithData:receitaCelula.imagem] scaledToSize:CGSizeMake(48, 48)];
    cell.imageView.image = imagemReceita;
    cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
   
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 72;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Receita *receitaEscolhida = [receitaStore obterReceitaDoIndice:indexPath.row];
    ViewControllerDetalhesReceita *detalhesReceita = [[ViewControllerDetalhesReceita alloc] initComReceita:receitaEscolhida];
    [self.navigationController pushViewController:detalhesReceita animated:YES];
}

-(void)mudarEstadoBotaoEditar {
    if ([receitaStore quantidadeReceitas] == 0) {
        btnEditar.enabled = NO;
        btnEditar.title = @"Editar";
    }
    else btnEditar.enabled = YES;
}

-(void)mudarEstadoEdicao {
    if ([self isEditing]) {
        self.editing = NO;
        btnEditar.title = @"Editar";
    }
    else {
        self.editing = YES;
        btnEditar.title = @"OK";
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"Deletar";
}

-(void)atualizarReceitas {
    [self mudarEstadoBotaoEditar];
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        Receita *receitaParaDeletar = [receitaStore obterReceitaDoIndice:indexPath.row];
        [receitaStore deletarReceita:receitaParaDeletar];
        [self.tableView beginUpdates];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView endUpdates];
        [self mudarEstadoBotaoEditar];
    }
}
@end
