//
//  DBManager.m
//  hall booking
//
//  Created by Nupin Pillai on 19/01/15.
//  Copyright (c) 2015 Nupin Pillai. All rights reserved.
//

#import "DBManager.h"
static DBManager *sharedInstance = nil;
static sqlite3 *database = nil;
static sqlite3_stmt *statement = nil;
//
@implementation DBManager

+(DBManager*)getSharedInstance{
    if (!sharedInstance) {
        sharedInstance = [[super allocWithZone:NULL]init];
        [sharedInstance openDBConeection];
    }
    return sharedInstance;
}

-(void)openDBConeection{
//    NSString *docsDir;
//    NSArray *dirPaths;
//    // Get the documents directory
//    dirPaths = NSSearchPathForDirectoriesInDomains
//    (NSDocumentDirectory, NSUserDomainMask, YES);
//    docsDir = dirPaths[0];
//    // Build the path to the database file
//    databasePath = [[NSString alloc] initWithString:
//                    [docsDir stringByAppendingPathComponent: @"HallBookingDoc.sqlite"]];
    
    databasePath = [[NSBundle mainBundle] pathForResource:@"HallBooking" ofType:@"sqlite"];
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if ([filemgr fileExistsAtPath: databasePath] == YES)
    {
        const char *dbpath = [databasePath UTF8String];
        if (sqlite3_open(dbpath, &database) == SQLITE_OK)
        {
            NSLog(@"Able to access db");
        }
        else
        {
            NSLog(@"Not able to access db");
        }
    }
    
}


-(NSMutableArray* ) getCountryArray
{
    const char *dbpath = [databasePath UTF8String];
    if (sqlite3_open(dbpath, &database) == SQLITE_OK)
    {
        NSString *querySQL = [NSString stringWithFormat:
                              @"select Country_Id, Country_Name from \"Country\""];
        const char *query_stmt = [querySQL UTF8String];
        NSMutableArray *resultArray = [[NSMutableArray alloc]init];
        
        NSLog(@"%d",sqlite3_prepare_v2(database,
                                       query_stmt, -1, &statement, NULL));
        
        if (sqlite3_prepare_v2(database,
                               query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                [resultArray addObject:[[NSString alloc]initWithUTF8String:
                                  (const char *) sqlite3_column_text(statement, 1)]];
                
                
            }
            return resultArray;
           
        }
         sqlite3_reset(statement);
    }
    return nil;
}

-(NSMutableArray* ) getStateArray :(NSString*)country
{
    return nil;
}
-(NSMutableArray* ) getRegionArray :(NSString*)country location:(NSString*) location
{
    return nil;
}
@end