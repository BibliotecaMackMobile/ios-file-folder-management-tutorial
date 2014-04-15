//
//  ReceitaViewController.m
//  Receitas
//
//  Created by Vinicius Miana on 3/30/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "NovaReceitaViewController.h"
#import "ReceitaViewController.h"
#import "ReceitaStore.h"
#import "Receita.h"
#import "Ingrediente.h"


@interface ReceitaViewController () {
    
    UILabel *nome;
    UILabel *ingredientes;
    UILabel *modoDePreparo;
    UIImageView *foto;
    UISwipeGestureRecognizer *swipeLeft;
    UISwipeGestureRecognizer *swipeRight;
    CATransition *transition;

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
    UIButton *novaReceita = [UIButton buttonWithType:UIButtonTypeContactAdd];
    novaReceita.frame = CGRectMake(width*0.8, height*0.08, 50, 50);
    [novaReceita addTarget:self action:@selector(adicionar:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:novaReceita];
    nome = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0,self.view.frame.size.width, self.view.frame.size.height/5)];

    nome.textAlignment = NSTextAlignmentCenter;
    nome.font = [UIFont fontWithName:@"Arial" size:20];
    nome.textColor = [UIColor blueColor];
    [self.view addSubview:nome];

    
    //cria a image view e inicializa - TODO carregar e guardar fotos. Desafio Ouro
    foto = [[UIImageView alloc] initWithFrame:CGRectMake(0, width/2, width/2, height*.2)];
    foto.userInteractionEnabled = YES;
    [self.view addSubview:foto];
    
    // TODO acertar layout e pegar dados da receita atual
    ingredientes = [[UILabel alloc] initWithFrame:CGRectMake(0, height*.2, width, height*.4)];
    [ingredientes setNumberOfLines:0];
    //ingredientes.text = @"Ingredientes1\nIngredientes1\nIngredientes1\nIngredientes1\nIngredientes1\nIngredientes1\n";
    ingredientes.textAlignment = NSTextAlignmentCenter;
    ingredientes.font = [UIFont fontWithName:@"Arial" size:10];
    ingredientes.textColor = [UIColor redColor];
    [self.view addSubview:ingredientes];
    

    // TODO acertar layout e pegar dados da receita atual
    modoDePreparo = [[UILabel alloc] initWithFrame:CGRectMake(0, height*.6, width, height*.4)];
    [modoDePreparo setNumberOfLines:0];
    //modoDePreparo.text = @"Misture o Ingredientes1\n com Ingredientes1\n e depois Ingredientes1\n batat Ingredientes1\npique Ingredientes1\nasse no forno Ingredientes1\n";
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
    Receita *r = [[ReceitaStore sharedInstance] atual];
    NSArray *aux = [r ingredientes];
    NSMutableString *texto = [[NSMutableString alloc] init];
    for (Ingrediente *igd in aux) {
        if ([igd nome]) {
            [texto appendString:[NSString stringWithFormat:@"%@\n", [igd nome]]];
            
        }
    }
    modoDePreparo.text = [r passos];
    ingredientes.text = [NSString stringWithFormat:@"%@", texto];
    nome.text = r.nome;
}

-(IBAction) adicionar: (id) sender {
    NSLog(@"Pressionado");
    NovaReceitaViewController *nr = [[NovaReceitaViewController alloc] initWithNibName:@"NovaReceitaView" bundle:[NSBundle mainBundle]];
    [self presentViewController:nr animated:YES completion:nil];
    
}





@end
