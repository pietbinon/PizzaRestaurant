//
//  Pizza.m
//  PizzaRestaurant
//
//  Created by Pierre Binon on 2017-02-17.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import "Pizza.h"



@implementation Pizza

- (instancetype) initWithSize: (PizzaSize) size andToppings: (NSArray<NSString*> *) toppings
{
    self = [super init];
    if (self) {
        _size = size;
        _toppings = toppings;
    }
    return self;
}

@end
