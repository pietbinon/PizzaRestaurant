//
//  AngryManager.m
//  PizzaRestaurant
//
//  Created by Pierre Binon on 2017-02-17.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import "AngryManager.h"



@implementation AngryManager


- (BOOL) kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings {
    
//    if ([toppings containsObject: @"anchovies"])
    
    
    BOOL makePizzaFlag = YES;
    
    for (NSString *topping in toppings) {
        if ([topping isEqualToString: @"anchovies"])
            makePizzaFlag = NO;
    }
    return makePizzaFlag;

}


- (BOOL) kitchenShouldUpgradeOrder:(Kitchen *)kitchen {
    return NO;
}


- (void) kitchenDidMakePizza:(Pizza *)pizza {}

@end
