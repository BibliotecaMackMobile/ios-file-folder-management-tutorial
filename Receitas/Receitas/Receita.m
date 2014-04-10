//
//  Receita.m
//  Receitas
//
//  Created by Vinicius Miana on 3/30/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "Receita.h"

@implementation Receita

@synthesize passos;
@synthesize ingredientes;

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:passos forKey:@"passos"];
    [aCoder encodeObject:ingredientes forKey:@"ingredientes"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        passos = [aDecoder decodeObjectForKey:@"passos"];
        ingredientes = (NSMutableArray *)[aDecoder decodeObjectForKey:@"ingredientes"];
    }
    return self;
}
@end
