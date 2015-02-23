//
//  main.m
//  MyProject
//
//  Created by Nupin Pillai on 30/01/15.
//  Copyright (c) 2015 Nupin Pillai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        int x;
        
        NSLog(@"entered value = %i",x);
        
        
        NSString *a = @"check";
        
        NSLog(@"test value %@",a);
        
        Person *person = [Person alloc];
        [person enterInfo];
        [person printInfo];
    }
    return 0;
}
