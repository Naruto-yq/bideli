//
//  NSMutableDictionary+MutableSafeCollections.h
//  app
//
//  Created by 余钦 on 16/8/24.
//
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (MutableSafeCollections)
- (void) safeSetObject:(id) object forKey:(id) key;
@end
