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


//===========C METHODS BEGIN================C METHODS BEGIN===============C METHODS BEGIN==================
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


//=======================ANOTHER C METHOD TO CONVERT NSINTEGER (IN NS_ENUM) BACK TO NSSTRING================
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
//==============C METHODS END================C METHODS END================C METHODS END====================



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
            
            if ([string containsString: @"happy"]) {
                restaurantKitchen.delegate = happy;         //Kitchen is the DELEGATOR and is the one with the
            } else if ([string containsString: @"angry"]){  //property id delegate
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
            
//            //The two following lines are doing the same as line 110
//            NSArray *commandWords = [input componentsSeparatedByString:@" "];
//            NSMutableArray *commandWordsMutable = [commandWords mutableCopy];

            NSString *sizeString = commandWords[0];
            
//            NSString *sizeOrdered = [commandWordsMutable objectAtIndex: 0];
//            //            //Does the same as previous line...
//            //            NSString *sizeOrdered = commandWordsMutable[0];

        
            [commandWords removeObjectAtIndex: 0];

            
            
//=================================================================================================================
//            PizzaSize size = convertFromStringToInteger(sizeOrdered);
//            
//            //            //Cannot use this line because even though PizzaSize is made of NSInteger, the type is PizzaSize
//            //            NSInteger sizeOrderedInt = [sizeOrdered integerValue];
//            
//            [commandWordsMutable removeObjectAtIndex: 0];
//            //            //The following line does the same as the previous line
//            //            [commandWordsMutable subarrayWithRange: NSMakeRange(1, commandWordsMutable.count - 1)];
//            NSArray *commandWordsWithoutSize = [commandWordsMutable copy];
//================================================================================================================
            
            
            
            
            
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

