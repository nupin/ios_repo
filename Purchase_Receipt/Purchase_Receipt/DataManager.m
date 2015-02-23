//
//  DataManager.m
//  Purchase Receipt
//
//  Created by Nupin Pillai on 20/01/15.
//  Copyright (c) 2015 Nupin Pillai. All rights reserved.
//

#import "DataManager.h"
#import "SBJson.h"
#import "ASIHTTPRequest.h"


#define kStdConnectorEndpoint @"http://54.191.175.220:3737/com.leanswift.connector_2.1.0/"

@implementation DataManager
SBJsonParser *parser;
SBJsonWriter *writer;


+ (id)sharedManager
{
    static DataManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}
- (id)init {
    if (self = [super init]) {
        parser = [[SBJsonParser alloc] init];
        writer = [[SBJsonWriter alloc]init];
        self.orderlinesList = [[NSMutableArray alloc] init];
        
        
        [[NSUserDefaults standardUserDefaults] setObject:@"330" forKey:@"COMPANY"]; // plist
        
    }
    return self;
}

-(void) getPurchaseOrderLines :(NSString*) purchaseNumber
{
    
    __block NSDictionary *responseDictionary;
    
    NSString *jsonString = [writer stringWithObject:@{@"CONO":[[NSUserDefaults standardUserDefaults] objectForKey:@"COMPANY"] ,@"PUNO":purchaseNumber}];
    
    
    NSLog(@"jsonString : %@",jsonString);
    
    NSMutableData *requestBody;
    ASIHTTPRequest *request;
    
    requestBody  = [[NSMutableData alloc] initWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
    request  = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/apiTxn/PPS200MI/LstLine",kStdConnectorEndpoint]]];
    
    
    
    [request setRequestMethod:@"POST"];
    //  [request addRequestHeader:@"auth_token" value:authToken];
    [request addRequestHeader:@"Content-Type" value:@"application/json; encoding=utf-8"];
    [request setPostBody:requestBody];
    [request setCompletionBlock:^{
        NSLog(@"%@",[request responseString]);
        //responseDictionary = [parser objectWithString:[request responseString]];
        
        NSArray* response =[parser objectWithString:[request responseString]];
        
        if ([response count]){
            [self loadOrderlinesList:response];
        }
        else{
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:[NSString stringWithFormat:@"Problem with Server %@",[responseDictionary objectForKey:@"error"] ] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"RequestFailedNotification" object:nil];
        }
        
    }];
    
    [request setFailedBlock:^{
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Request Failed" message:[NSString stringWithFormat:@"Please try again"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"RequestFailedNotification" object:nil];
        
        
        // [_progressHUD hide:YES];
        
    }];
    
    [request startAsynchronous];
    
    
    
}
-(void) loadOrderlinesList : (NSArray*) orderLines
{
    
    if ([self.orderlinesList count]) {
        [self.orderlinesList removeAllObjects];
    }
    self.orderlinesList = [NSMutableArray arrayWithArray:orderLines];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"PurchaseOrderSavedNotification" object:nil];
    
    
}
-(NSMutableArray*)getOrderLines
{
    //
    return self.orderlinesList;
}

-(void)submitPRRequest : (NSMutableArray*)orderArray
{
    __block NSDictionary *responseDictionary;
    
    for(NSDictionary* orderRow in orderArray)
    {
        NSString *jsonString = [writer stringWithObject:@{@"CONO":[[NSUserDefaults standardUserDefaults] objectForKey:@"COMPANY"] ,@"TRDT":[orderRow objectForKey:@"RCDT_ReceiptDate"],@"RESP":[orderRow objectForKey:@"SUNO_SupplierNumber"],@"PUNO":[orderRow objectForKey:@"PUNO_PurchaseOrderNumber"],@"PNLI":[orderRow objectForKey:@"PNLI_PurchaseOrderLine"],@"PNLS":[orderRow objectForKey:@"PNLS_PurchaseOrderLineSubnumber"],@"RVQA":[orderRow objectForKey:@"RVQA_ReceivedQuantity"],@"WHSL":[orderRow objectForKey:@"WHLO_Warehouse"],@"BANO":[orderRow objectForKey:@"MODL_DeliveryMethod"]}];
        
        NSLog(@"JSON_STRING : %@",jsonString);
        NSMutableData *requestBody;
        ASIHTTPRequest *request;
        
        requestBody  = [[NSMutableData alloc] initWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
        
        request  = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/apiTxn/PPS001MI/Receipt",kStdConnectorEndpoint]]];
        
        [request setRequestMethod:@"POST"];
        //  [request addRequestHeader:@"auth_token" value:authToken];
        [request addRequestHeader:@"Content-Type" value:@"application/json; encoding=utf-8"];
        [request setPostBody:requestBody];
        [request setCompletionBlock:^{
            NSLog(@"%@",[request responseString]);
            //responseDictionary = [parser objectWithString:[request responseString]];
            
            
            
            NSArray* response =[parser objectWithString:[request responseString]];
            
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Response" message:[NSString stringWithFormat:@"Problem with Server %@",[[response objectAtIndex:0] objectForKey:@"errorMessage"] ] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"RequestFailedNotification" object:nil];
            
            
            
        }];
        
//        [request setFailedBlock:^{
//            
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Request Failed" message:[NSString stringWithFormat:@"Please try again"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
//            [alert show];
//            
//            [[NSNotificationCenter defaultCenter] postNotificationName:@"RequestFailedNotification" object:nil];
//            
//            
//            // [_progressHUD hide:YES];
//            
//        }];
        
        [request startAsynchronous];
    }
}
@end
