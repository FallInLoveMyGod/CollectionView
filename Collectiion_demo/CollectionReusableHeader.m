//
//  CollectionReusableHeader.m
//  Collectiion_demo
//
//  Created by 田耀琦 on 2017/6/23.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "CollectionReusableHeader.h"

@implementation CollectionReusableHeader

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self creatUI];
    }
    return self;
}

- (void)creatUI {
    self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 20)];
    [self addSubview:self.titleLab];
}

- (void)setTitle {
    self.titleLab.text = @"hehe";
}

@end
