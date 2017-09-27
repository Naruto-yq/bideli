//
//  NSMutableDictionary+MutableSafeCollections.m
//  app
//
//  Created by 余钦 on 16/8/24.
//
//

#import "NSMutableDictionary+MutableSafeCollections.h"

@implementation NSMutableDictionary (MutableSafeCollections)
static inline id safeValue(id value)
{
    return value == nil ? [NSNull null] : value;
}

- (void) safeSetObject:(id) object forKey:(id) key
{
    [self setObject:safeValue(object) forKey:key];
}
@end
