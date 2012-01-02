//
//  AMTester.m
//  ARCMock
//
//  Created by Adam Stegman on 1/2/12.
//  Copyright (c) 2012 Cerner Corporation. All rights reserved.
//

#import "AMTester.h"

@implementation AMTester
@synthesize delegate = _delegate;

- (void)someOtherMethod {
  [_delegate someMethod];
}
@end
