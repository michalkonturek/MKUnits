//
//  MKMacros.h
//  MKUnitConverter
//
//  Created by Michal Konturek on 25/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#define METHOD_NOT_IMPLEMENTED METHOD(@"%@: NOT IMPLEMENTED.")

#define METHOD_MUST_BE_OVERRIDDEN METHOD(@"You must override %@ in subclass.")

#define METHOD_USE_DESIGNATED_INIT  METHOD(@"%@: Use designated initializer.")

#define METHOD(MSG) @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:[NSString stringWithFormat:MSG, NSStringFromSelector(_cmd)] userInfo:nil];

