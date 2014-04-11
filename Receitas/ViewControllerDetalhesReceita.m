//
//  ViewControllerDetalhesReceita.m
//  Receitas
//
//  Created by André Gimenez Faria on 09/04/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "ViewControllerDetalhesReceita.h"

@interface ViewControllerDetalhesReceita ()

@end

@implementation ViewControllerDetalhesReceita

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(ViewControllerDetalhesReceita *) initComReceita:(Receita *)r {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        receita = r;
        UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
        scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, window.bounds.size.width, window.bounds.size.height)];
        scrollView.contentSize = window.bounds.size;
        UIImage *imagemDaReceita = [UIImage imageWithData:receita.imagem];
        imgReceita = [[UIImageView alloc] initWithFrame:CGRectMake((window.bounds.size.width-imagemDaReceita.size.width)/2 , 24,imagemDaReceita.size.width,imagemDaReceita.size.height)];
        imgReceita.contentMode = UIViewContentModeScaleAspectFill;
        imgReceita.image = imagemDaReceita;
        [scrollView addSubview:imgReceita];
        
        txtNome = [[UILabel alloc] initWithFrame:CGRectMake(window.bounds.size.width * 0.25, 36 + imagemDaReceita.size.height, window.bounds.size.width * 0.50, 72)];
        txtNome.text = receita.nome;
        txtNome.font = [UIFont systemFontOfSize:36];
        txtNome.textAlignment = NSTextAlignmentCenter;
        txtIngredientes = [[UITextView alloc] initWithFrame:CGRectMake(24, 36 + 72 + imagemDaReceita.size.height, window.bounds.size.width - 48, window.bounds.size.height)];

        NSMutableString *informacoesIngredientes = [[NSMutableString alloc] initWithString:@""];
        for (Ingrediente *i in receita.ingredientes) {
            [informacoesIngredientes appendString:[NSString stringWithFormat:@"%@ %@ de %@\n",i.quantidade,i.unidadeMedida,i.nome]];
        }
        txtIngredientes.text = informacoesIngredientes;
        txtIngredientes.editable = NO;
        txtIngredientes.font = [UIFont systemFontOfSize:16];
        txtIngredientes.textAlignment = NSTextAlignmentCenter;
        txtIngredientes.textColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1];
        
        txtInstrucoes = [[UITextView alloc] initWithFrame:CGRectMake(24, 36 + 72 + 12 + imagemDaReceita.size.height + [self textViewHeightForAttributedText:[[NSAttributedString alloc] initWithString:txtIngredientes.text] andWidth:window.bounds.size.width - 48], window.bounds.size.width - 48, window.bounds.size.height)];
        txtInstrucoes.editable = NO;
        txtInstrucoes.text = receita.instrucoes;
        txtInstrucoes.scrollEnabled = NO;
        txtInstrucoes.font = [UIFont systemFontOfSize:16];
        
        self.navigationItem.title = receita.nome;
        
    }
    return self;
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

- (CGFloat)textViewHeightForAttributedText: (NSAttributedString*)text andWidth: (CGFloat)width {
    UITextView *calculationView = [[UITextView alloc] init];
    [calculationView setAttributedText:text];
    CGSize size = [calculationView sizeThatFits:CGSizeMake(width, FLT_MAX)];
    return size.height;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
     UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    scrollView.contentSize = CGSizeMake(window.bounds.size.width, 72 + 12 + imgReceita.image.size.height + 72 + 12 + [self textViewHeightForAttributedText:[[NSAttributedString alloc] initWithString:txtInstrucoes.text] andWidth:window.bounds.size.width - 48] + [self textViewHeightForAttributedText:[[NSAttributedString alloc] initWithString:txtIngredientes.text] andWidth:window.bounds.size.width-48]);
    [scrollView addSubview:txtNome];
    [scrollView addSubview:txtIngredientes];
    [scrollView addSubview:txtInstrucoes];
    [self.view addSubview:scrollView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
