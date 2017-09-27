//
//  RegisterCustomerButton.m
//  app
//
//  Created by 余钦 on 2017/9/6.
//
//

#import "RegisterCustomerButton.h"

@implementation RegisterCustomerButton

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    CGRect bounds = CGRectMake(self.bounds.size.width/2, 0, self.bounds.size.width/2, self.bounds.size.height);
    if (CGRectContainsPoint(bounds, point)) {
        return YES;
    }
    return NO;
}
@end
