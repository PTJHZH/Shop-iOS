//
//  Area.m
//  ETShop-for-iOS
//
//  Created by EleTeam(Tony Wong) on 15/07/27.
//  Copyright © 2015年 EleTeam. All rights reserved.
//
//  @email 908601756@qq.com
//
//  @license The MIT License (MIT)
//

#import "Area.h"

@implementation Area

//获得系统默认的区域信息
+ (void)getPrefixChainedAreas:(void(^)(BOOL status, NSNumber *code, NSString *message, Area *area, NSArray *chainedAreas))success
                         failure:(void(^)(NSError *error))failure
{
    NSString *url = kUrlAreaPrefixChainedAreas;
    [HttpClient requestJson:url
                     params:nil
                    success:^(BOOL status, NSNumber *code, NSString *message, NSDictionary *data) {
                        Area *area = nil;
                        NSMutableArray *chainedAreas = [NSMutableArray new];
                        if (status) {
                            area = [Area mj_objectWithKeyValues:[data objectForKey:@"area"]];
                            
//                            NSDictionary *areaDict = [data objectForKey:@"prefixArea"];
//                            NSArray *chainedAreaDicts = [data objectForKey:@"areaChainedList"];
//                            area = [[AreaEntity alloc] initWithDictionary:areaDict];
//                            for (NSDictionary *itemdicts in chainedAreaDicts) {
//                                NSDictionary *chainedAreaDict = [itemdicts objectForKey:@"area"];
//                                NSArray *childrenDicts = [itemdicts objectForKey:@"children"];
//                                Area *chainedArea = [[AreaEntity alloc] initWithDictionary:chainedAreaDict];
//                                NSMutableDictionary *areaItems = [NSMutableDictionary new];
//                                
//                                NSMutableArray *children = [NSMutableArray new];
//                                for (NSDictionary *childDict in childrenDicts) {
//                                    Area *child = [[AreaEntity alloc] initWithDictionary:childDict];
//                                    [children addObject:child];
//                                }
//                                [areaItems setObject:chainedArea forKey:@"area"];
//                                [areaItems setObject:children forKey:@"children"];
//                                
//                                [chainedAreas addObject:areaItems];
//                            }
                        }
                        success(status, code, message, area, chainedAreas);
                    }
                    failure:failure];
}

@end
