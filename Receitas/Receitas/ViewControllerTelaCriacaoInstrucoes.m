//
//  ViewControllerTelaCriacaoInstrucoes.m
//  Receitas
//
//  Created by André Gimenez Faria on 09/04/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "ViewControllerTelaCriacaoInstrucoes.h"

@interface ViewControllerTelaCriacaoInstrucoes ()

@end

@implementation ViewControllerTelaCriacaoInstrucoes

@synthesize viewCriacao;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

-(ViewControllerTelaCriacaoInstrucoes *)initComTexto:(NSString *)texto {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
        txtInstrucoes = [[UITextView alloc] initWithFrame:CGRectMake(14, 24, window.bounds.size.width - 28, window.bounds.size.height - 44)];
        txtInstrucoes.text = texto;
        txtInstrucoes.editable = YES;
        txtInstrucoes.font = [UIFont systemFontOfSize:16];
        [txtInstrucoes setDelegate:self];
        [self.view addSubview:txtInstrucoes];
    }
    return self;
}

- (void)textViewDidChange:(UITextView *)textView{
    [viewCriacao atualizarInstrucoes:[txtInstrucoes text]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(-60, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
    [txtInstrucoes becomeFirstResponder];

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
