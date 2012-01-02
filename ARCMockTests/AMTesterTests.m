//
//  AMTesterTests.m
//  ARCMock
//
//  Created by Adam Stegman on 1/2/12.
//  Copyright (c) 2012 Cerner Corporation. All rights reserved.
//

#import "AMTesterTests.h"
#import <OCMock/OCMock.h>
#import "AMTester.h"
#import "AMDelegateProtocol.h"

@implementation AMTesterTests

- (void)testSomeOtherMethod {
  AMTester *tester = [[AMTester alloc] init];
  id delegate = [OCMockObject mockForProtocol:@protocol(AMDelegateProtocol)];
  tester.delegate = delegate;
  STAssertNotNil(tester.delegate, @"should have assigned delegate");
}

@end
