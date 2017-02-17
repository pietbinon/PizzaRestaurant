//
//  Pizza.h
//  PizzaRestaurant
//
//  Created by Pierre Binon on 2017-02-17.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, PizzaSize) {
    small = 1,
    medium = 2,
    large = 3
};


@interface Pizza : NSObject

@property (nonatomic) PizzaSize size;
@property (nonatomic) NSArray <NSString*> *toppings;

- (instancetype) initWithSize: (PizzaSize) size andToppings: (NSArray<NSString*> *) toppings;

@end
