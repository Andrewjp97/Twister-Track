//
//  Twister_TrackTests.m
//  Twister TrackTests
//
//  Created by Andrew Paterson on 11/6/13.
//  Copyright (c) 2013 Karl Paterson. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface Twister_TrackTests : XCTestCase
@property (strong, nonatomic)NSMutableArray *array;
@end

@implementation Twister_TrackTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _array = [[NSMutableArray alloc] initWithArray:@[@"Hi", @"Hello"]];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    if ([_array[0] isEqualToString:@"Hi"]) {
        return;
    }
    else if([_array[1] isEqualToString:@"Hello"]){
        return;
    }
    else {
        XCTFail(@"Array does not have HI or HELLO in it, instead it has %@ and %@", _array[0], _array[1]);
    }
}

@end
