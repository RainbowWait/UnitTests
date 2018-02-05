//
//  Test.m
//  TestUnit
//
//  Created by 郑小燕 on 2018/2/2.
//  Copyright © 2018年 郑小燕. All rights reserved.
//

#import "HHardHard.h"

@implementation HHardHard
-(int)charNumber:(NSString*)strtemp {
    
    int strlength = 0;
    char* p = (char*)[strtemp cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i=0 ; i<[strtemp lengthOfBytesUsingEncoding:NSUnicodeStringEncoding] ;i++) {
        if (*p) {
            p++;
            strlength++;
        }
        else {
            p++;
        }
    }
    return strlength;
}
@end
