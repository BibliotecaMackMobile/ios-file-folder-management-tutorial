//
//  ReceitaViewController.h
//  Receitas
//
//  Created by Vinicius Miana on 3/30/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Receita.h"
@interface ReceitaViewController : UIViewController
{
    Receita *receita;

}
-(void) update;
@property int receitaNum;
@end
