//
//  ViewControllerTelaInicial.m
//  Receitas
//
//  Created by André Gimenez Faria on 09/04/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "ViewControllerTelaInicial.h"

@interface ViewControllerTelaInicial ()

@end

@implementation ViewControllerTelaInicial

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(ViewControllerTelaInicial *) init {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        tabelaReceitas = [[ViewControllerTabelaReceitas alloc] initWithStyle:UITableViewStylePlain];
        [self.view addSubview:tabelaReceitas.tableView];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
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
