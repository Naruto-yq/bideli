//
//  MapPointModel.h
//  bideli
//
//  Created by Yanglijuan on 2017/9/6.
//  Copyright © 2017年   reserved.
//

#import <Foundation/Foundation.h>

@interface MapPointModel : NSObject

/**
 经度
 */
@property (nonatomic, assign) double lng;
/**
 纬度
 */
@property (nonatomic, assign) double lat;
/**
 商家名称
 */
@property (nonatomic, copy) NSString *name;
/**
 商家头像
 */
@property (nonatomic, copy) NSString *imageUrl;


@end
