//
//  ReceitaViewController.m
//  Receitas
//
//  Created by Vinicius Miana on 3/30/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "ReceitaViewController.h"
#import "ReceitaStore.h"

@interface ReceitaViewController () {
    
    UILabel *nome;
    UILabel *ingredientes;
    UILabel *modoDePreparo;
    UIImageView *foto;
    UISwipeGestureRecognizer *swipeLeft;
    UISwipeGestureRecognizer *swipeRight;
    CATransition *transition;
    NSFileManager *fileManager;
    NSArray *urls;
    
}

@end

@implementation ReceitaViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = YES;
}

- (void) viewDidLoad {
    [super viewDidLoad];
    //cria animacao para mudar receitas
    transition = [CATransition animation];
    transition.duration = 0.5f;
    transition.type = kCATransitionPush;
    
    int height = self.view.bounds.size.height;
    int width = self.view.bounds.size.width;
    
    // TODO acertar layout e pegar dados da receita atual
    nome = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width/2, height*.2)];
    nome.text = @"Pegar nome da receita atual";
    nome.textAlignment = NSTextAlignmentCenter;
    nome.font = [UIFont fontWithName:@"Arial" size:10];
    nome.textColor = [UIColor redColor];
    [self.view addSubview:nome]; 
    
    
    fileManager = [[NSFileManager alloc] init ];
    urls = [fileManager URLsForDirectory:
                                                            NSDocumentDirectory inDomains:NSUserDomainMask];
    for(int i = 0; i < [urls count]; i++ ) {
        NSLog(@"%@", urls[i]); }

    NSString *caminho = [NSTemporaryDirectory() stringByAppendingPathComponent:@"MeuArquivo.txt"];
    NSArray *nomes = @[@"Paz" , @"Amor" ] ;
    BOOL resultado = [nomes writeToFile:caminho atomically:YES];
    NSArray *leitura = [[NSArray alloc] initWithContentsOfFile: caminho ] ;
    if ([leitura count] != [nomes count]) NSLog(@"Falha de leitura"); if(!resultado) NSLog(@"Falha de escrita");

    
    //cria a image view e inicializa - TODO carregar e guardar fotos. Desafio Ouro
    foto = [[UIImageView alloc] initWithFrame:CGRectMake(0, width/2, width/2, height*.2)];
    foto.userInteractionEnabled = YES;
    [self.view addSubview:foto];
    
    // TODO acertar layout e pegar dados da receita atual
    ingredientes = [[UILabel alloc] initWithFrame:CGRectMake(0, height*.2, width, height*.4)];
    [ingredientes setNumberOfLines:0];
    ingredientes.text = @"Ingredientes1\nIngredientes1\nIngredientes1\nIngredientes1\nIngredientes1\nIngredientes1\n";
    ingredientes.textAlignment = NSTextAlignmentCenter;
    ingredientes.font = [UIFont fontWithName:@"Arial" size:10];
    ingredientes.textColor = [UIColor redColor];
    [self.view addSubview:ingredientes];
    

    // TODO acertar layout e pegar dados da receita atual
    modoDePreparo = [[UILabel alloc] initWithFrame:CGRectMake(0, height*.6, width, height*.4)];
    [modoDePreparo setNumberOfLines:0];
    modoDePreparo.text = @"Misture o Ingredientes1\n com Ingredientes1\n e depois Ingredientes1\n batat Ingredientes1\npique Ingredientes1\nasse no forno Ingredientes1\n";
    modoDePreparo.textAlignment = NSTextAlignmentCenter;
    modoDePreparo.font = [UIFont fontWithName:@"Arial" size:10];
    modoDePreparo.textColor = [UIColor redColor];
    [self.view addSubview:modoDePreparo];
    
    swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(next:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeft];
    
    swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(previous:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
    [self update];

}

- (void)next:(id)sender
{
    NSLog(@"Indo para proxima receita");
    [[ReceitaStore sharedInstance] next];
    
    transition.subtype = kCATransitionFromRight;
    
    [self update];
}

- (void)previous:(id)sender
{
    [[ReceitaStore sharedInstance] previous];
    transition.subtype = kCATransitionFromLeft;
    [self update];
}


- (void)update
{
    // TODO atualizar a view com a receita atual
}







@end
