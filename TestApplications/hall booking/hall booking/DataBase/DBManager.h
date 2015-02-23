//
//  DBManager.h
//  hall booking
//
//  Created by Nupin Pillai on 19/01/15.
//  Copyright (c) 2015 Nupin Pillai. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DBManager : NSObject
{
    NSString *databasePath;
}

+(DBManager*)getSharedInstance;

-(NSMutableArray* ) getCountryArray ;
-(NSMutableArray* ) getStateArray :(NSString*)country;
-(NSMutableArray* ) getRegionArray :(NSString*)country location:(NSString*) location;

@end