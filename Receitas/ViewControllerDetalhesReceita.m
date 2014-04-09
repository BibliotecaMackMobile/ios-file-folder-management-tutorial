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
        
        imgReceita = [[UIImageView alloc] initWithFrame:CGRectMake(window.bounds.size.width * 0.25, 24, window.bounds.size.width * 0.5, window.bounds.size.width * 0.5)];
        imgReceita.contentMode = UIViewContentModeScaleAspectFill;
        UIImage *imagemDaReceita = [self imageWithImage:[UIImage imageWithData:receita.imagem] scaledToSize:CGSizeMake(window.bounds.size.width * 0.5, window.bounds.size.width * 0.5)];
        imgReceita.image = imagemDaReceita;
        [scrollView addSubview:imgReceita];
        
        txtNome = [[UILabel alloc] initWithFrame:CGRectMake(window.bounds.size.width * 0.25, 36 + window.bounds.size.width * 0.5, window.bounds.size.width * 0.50, 72)];
        txtNome.text = receita.nome;
        txtNome.font = [UIFont systemFontOfSize:36];
        txtNome.textAlignment = NSTextAlignmentCenter;
    
        txtInstrucoes = [[UITextView alloc] initWithFrame:CGRectMake(24, 36 + 72 + window.bounds.size.width * 0.5, window.bounds.size.width - 48, window.bounds.size.height)];
        txtInstrucoes.editable = NO;
        txtInstrucoes.text = receita.instrucoes;
        txtInstrucoes.scrollEnabled = NO;
        txtInstrucoes.font = [UIFont systemFontOfSize:16];
        [scrollView addSubview:txtNome];
        [scrollView addSubview:txtInstrucoes];
        
        [self.view addSubview:scrollView];
        
        
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
     UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    scrollView.contentSize = CGSizeMake(window.bounds.size.width, 72 + 12 + window.bounds.size.width * 0.5 + 72 + 12 + [self textViewHeightForAttributedText:[[NSAttributedString alloc] initWithString:txtInstrucoes.text] andWidth:window.bounds.size.width - 48]);
    // Do any additional setup after loading the view.
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

@end
