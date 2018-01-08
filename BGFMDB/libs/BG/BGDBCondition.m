//
//  BGDBCondition.m
//  BGFMDB
//
//  Created by alpha yu on 05/01/2018.
//  Copyright © 2018 Biao. All rights reserved.
//

#import "BGDBCondition.h"

#import "BGFMDBConfig.h"

@implementation BGDBCondition

- (instancetype)init{
    if (self = [super init]) {
        self.sql = @"";
    }
    return self;
}

- (AppendString)where {
    return AppendString(string) {
        if (string.length > 0) {
            [self appendString:[NSString stringWithFormat:@" WHERE %@", bg_sqlKey(string)]];
        } else {
            [self appendString:@" WHERE "];
        }
        return self;
    };
}

- (AppendString)and {
    return AppendString(string) {
        if (string.length > 0) {
            [self appendString:[NSString stringWithFormat:@" AND %@", bg_sqlKey(string)]];
        } else {
            [self appendString:@" AND "];
        }
        return self;
    };
}

- (AppendString)or {
    return AppendString(string) {
        if (string.length > 0) {
            [self appendString:[NSString stringWithFormat:@" OR %@", bg_sqlKey(string)]];
        } else {
            [self appendString:@" OR "];
        }
        return self;
    };
}


- (AppendObject)equal {
    return AppendObject(object) {
        [self appendString:[NSString stringWithFormat:@" = %@", bg_sqlValue(object)]];
        return self;
    };
}

- (AppendObject)unequal {
    return AppendObject(object) {
        [self appendString:[NSString stringWithFormat:@" <> %@", bg_sqlValue(object)]];
        return self;
    };
}

- (AppendObject)lessThan {
    return AppendObject(object) {
        [self appendString:[NSString stringWithFormat:@" < %@", bg_sqlValue(object)]];
        return self;
    };
}

- (AppendObject)lessEqualThan {
    return AppendObject(object) {
        [self appendString:[NSString stringWithFormat:@" <= %@", bg_sqlValue(object)]];
        return self;
    };
}

- (AppendObject)moreThan {
    return AppendObject(object) {
        [self appendString:[NSString stringWithFormat:@" > %@", bg_sqlValue(object)]];
        return self;
    };
}

- (AppendObject)moreEqualThan {
    return AppendObject(object) {
        [self appendString:[NSString stringWithFormat:@" >= %@", bg_sqlValue(object)]];
        return self;
    };
}

- (AppendTwoInt)betweenAnd {
    return AppendTwoInt(number0, number1) {
        [self appendString:[NSString stringWithFormat:@" BETWEEN %@ AND %@ ", @(number0), @(number1)]];
        return self;
    };
}

#pragma mark - LIKE
- (AppendString)likePrefix {
    return AppendString(string) {
        [self appendString:[NSString stringWithFormat:@" LIKE '%@%%%%'", string]];
        return self;
    };
}

- (AppendString)likeSuffix {
    return AppendString(string) {
        [self appendString:[NSString stringWithFormat:@" LIKE '%%%%%@'", string]];
        return self;
    };
}

- (AppendString)likeContain {
    return AppendString(string) {
        [self appendString:[NSString stringWithFormat:@" LIKE '%%%%%@%%%%'", string]];
        return self;
    };
}

#pragma mark - GROUP BY
- (AppendString)groupBy {
    return AppendString(string){
        [self appendString:[NSString stringWithFormat:@" GROUP BY %@", bg_sqlKey(string)]];
        return self;
    };
}

- (AppendNoting)having {
    return AppendNoting() {
        [self appendString:@" HAVING "];
        return self;
    };
}

- (AppendString)max {
    return AppendString(string)  {
        [self appendString:[NSString stringWithFormat:@" MAX(%@) ", bg_sqlKey(string)]];
        return self;
    };
}

- (AppendString)min {
    return AppendString(string) {
        [self appendString:[NSString stringWithFormat:@" MIN(%@) ", bg_sqlKey(string)]];
        return self;
    };
}

- (AppendString)avg {
    return AppendString(string) {
        [self appendString:[NSString stringWithFormat:@" AVG(%@) ", bg_sqlKey(string)]];
        return self;
    };
}

- (AppendString)sum {
    return AppendString(string) {
        [self appendString:[NSString stringWithFormat:@" SUM(%@) ", bg_sqlKey(string)]];
        return self;
    };
}

- (AppendString)count {
    return AppendString(string) {
        if (!string) {
            [self appendString:@" COUNT(*) "];
        }else{
            [self appendString:[NSString stringWithFormat:@" COUNT(%@) ", bg_sqlKey(string)]];
        }
        return self;
    };
}

#pragma mark - ORDER
- (AppendString)orderByAec {
    return AppendString(string) {
        [self appendString:[NSString stringWithFormat:@" ORDER BY %@ AEC", bg_sqlKey(string)]];
        return self;
    };
}

- (AppendString)orderByDesc {
    return AppendString(string) {
        [self appendString:[NSString stringWithFormat:@" ORDER BY %@ DESC ", bg_sqlKey(string)]];
        return self;
    };
}

#pragma mark - other
- (AppendInt)limit {
    return AppendInt(number) {
        [self appendString:[NSString stringWithFormat:@" LIMIT %@ ", @(number)]];
        return self;
    };
}

- (AppendInt)offset {
    return AppendInt(number) {
        [self appendString:[NSString stringWithFormat:@" OFFSET %@ ", @(number)]];
        return self;
    };
}

- (AppendString)as {
    return AppendString(string) {
        [self appendString:[NSString stringWithFormat:@" AS %@ ", string]];
        return self;
    };
}


#pragma mark - sql 语句 拼接
- (void)appendString:(NSString *)string{
    self.sql = [self.sql stringByAppendingString:string];
}




@end
