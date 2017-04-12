//
//  UITableViewCell+GroupStytleSeparatoe.h
//  TableViewGroupStyleSeparator
//
//  Created by DengTianran on 2017/4/12.
//  Copyright © 2017年 DengTianran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (GroupStytleSeparatoe)

/** 是否删除分区的第一行和最后一行的分割线*/
@property (assign, nonatomic)BOOL shouldRemoveFirstAndLastSeparatorLine;

@end
