//
//  TJLLazyPropertiesTests.m
//  TJLLazyPropertiesTests
//
//  Created by Terry Lewis II on 12/24/13.
//  Copyright (c) 2013 Terry Lewis. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TJLTestClass.h"
@interface TJLLazyPropertiesTests : XCTestCase {
   TJLTestClass *_testClass;
}

@end

@implementation TJLLazyPropertiesTests

- (void)setUp {
    [super setUp];
    _testClass = [TJLTestClass new];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_nonNil_properties {
    XCTAssertNotNil(_testClass.name, @"name should not be nil");
    XCTAssertNotNil(_testClass.array, @"array should not be nil");
    XCTAssertNotNil(_testClass.mutableData, @"mutableData should not be nil");
    XCTAssertNotNil(_testClass.dictionary, @"dictionary should not be nil");
    XCTAssertFalse(_testClass.boolValue, @"boolValue should be nil");
}

- (void)test_setterThenGetter {
    _testClass.name = @"bob";
    _testClass.array = @[@1];
    _testClass.mutableData = [[NSMutableData alloc]initWithBytes:"abc" length:3];
    _testClass.dictionary = @{@"Key" : @"terry"}.mutableCopy;
    
    XCTAssertTrue([_testClass.name isEqualToString:@"bob"], @"name should be bob");
    XCTAssertTrue([_testClass.array isEqualToArray:@[@1]], @"array should be @[@1]");
    XCTAssertTrue([_testClass.mutableData isEqualToData:[[NSMutableData alloc]initWithBytes:"abc" length:3]], @"mutableData should be \"abc\"");
    XCTAssertTrue([_testClass.dictionary isEqualToDictionary:@{@"Key" : @"terry"}], @"dictionary should be Key : \"terry\"");


}
@end
