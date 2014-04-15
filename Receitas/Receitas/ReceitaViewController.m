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
@synthesize receitaNum;



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
    
    
    if(receitaNum == 0){
    
    // TODO acertar layout e pegar dados da receita atual
    nome = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width/2, height*.2)];
    nome.text = @"Bolo de Abacaxi";
    nome.textAlignment = NSTextAlignmentCenter;
    nome.font = [UIFont fontWithName:@"Zapfino" size:14];
    nome.textColor = [UIColor blueColor];
    [self.view addSubview:nome]; 
    
    
    fileManager = [[NSFileManager alloc] init ];
    urls = [fileManager URLsForDirectory:
                                                            NSDocumentDirectory inDomains:NSUserDomainMask];
    for(int i = 0; i < [urls count]; i++ ) {
        NSLog(@"%@", urls[i]); }

   // NSString *caminho = [NSTemporaryDirectory() stringByAppendingPathComponent:@"MeuArquivo.txt"];
   // NSArray *nomes = @[@"Paz" , @"Amor" ] ;
  //  BOOL resultado = [nomes writeToFile:caminho atomically:YES];
   // NSArray *leitura = [[NSArray alloc] initWithContentsOfFile: caminho ] ;
 //   if ([leitura count] != [nomes count]) NSLog(@"Falha de leitura"); if(!resultado) NSLog(@"Falha de escrita");

    
    //cria a image view e inicializa - TODO carregar e guardar fotos. Desafio Ouro
    foto = [[UIImageView alloc] initWithFrame:CGRectMake(0, width/5, width/1, height*.4)];
    foto.image = [UIImage imageNamed: @"abacaxii.png"];
    foto.userInteractionEnabled = YES;
    [self.view addSubview:foto];

    // TODO acertar layout e pegar dados da receita atual
    ingredientes = [[UILabel alloc] initWithFrame:CGRectMake(0, height*.2, width*.5, height*.5)];
    [ingredientes setNumberOfLines:0];
    ingredientes.text = @"   Ingredientes: \n - Açúcar "" - Farinha \n - Ovos "" - Fermento \n - Abacaxi \n";
    ingredientes.textAlignment = NSTextAlignmentCenter;
    ingredientes.font = [UIFont fontWithName:@"ZapFino" size:11];
    ingredientes.textColor = [UIColor blueColor];
    [self.view addSubview:ingredientes];
    
    //AQUI!!!!!!!
    // TODO acertar layout e pegar dados da receita atual
    modoDePreparo = [[UILabel alloc] initWithFrame:CGRectMake(0, height*.6, width, height*.4)];
    [modoDePreparo setNumberOfLines:0];
    modoDePreparo.text = @"Modo de Preparo: \n 1 - Misture a farinha com os ovos e o fermento \n 2 - Acrescente o açúcar e os pedaços de abacaxi \n 3 - Bata tudo e coloque no forno por uma hora.";
    modoDePreparo.textAlignment = NSTextAlignmentCenter;
    modoDePreparo.font = [UIFont fontWithName:@"ZapFino" size:10];
    modoDePreparo.textColor = [UIColor blueColor];
    [self.view addSubview:modoDePreparo];
    }
    // ===========================================================================================
    
    else if(receitaNum == 1){
        // TODO acertar layout e pegar dados da receita atual
        nome = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width/2, height*.2)];
        nome.text = @"Bolo de Cenoura";
        nome.textAlignment = NSTextAlignmentCenter;
        nome.font = [UIFont fontWithName:@"ZapFino" size:14];
        nome.textColor = [UIColor colorWithRed:255/255.0f green:127/255.0f blue:0 alpha:1];
        [self.view addSubview:nome];
        
        
        fileManager = [[NSFileManager alloc] init ];
        urls = [fileManager URLsForDirectory:
                NSDocumentDirectory inDomains:NSUserDomainMask];
        for(int i = 0; i < [urls count]; i++ ) {
            NSLog(@"%@", urls[i]); }
        
        // NSString *caminho = [NSTemporaryDirectory() stringByAppendingPathComponent:@"MeuArquivo.txt"];
        // NSArray *nomes = @[@"Paz" , @"Amor" ] ;
        //  BOOL resultado = [nomes writeToFile:caminho atomically:YES];
        // NSArray *leitura = [[NSArray alloc] initWithContentsOfFile: caminho ] ;
        //   if ([leitura count] != [nomes count]) NSLog(@"Falha de leitura"); if(!resultado) NSLog(@"Falha de escrita");
        
        
        //cria a image view e inicializa - TODO carregar e guardar fotos. Desafio Ouro
        foto = [[UIImageView alloc] initWithFrame:CGRectMake(0, width/2, width/2, height*.2)];
        foto.userInteractionEnabled = YES;
        //foto.image  @"abacaxii.png";
        [self.view addSubview:foto];
        
        // TODO acertar layout e pegar dados da receita atual
        ingredientes = [[UILabel alloc] initWithFrame:CGRectMake(0, height*.2, width*.5, height*.5)];
        [ingredientes setNumberOfLines:0];
        ingredientes.text = @" Ingredientes: \n - Açúcar "" - Farinha \n - Cenoura "" - Ovos \n - Fermento";
        ingredientes.textAlignment = NSTextAlignmentCenter;
        ingredientes.font = [UIFont fontWithName:@"ZapFino" size:11];
        ingredientes.textColor = [UIColor colorWithRed:255/255.0f green:127/255.0f blue:0 alpha:1];
        [self.view addSubview:ingredientes];
        
        //AQUI!!!!!!!
        // TODO acertar layout e pegar dados da receita atual
        modoDePreparo = [[UILabel alloc] initWithFrame:CGRectMake(0, height*.6, width, height*.4)];
        [modoDePreparo setNumberOfLines:0];
        modoDePreparo.text = @"Modo de Preparo: \n 1 - Misture a farinha com os ovos e o fermento \n 2 - Acrescente o açúcar e a cenoura ralada \n 3 - Bata tudo e coloque no forno por uma hora \n 4 - Colocar a cobertura de chocolate";
        modoDePreparo.textAlignment = NSTextAlignmentCenter;
        modoDePreparo.font = [UIFont fontWithName:@"ZapFino" size:11];
        modoDePreparo.textColor = [UIColor colorWithRed:255/255.0f green:127/255.0f blue:0 alpha:1];
        [self.view addSubview:modoDePreparo];

        
        
    }
    
    
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
    ReceitaViewController *rvc = [[ReceitaViewController alloc]init];
    NSLog(@"Indo para proxima receita");
    [[ReceitaStore sharedInstance] next];
   
    rvc.receitaNum = receitaNum + 1;
    [self presentViewController:rvc animated:YES completion:nil];
    
    transition.subtype = kCATransitionFromRight;
    
    [self update];
}

- (void)previous:(id)sender
{
    ReceitaViewController *rcv = [[ReceitaViewController alloc]init];
    NSLog(@"Voltando para a receita anterior");
    [[ReceitaStore sharedInstance] previous];
    
    rcv.receitaNum = receitaNum -1 ;
    [self presentViewController:rcv animated:YES completion:nil];
    transition.subtype = kCATransitionFromLeft;
    [self update];
}


- (void)update
{
    // TODO atualizar a view com a receita atual
}







@end
