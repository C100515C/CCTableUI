//
//  BaseModel.m
//  RiceFlow
//
//  Created by CC on 16/12/1.
//  Copyright © 2016年 白浩. All rights reserved.
//

#import "CCBaseModel.h"
#import <objc/runtime.h>

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

@implementation CCBaseModel
@dynamic cell_Height;

-(CCBaseModel*)setPropertyAndValueWith:(id)response{
    
    Class nowClass = [response class];
    
    if (![nowClass isSubclassOfClass:[NSArray class]] && ![nowClass isSubclassOfClass:[NSDictionary class]]) {
        NSString *propertyName = [[self getItemsName] firstObject];
        [self setValue:response forKey:propertyName];
        return self;
    }
    
    if ([nowClass isSubclassOfClass:[NSArray class]]) {
        NSString *propertyName = [[self getItemsName] firstObject];
        if (propertyName!=nil) {
            if (![[self class] respondsToSelector:NSSelectorFromString([NSString stringWithFormat:@"%@_class", propertyName])]) {
                [self setValue:response forKey:propertyName];
                
            }else{
                NSMutableArray *tmp = [NSMutableArray array];
                [self setValue:tmp forKey:propertyName];
                
                for (id item in response) {
                    [self setArrValueWith:item andKey:propertyName];
                }
            }
            
        }
        
    }else{
        [self setValue:response];
    }
    
    
    return self;
}

-(NSArray*)getItemsName{
    unsigned int propertyCount = 0;
//    Class item;
    NSMutableArray *arr = [NSMutableArray array];
    objc_property_t *properties = class_copyPropertyList([self class], &propertyCount);
    
    for (int i=0; i<propertyCount; i++) {
        
        objc_property_t property = properties[i];
        
        const char *name = property_getName(property);
        const char * attributes = property_getAttributes(property);//获取属性类型
        
        NSString *propertyAtt = [NSString stringWithUTF8String:attributes];
        NSString *att = [[propertyAtt componentsSeparatedByString:@","] firstObject];
        NSString *type;
        NSString *propertyName = [NSString stringWithUTF8String:name];
        
       
         if (att) {
         if ([att isEqualToString:@"Ti"]||[att isEqualToString:@"TB"]||[att isEqualToString:@"Tq"]) {
         type = @"int";
         }else if ([att rangeOfString:@"T@"].location !=NSNotFound && ([att rangeOfString:@"NSString"].location !=NSNotFound )){
         type = @"string";
         }else if([att rangeOfString:@"NSArray"].location!=NSNotFound || [att rangeOfString:@"NSMutableArray"].location!=NSNotFound ){
         type = @"arr";
         }else if ([att rangeOfString:@"NSDictionary"].location!=NSNotFound){
         type = @"dic";
         }else{
         type = @"model";
         }
       
        }
        if([type isEqualToString:@"arr"]){
            
//            SuppressPerformSelectorLeakWarning(
//                                                      item = [[self class] performSelector:NSSelectorFromString([NSString stringWithFormat:@"%@_class", propertyName])];
            [arr addObject:propertyName];
//                                                      );
        }else if([type isEqualToString:@"string"]){
            [arr addObject:propertyName];
        }
        
    }
    return arr;
}

-(CCBaseModel*)setArrValueWith:(id)response andKey:(NSString*)propName{
    unsigned int propertyCount = 0;
    Class cla;
    SuppressPerformSelectorLeakWarning(
                                       cla = [[self class] performSelector:NSSelectorFromString([NSString stringWithFormat:@"%@_class", propName])];
                                       );
    
    objc_property_t *properties = class_copyPropertyList(cla, &propertyCount);
    
    CCBaseModel *mo = [cla new];
    for (int i=0; i<propertyCount; i++) {
        
        objc_property_t property = properties[i];
        
        const char *name = property_getName(property);
        
        NSString *propertyName = [NSString stringWithUTF8String:name];
        
        id value = [response valueForKey:propertyName];
        
        if ([propertyName isEqualToString:@"cc_id"]) {
            value = [response valueForKey:@"id"];
        }
        
        if (value==nil) {
            continue;
        }
        
        if ([value isKindOfClass:[NSArray class]]) {
            NSMutableArray *proArr = [NSMutableArray array];
            Class arrItem;
            if (![[mo class] respondsToSelector:NSSelectorFromString([NSString stringWithFormat:@"%@_class", propertyName])]) {
                [mo setValue:value forKey:propertyName];
                
            }else{
                SuppressPerformSelectorLeakWarning(
                                                   arrItem = [[mo class] performSelector:NSSelectorFromString([NSString stringWithFormat:@"%@_class", propertyName])];
                                                   );
                
                for (id item in value) {
                    CCBaseModel *model = [arrItem new];
                    [model setPropertyAndValueWith:item];
                    [proArr addObject:model];
                }
                
                [mo setValue:proArr forKey:propertyName];
            }
            
            
        }else if([value isKindOfClass:[NSDictionary class]]){
            Class dicItem;
            if (![[mo class] respondsToSelector:NSSelectorFromString([NSString stringWithFormat:@"%@_class", propertyName])]) {
                [mo setValue:value forKey:propertyName];
                
            }else{
                SuppressPerformSelectorLeakWarning(
                                                   dicItem = [[mo class] performSelector:NSSelectorFromString([NSString stringWithFormat:@"%@_class", propertyName])];
                                                   );
                CCBaseModel *model = [dicItem new];
                [model setPropertyAndValueWith:value];
                [mo setValue:model forKey:propertyName];
            }
            
            
        }else{
            
            [mo  setValue:[NSString stringWithFormat:@"%@",value] forKey:propertyName];
        }
        
        
    }
    free(properties);
    
    NSMutableArray *arr = [self valueForKey:propName];
    [arr addObject:mo];
    
    return self;
}

-(CCBaseModel*)setValue:(id)response{
    //    NSMutableArray *propertyNamesAndValues = [NSMutableArray array];
    
    unsigned int propertyCount = 0;
    
    objc_property_t *properties = class_copyPropertyList([self class], &propertyCount);
    
    for (int i=0; i<propertyCount; i++) {
        
        objc_property_t property = properties[i];
        
        const char *name = property_getName(property);
        //        const char * attributes = property_getAttributes(property);//获取属性类型
        
        //        NSString *propertyAtt = [NSString stringWithUTF8String:attributes];
        //        NSString *att = [[propertyAtt componentsSeparatedByString:@","] firstObject];
        //        NSString *type;
        NSString *propertyName = [NSString stringWithUTF8String:name];
//                NSLog(@"%@",propertyName);
        
        id value = [response valueForKey:propertyName];
        
        if ([propertyName isEqualToString:@"cc_id"]) {
            value = [response valueForKey:@"id"];
        }
        
        if (value==nil) {
            continue;
        }
        
        if ([value isKindOfClass:[NSArray class]]) {
            NSMutableArray *proArr = [NSMutableArray array];
            Class arrItem;
            
            if (![[self class] respondsToSelector:NSSelectorFromString([NSString stringWithFormat:@"%@_class", propertyName])]) {
                [self setValue:value forKey:propertyName];
                
            }else{
                SuppressPerformSelectorLeakWarning(
                                                   arrItem = [[self class] performSelector:NSSelectorFromString([NSString stringWithFormat:@"%@_class", propertyName])];
                                                   );
                
                for (id item in value) {
                    CCBaseModel *model = [arrItem new];
                    [model setPropertyAndValueWith:item];
                    [proArr addObject:model];
                }
                
                [self setValue:proArr forKey:propertyName];
            }
            
            
            
        }else if([value isKindOfClass:[NSDictionary class]]){
            Class dicItem;
            if (![[self class] respondsToSelector:NSSelectorFromString([NSString stringWithFormat:@"%@_class", propertyName])]) {
                [self setValue:value forKey:propertyName];

            }else{
                SuppressPerformSelectorLeakWarning(
                                                   dicItem = [[self class] performSelector:NSSelectorFromString([NSString stringWithFormat:@"%@_class", propertyName])];
                                                   );
                CCBaseModel *model = [dicItem new];
                [model setPropertyAndValueWith:value];
                [self setValue:model forKey:propertyName];
            }
            
            
        }else{
            
            [self  setValue:[NSString stringWithFormat:@"%@",value] forKey:propertyName];
        }
        /*
         if (att) {
         if ([att isEqualToString:@"Ti"]||[att isEqualToString:@"TB"]||[att isEqualToString:@"Tq"]) {
         type = @"int";
         }else if ([att rangeOfString:@"T@"].location !=NSNotFound && ([att rangeOfString:@"NSString"].location !=NSNotFound )){
         type = @"string";
         }else if([att rangeOfString:@"NSArray"].location!=NSNotFound  ){
         type = @"arr";
         }else if ([att rangeOfString:@"NSDictionary"].location!=NSNotFound){
         type = @"dic";
         }else{
         type = @"model";
         if (value==nil) {
         value = @"";
         }else{
         
         }
         }
         }
         if (value==nil) {
         value = @"";
         }*/
        // [[self class] performSelector:NSSelectorFromString([NSString stringWithFormat:@"%@_class", key])]
        //        NSDictionary *dic = @{propertyName:value,Type:type,Value:value};
        //        [propertyNamesAndValues addObject:dic];
        
    }
    free(properties);
    
    return self;
}

/**
 获得 model 属性 字典
 
 @param model 模型
 @return 结果 字典
 */
-(NSDictionary*)getParamArrWith:(id)model{
    
    Class nowclass = [model class];
    NSMutableDictionary *propertyNames = [NSMutableDictionary dictionary];
    unsigned int propertyCount = 0;
    objc_property_t *properties = class_copyPropertyList(nowclass, &propertyCount);
    
    for (unsigned int i = 0; i < propertyCount; ++i) {
        
        objc_property_t property = properties[i];
        const char * name = property_getName(property);
        NSString *key = [NSString stringWithUTF8String:name];
        
        if ([key isEqualToString:@"reqStype"] || [key isEqualToString:@"url"]||[key isEqualToString:@"responseClass"]||[key isEqualToString:@"rescode"]||[key isEqualToString:@"loginResult"]||[key isEqualToString:@"rMessage"]||[key isEqualToString:@"pages"]||[key isEqualToString:@"cc_id"]) {
            continue;
        }
        
        id value = [model valueForKey:key];
        if (value) {
            if ([key isEqualToString:@"c_newPwd"]) {
                key = @"newPwd";
            }
            if ([key isEqualToString:@"c_newHouseId"]) {
                key = @"newhouseId";
            }
            
            [propertyNames setObject:value forKey:key];
            
        }
        
        const char * attributes = property_getAttributes(property);//获取属性类型
        
        NSString *propertyAtt = [NSString stringWithUTF8String:attributes];
        NSString *att = [[propertyAtt componentsSeparatedByString:@","] firstObject];
        
        if ([att isEqualToString:@"Ti"]||[att isEqualToString:@"TB"]||[att isEqualToString:@"Tq"]) {
            if ([value intValue]==0) {
                [propertyNames removeObjectForKey:key];
            }
        }
    }
    
    free(properties);
    
    return propertyNames;
}

/**
 获得 属性名字 数组
 
 @param model model description
 @return
 */
-(NSArray*)getPropertyWith:(id)model{
    
    Class nowclass = [model class];
    NSMutableArray *propertyNames = [NSMutableArray array];
    unsigned int propertyCount = 0;
    objc_property_t *properties = class_copyPropertyList(nowclass, &propertyCount);
    
    for (unsigned int i = 0; i < propertyCount; ++i) {
        
        objc_property_t property = properties[i];
        const char * name = property_getName(property);
        NSString *key = [NSString stringWithUTF8String:name];
        
        if ([key isEqualToString:@"reqStype"] || [key isEqualToString:@"url"]||[key isEqualToString:@"responseClass"]||[key isEqualToString:@"rescode"]||[key isEqualToString:@"loginResult"]||[key isEqualToString:@"rMessage"]||[key isEqualToString:@"pages"]||[key isEqualToString:@"cc_id"]) {
            continue;
        }
        
        [propertyNames addObject:key];
    }
    
    free(properties);
    
    return propertyNames;
}


/**
 获取 短时间
 
 @param time 返回长时间 yyyy-MM-dd hh:mm:ss
 @param type 返回短时间格式  默认 yyyy-MM-dd
 @return return value description  yyyy-MM-dd
 */
-(NSString *)getShortTime:(NSString*)time andShortTimeType:(NSString*)type{
    if (!time) {
        return @"";
    }
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    
    [f setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *d = [f dateFromString:time];
    
    [f setDateFormat:type.length==0?@"yyyy-MM-dd":type];
    
    return [f stringFromDate:d];
}

/**
 获得 新时间
 
 @param newType 新时间格式
 @param oldType 时间旧格式
 @return return value description
 */
-(NSString*)getTimeStrWith:(NSString*)newType andOldType:(NSString*)oldType andTime:(NSString*)time{
    
    if (!time) {
        return @"";
    }
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    
    [f setDateFormat:oldType];
    NSDate *d = [f dateFromString:time];
    
    [f setDateFormat:newType.length==0?@"yyyy-MM-dd":newType];
    
    return [f stringFromDate:d];
}

@end
