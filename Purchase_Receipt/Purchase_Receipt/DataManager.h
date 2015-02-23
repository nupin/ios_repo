//
//  DataManager.h
//  Purchase Receipt
//
//  Created by Nupin Pillai on 20/01/15.
//  Copyright (c) 2015 Nupin Pillai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject

@property (nonatomic,strong) NSMutableArray* orderlinesList;

+ (id)sharedManager;
-(void) getPurchaseOrderLines :(NSString*) purchaseNumber;
-(void) loadOrderlinesList : (NSArray*) orderLines;
-(NSMutableArray*)getOrderLines;
-(void)submitPRRequest : (NSMutableArray*) orderArray;
@end
