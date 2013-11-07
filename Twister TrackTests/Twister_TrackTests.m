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
- (void) testReturn {
    int i = 0;
    for (i = 0; i <= 100; i++) {
        int point = i;
        NSString *string = [self returnStringBasedOnPoint:point];
        if ([string isEqualToString:@"First"] && (point >= 0 && point <=24)) {
            return;
        }
        else if([string isEqualToString:@"Second"] && (point >= 25 && point <= 49)){
            return;
        }
        else if ([string isEqualToString:@"Third"] && (point >= 50 && point <= 74)){
            return;
        }
        else if ([string isEqualToString:@"Fourth"] && (point >=75 && point <= 100)){
            return;
        }
        else {
            XCTFail(@"The returned String %@ is not within the correct quadrant for a point with value %u", string, point);
        }
    }
    
}
- (NSString *)returnStringBasedOnPoint:(int)point{
    if (point < 25) {
        return @"First";
    }
    else if (point < 50){
        return @"Second";
    }
    else if (point < 75){
        return @"Third";
    }
    else if (point < 101){
        return @"Fourth";
    }
    else{
        XCTFail(@"Outside the acceptable range");
        return nil;
    }
}
@end
