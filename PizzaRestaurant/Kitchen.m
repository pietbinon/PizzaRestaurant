//
//  Kitchen.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "Kitchen.h"

@implementation Kitchen

- (Pizza *)makePizzaWithSize:(PizzaSize)size toppings:(NSArray *)toppings {
    
    
    //If (YES)
    if (self.delegate != nil) {
        
        //If (YES)
        if ([self.delegate kitchenShouldUpgradeOrder: self]) {
            size = large;
        }
    }

    
    
    Pizza *pizza;
    
    
    
    //Same as if (YES)
    if (self.delegate != nil) {
        
        //Same as if (YES)
        if ([self.delegate kitchen: self shouldMakePizzaOfSize: size andToppings: toppings]) {
            pizza  =[[Pizza alloc] initWithSize: size andToppings: toppings];
            return pizza;
        } else {
            return nil;
        }
    } /*else {//Not necessary
        pizza = [[Pizza alloc] initWithSize: size andToppings: toppings];
    }*/
    return pizza;
    
    
    
    
    
    
    
//    //respondsToSelector: Required. Returns a Boolean value that indicates whether the receiver implements or inherits a
//    //method that can respond to a specified message:
//    if (self.delegate != nil) {
//        if ([self.delegate respondsToSelector: @selector(kitchenDidMakePizza:)]) {
//            [self.delegate kitchenDidMakePizza: pizza];
//        } else {
//            return nil;
//        }
//    }

    
    
}

@end
