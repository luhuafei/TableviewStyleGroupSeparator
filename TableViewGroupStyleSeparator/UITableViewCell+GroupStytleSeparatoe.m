//
//  UITableViewCell+GroupStytleSeparatoe.m
//  TableViewGroupStyleSeparator
//
//  Created by DengTianran on 2017/4/12.
//  Copyright © 2017年 DengTianran. All rights reserved.
//

#import "UITableViewCell+GroupStytleSeparatoe.h"
#import <objc/runtime.h>

static void *separatorLineKey = @"separatorLineKey";
@implementation UITableViewCell (GroupStytleSeparatoe)
+ (void)load
{
    Method otherMehtod = class_getInstanceMethod([self class], @selector(hf_layoutSubviews));
    Method originMehtod = class_getInstanceMethod([self class], @selector(layoutSubviews));
    // 交换2个方法的实现
    method_exchangeImplementations(otherMehtod, originMehtod);
}


- (void)setShouldRemoveFirstAndLastSeparatorLine:(BOOL)shouldRemoveFirstAndLastSeparatorLine
{
    objc_setAssociatedObject(self, separatorLineKey, @(shouldRemoveFirstAndLastSeparatorLine), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)shouldRemoveFirstAndLastSeparatorLine
{
    return [objc_getAssociatedObject(self, separatorLineKey) boolValue];
}

- (void)hf_layoutSubviews
{
    [self hf_layoutSubviews];
    //不隐藏
    if(!self.shouldRemoveFirstAndLastSeparatorLine) return;
    //隐藏
    for (UIView *subView in self.subviews) {
        if (subView != self.contentView) {
            if (subView.frame.origin.x == 0 && subView.frame.origin.y != -0.5){
                subView.hidden = YES;
            }

        }
    }
}
@end
