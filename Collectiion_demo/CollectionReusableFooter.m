//
//  CollectionReusableFooter.m
//  Collectiion_demo
//
//  Created by 田耀琦 on 2017/6/23.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "CollectionReusableFooter.h"

@implementation CollectionReusableFooter


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self creatUI];
    }
    return self;
}

- (void)creatUI {
    self.footerLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 20)];
    [self addSubview:self.footerLab];
}

- (void)setFooter {
    self.footerLab.text = @"footer";
}


@end
