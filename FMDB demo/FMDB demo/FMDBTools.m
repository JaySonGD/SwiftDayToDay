//
//  FMDBTools.m
//  FMDB
//
//  Created by czljcb on 16/3/9.
//  Copyright © 2016年 czljcb. All rights reserved.
//

#import "FMDBTools.h"
#import "FMDB/FMDB.h"

static FMDatabase *_db = nil;

#define fileName @"Status.db"
#define tableName "t_status"

@interface FMDBTools ()


@end

@implementation FMDBTools

+ (void)load{
    [FMDBTools openDB];
}

+ (BOOL)openDB
{
    
    if (_db) {
        return YES;
    }
    
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:fileName];
    
    FMDatabase *fm = [FMDatabase databaseWithPath:filePath];
    _db = fm;
    BOOL flag = [fm open];
    
    if (flag == YES) {
        NSLog(@"ok");
    }
    else
    {
        NSLog(@"no");
        return NO;
    }
    flag = [_db executeUpdate:[NSString stringWithFormat:@"create table if not exists %s (id integer primary key autoincrement,idStr text NOT NULL,data blob NOT NULL);",tableName]];
    
    
    if (flag == YES) {
        NSLog(@"创建表ok");
        return YES;
    }
    else
    {
        NSLog(@"创建表no");
        return NO;
    }
}

+ (BOOL)isExistWithID:(NSString *)idStr
{
    
    BOOL isExist = NO;
    FMResultSet *resultSet= [_db executeQuery:[NSString stringWithFormat:@"SELECT * FROM %s where idStr = ?",tableName],idStr];
    while ([resultSet next])
    {
        if([resultSet stringForColumn:@"idStr"]) {
            isExist = YES;
        }else{
            isExist = NO;
        }
    }
    return isExist;
}


+ (NSArray *)dataList {
    
    FMResultSet *set = [_db executeQuery:[NSString stringWithFormat:@"SELECT * FROM %s;",tableName]];
    NSMutableArray *list = [NSMutableArray array];
    
    while (set.next) {
        // 获得当前所指向的数据
        NSData *dictData = [set objectForColumnName:@"data"];
        NSDictionary *dict = [NSKeyedUnarchiver unarchiveObjectWithData:dictData];
        [list addObject:dict];
    }
    return list;
}

+ (NSArray *)quartyList {
    
    FMResultSet *set = [_db executeQuery:[NSString stringWithFormat:@"SELECT * FROM %s;",tableName]];
    NSMutableArray *list = [NSMutableArray array];
    
    NSInteger count = set.columnCount;
    
    while (set.next) {
        // 获得当前所指向的数据
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        
        for (NSInteger i = 0; i< count; i++)
        {
            NSString *key = set.columnNameToIndexMap.allKeys[i];
            id value  =  [set objectForColumnName:key];
            [dict setObject:value forKey:key];
            [list addObject:dict];
            
        }
    }
    return list;
}

/** 查找小于idStr 的10 条数据（降序）*/
+ (NSMutableArray *)getDataID:(NSString *)idStr dataCount:(NSInteger)count
{
    NSMutableArray *array = [NSMutableArray array];
    
    FMResultSet *s = [_db executeQuery:[NSString stringWithFormat:@"select * from %s where idStr < ? order by idStr desc limit ?",tableName],idStr, [NSNumber numberWithInteger:count]];
    while ([s next])
    {
        NSData * data = [s dataForColumn:@"data"];
        NSDictionary *dict = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        [array addObject:dict];

        
        
        NSString *name = [s stringForColumn:@"idStr"];
        int ID = [s intForColumn:@"id"];
        NSLog(@"%@---来自于数据库---%zd",name,ID);
    }
    return array;
}

/** （降序）查找范围为rang 条数据）*/
+ (NSArray *)dataWithRange:(NSRange)range {
    
    NSString *SQL = [NSString stringWithFormat:@"SELECT * FROM %s order by idStr desc  LIMIT %lu, %lu",tableName,range.location, range.length];
    FMResultSet *set = [_db executeQuery:SQL];
    NSMutableArray *list = [NSMutableArray array];
    
    while (set.next) {
        // 获得当前所指向的数据
        
        NSData *dictData = [set objectForColumnName:@"data"];
        NSDictionary *dict = [NSKeyedUnarchiver unarchiveObjectWithData:dictData];
        [list addObject:dict];
        
        NSString *name = [set stringForColumn:@"idStr"];
        int ID = [set intForColumn:@"id"];
        NSLog(@"%@---来自于数据库---%zd",name,ID);
    }
    return list;
}


+ (void)allKeys/*limit 10*/ //
{
    FMResultSet *s = [_db executeQuery:[NSString stringWithFormat:@"SELECT * FROM %s order by idStr desc",tableName]
];
    while ([s next]) {
        
        NSString *name = [s stringForColumn:@"idStr"];
        int ID = [s intForColumn:@"id"];
        NSLog(@"%@---来自于数据库---%zd",name,ID);
    }
}


+ (BOOL)insertID:(NSString *)idStr data:(NSData *)data
{
    
    return  [_db executeUpdate:[NSString stringWithFormat:@"insert into %s (idStr,data) values(?,?);",tableName],idStr,data];
}

+ (BOOL)insert:(NSString *)idStr data:(NSData *)data
{
    BOOL flag = false;
    
    [_db beginTransaction];
    CFTimeInterval begin =  CFAbsoluteTimeGetCurrent();
    for (NSInteger i = 0; i < 3; i++)
    {
        
      flag = [_db executeUpdate:[NSString stringWithFormat:@"insert into %s (idStr,data) values(?,?);",tableName],idStr,data];
        if (!flag) {
            [_db rollback];
        }
    }
    [_db commit];
    CFTimeInterval end =  CFAbsoluteTimeGetCurrent();
    NSLog(@"%f",end - begin);
    return flag;

}


@end
