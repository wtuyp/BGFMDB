//
//  BGDBCondition.h
//  BGFMDB
//
//  Created by alpha yu on 05/01/2018.
//  Copyright © 2018 Biao. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BGDBCondition;
typedef BGDBCondition *(^AppendString)(NSString *string);
#define AppendString(string) ^BGDBCondition *(NSString *string)

typedef BGDBCondition *(^AppendObject)(id object);
#define AppendObject(object) ^BGDBCondition *(id object)

typedef BGDBCondition *(^AppendInt)(NSInteger number);
#define AppendInt(number) ^BGDBCondition *(NSInteger number)

typedef BGDBCondition *(^AppendTwoInt)(NSInteger number0, NSInteger number1);
#define AppendTwoInt(number0, number1) ^BGDBCondition *(NSInteger number0, NSInteger number1)

typedef BGDBCondition *(^AppendNoting)(void);
#define AppendNoting() ^BGDBCondition *(void)



@interface BGDBCondition : NSString

@property(nonatomic, copy) NSString *sql;
//WHERE ... (AND / OR ...) GROUP BY ... (HAVING SUM(...)) ORDER BY ... LIMIT ... OFFSET ...



- (AppendString)where;
//并
- (AppendString)and;
//或
- (AppendString)or;


//=
- (AppendObject)equal;
//<>
- (AppendObject)unequal;
//<
- (AppendObject)lessThan;
//<=
- (AppendObject)lessEqualThan;
//>
- (AppendObject)moreThan;
//>=
- (AppendObject)moreEqualThan;
//between ... and ...
- (AppendTwoInt)betweenAnd;
//LIKE %x
- (AppendString)likePrefix;
//LIKE x%
- (AppendString)likeSuffix;
//LIKE x%x
- (AppendString)likeContain;


//分组
- (AppendString)groupBy;
//HAVING
- (AppendNoting)having;
//最大
- (AppendString)max;
//最小
- (AppendString)min;
//平均
- (AppendString)avg;
//总和
- (AppendString)sum;
//数量
- (AppendString)count;

//排序
- (AppendString)orderByAsc;
- (AppendString)orderByDesc;

- (AppendInt)limit;
- (AppendInt)offset;
- (AppendString)as;

@end
