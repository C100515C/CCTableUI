//
//  BaseModel.h
//  RiceFlow
//
//  Created by CC on 16/12/1.
//  Copyright © 2016年 白浩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^SuccessBlock)(id response);
typedef void (^FailBlock)(id error);

@interface CCBaseModel : NSObject

/**
 请求方式
 */
@property (nonatomic,copy) NSString *reqStype;

/**
 请求 地址
 */
@property (nonatomic,copy) NSString *url;


/**
 请求返回 类 名称
 */
@property (nonatomic,copy) NSString *responseClass;


/**
 返回 码
 */
@property (nonatomic,copy) NSString *rescode;

/**
 返回 直接  result 为字符串
 */
@property (nonatomic,copy) NSString *loginResult;


/**
 响应消息 提示字
 */
@property (nonatomic,copy) NSString *rMessage;

/**
 列表 数据 总页数
 */
@property (nonatomic,copy) NSString *pages;

/**
 列表 cell  高
 */
@property (nonatomic,assign) CGFloat cell_Height;


/**
 将字典或数组映射 为 model

 @param response 映射 数据
 @return 结果 model
 */
-(CCBaseModel*)setPropertyAndValueWith:(id)response;


/**
 获得 model 属性 字典

 @param model 模型
 @return 结果 字典
 */
-(NSDictionary*)getParamArrWith:(id)model;

/**
 获得 属性名字 数组

 @param model model description
 @return 属性数组
 */
-(NSArray*)getPropertyWith:(id)model;


/**
 获取 短时间

 @param time 返回长时间 yyyy-MM-dd hh:mm:ss
 @param type 返回短时间格式  默认 yyyy-MM-dd
 @return return value description  yyyy-MM-dd
 */
-(NSString *)getShortTime:(NSString*)time andShortTimeType:(NSString*)type;


/**
 获得 新时间

 @param newType 新时间格式
 @param oldType 时间旧格式
 @param time 时间
 @return return value description
 */
-(NSString*)getTimeStrWith:(NSString*)newType andOldType:(NSString*)oldType andTime:(NSString*)time;


@end
