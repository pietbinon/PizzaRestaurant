//
//  main.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Kitchen.h"
#import "Pizza.h"
#import "HappyManager.h"
#import "AngryManager.h"


//======================SMALL C METHOD TO CONVERT NSSTRING INTO NSINTEGER (ENUM)=========================
PizzaSize getSizeFromString (NSString *s) {
    if ([s isEqualToString: @"small"]) {
        return small;
    } else if ([s isEqualToString: @"medium"]) {
        return medium;
    } else {
        return large;
    }
}
//=======================================================================================================


//=======================ANOTHER C METHOD TO CONVERT NSINTEGER (IN ENUM) BACK TO NSSTRING================
NSString* sizeToString (PizzaSize p) {
    if (p == small) {
        return @"small";
    } else if (p == medium) {
        return @"medium";
    } else {
        return @"large";
    }
}

////Another way of doing it
//NSString *sizeToString(PizzaSize size) {
//    NSString *result;
//    switch (size) {
//        case small:
//            result = @"small";
//            break;
//        case medium:
//            result = @"medium";
//            break;
//        case large:
//            result = @"large";
//            break;
//    }
//    return result;
//}
//=======================================================================================================


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Kitchen *restaurantKitchen = [Kitchen new];
        Pizza *pizza = [Pizza new];
        HappyManager *happy = [HappyManager new];
        AngryManager *angry = [[AngryManager alloc] init];
        
        while (TRUE) {
            // Loop forever
            
            
            
            //MANAGER CHOICE
            NSLog (@"Would you like to speak to a happy or angry manager?");
            
            char inputChar[255];
            fgets(inputChar, 255, stdin);
            NSString *inputString = [[NSString alloc] initWithUTF8String: inputChar];
            NSString *string = [inputString stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
//            NSString *happy = @"happy";
//            NSString *angry = @"angry";
            
            if ([string containsString: @"happy"]) {
                restaurantKitchen.delegate = happy;
            } else if ([string containsString: @"angry"]){
                restaurantKitchen.delegate = angry;
            } else {
                NSLog(@"There is no manager so the kitchen staff came to greet you");
            }

            
            
            //PIZZA CHOICE
            NSLog(@"Please pick your pizza size and toppings:");
            
            //Get the user input
            char str[100];
            fgets (str, 100, stdin);
            NSString *inputPizzaString = [[NSString alloc] initWithUTF8String:str];
            inputString = [inputPizzaString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            NSLog(@"Input was %@", inputString);
            
            // Take the first word of the command as the size, and the rest as the toppings
            //componentsSeparatedByString: Returns an array containing substrings from the receiver that have been
            //divided by a given separator:
            //- (NSArray<NSString *> *)componentsSeparatedByString:(NSString *)separator;
            NSMutableArray *commandWords = [[inputString componentsSeparatedByString:@" "] mutableCopy];
            NSString *sizeString = commandWords[0];
            [commandWords removeObjectAtIndex: 0];
            
            //Convert it to PizzaSize enum - See the above C method
            PizzaSize size = getSizeFromString(sizeString);
//            //Returns only large size pizza when using the following line of code to avoid having to use the small C
//            //method above
//            PizzaSize size = [sizeString integerValue];
            
            // And then send some message to the kitchen...
            //Could be Pizza *pizza = [restaurantKitchen makePizzaWithSize: size toppings: commandWords];
            //AS LONG AS WE RETURN FROM [restaurantKitchen makePizzaWithSize: size toppings: commandWords]; A PIZZA
            //OBJECT AS REQUIRED IN THE METHOD DEFINED IN THE KITCHEN CLASS
            pizza = [restaurantKitchen makePizzaWithSize: size toppings: commandWords];
            
            //Need to convert the size back from NSInteger (in ENUM) to a NSString to be displayed in the NSLog
            //See above C method
            NSLog (@"Here is your %@ pizza: %@", sizeToString(pizza.size) , pizza.toppings);
        }

    }
    return 0;
}

