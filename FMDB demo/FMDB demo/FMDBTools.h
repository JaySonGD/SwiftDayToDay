

#import <UIKit/UIKit.h>

@interface FMDBTools : NSObject

// 倒序  range 范围 的 数据
+ (NSArray *)dataWithRange:(NSRange)range ;

// 倒序  count 个小于 idStr 的数据
+ (NSArray *)getDataID:(NSString *)idStr dataCount:(NSInteger)count;

// 倒序 data 键 的所有数据
+ (NSArray *)dataList;

// 是否包含idStr的数据
+ (BOOL)isExistWithID:(NSString *)idStr;

// 倒序打印所有的id键 和 idStr 键
+ (void)allKeys;/*limit 10*/

// 插入一条数据 编号为idStr 数据为data
+ (BOOL)insertID:(NSString *)idStr data:(NSData *)data;


+ (BOOL)insert:(NSString *)idStr data:(NSData *)data;

@end
