//
//  TJLLazyPropertiesTests.m
//  TJLLazyPropertiesTests
//
//  Created by Terry Lewis II on 12/24/13.
//  Copyright (c) 2013 Terry Lewis. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TJLLazyProperties.h"
@interface TJLLazyPropertiesTests : XCTestCase {
    TJLLazyProperties *_lazyProperties;
}

@end

@implementation TJLLazyPropertiesTests

- (void)setUp
{
    [super setUp];
    _lazyProperties = [TJLLazyProperties new];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_nonNil_properties {
    XCTAssertNotNil(_lazyProperties.name, @"name should not be nil");
    XCTAssertNotNil(_lazyProperties.array, @"array should not be nil");
    XCTAssertNotNil(_lazyProperties.mutableData, @"mutableData should not be nil");
    XCTAssertNotNil(_lazyProperties.dictionary, @"dictionary should not be nil");
}

- (void)test_setterThenGetter {
    _lazyProperties.name = @"bob";
    _lazyProperties.array = @[@1];
    _lazyProperties.mutableData = [[NSMutableData alloc]initWithBytes:"abc" length:3];
    _lazyProperties.dictionary = @{@"Key" : @"terry"}.mutableCopy;
    
    XCTAssertTrue([_lazyProperties.name isEqualToString:@"bob"], @"name should be bob");
    XCTAssertTrue([_lazyProperties.array isEqualToArray:@[@1]], @"array should be @[@1]");
    XCTAssertTrue([_lazyProperties.mutableData isEqualToData:[[NSMutableData alloc]initWithBytes:"abc" length:3]], @"mutableData should be \"abc\"");
    XCTAssertTrue([_lazyProperties.dictionary isEqualToDictionary:@{@"Key" : @"terry"}], @"dictionary should be Key : \"terry\"");


}
@end
