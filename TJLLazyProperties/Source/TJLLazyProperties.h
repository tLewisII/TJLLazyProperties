//
//  TJLLazyProperties.h
//  TJLLazyProperties
//
//  Created by Terry Lewis II on 12/24/13.
//  Copyright (c) 2013 Terry Lewis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TJLLazyProperties : NSObject
@property(strong, nonatomic) NSString *name;
@property(strong, nonatomic) NSMutableData *mutableData;
@property(strong, nonatomic) NSArray *array;
@property(strong, nonatomic) NSMutableDictionary *dictionary;
@end
