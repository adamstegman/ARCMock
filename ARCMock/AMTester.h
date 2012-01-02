//
//  AMTester.h
//  ARCMock
//
//  Created by Adam Stegman on 1/2/12.
//  Copyright (c) 2012 Cerner Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMDelegateProtocol.h"

@interface AMTester : NSObject
@property (nonatomic, weak) id<AMDelegateProtocol> delegate;
@end
