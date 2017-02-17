//
//  KitchenDelegate.h
//  PizzaRestaurant
//
//  Created by Pierre Binon on 2017-02-17.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pizza.h"


//Needed in delegate because Kitchen will be the delegator???
@class Kitchen;




@protocol KitchenDelegate <NSObject>

@required

//"(Kitchen *) kitchen" in such a method indicates Kitchen is the DELEGATOR!
- (BOOL) kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings;

- (BOOL) kitchenShouldUpgradeOrder:(Kitchen *)kitchen;


@optional

- (void) kitchenDidMakePizza:(Pizza *)pizza;

@end
