//
//  ViewController.m
//  TableViewGroupStyleSeparator
//
//  Created by DengTianran on 2017/4/12.
//  Copyright © 2017年 DengTianran. All rights reserved.
//

#import "ViewController.h"
#import "UITableViewCell+GroupStytleSeparatoe.h"
@interface ViewController ()
@property (strong, nonatomic)NSMutableArray *dataArray;

@end

@implementation ViewController

- (NSMutableArray *)dataArray
{
    if (_dataArray == nil)
    {
        self.dataArray = [@[@[@"f", @"s", @"t"], @[@"f", @"f", @"s"]]mutableCopy];
    }
    return _dataArray;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


#pragma mark - UITableViewDataSource & UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray[section] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *indentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    
    //隐藏每一区的 首尾 分割线
    cell.shouldRemoveFirstAndLastSeparatorLine = YES;
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", self.dataArray[indexPath.section][indexPath.row]];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Heder";
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @"Footer";
}
@end
