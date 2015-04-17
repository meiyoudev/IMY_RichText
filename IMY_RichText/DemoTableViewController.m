//
//  DemoTableViewController.m
//  IMY_RichText
//
//  Created by dm on 15/4/14.
//  Copyright (c) 2015年 Meetyou. All rights reserved.
//

#import "DemoTableViewController.h"

@interface TableItem : NSObject
@property (nonatomic,strong)    NSString    *title;
@property (nonatomic,strong)    NSString    *subTitle;
@property (nonatomic,strong)    NSString    *vcName;
@end

@implementation TableItem
+ (TableItem *)itemWithTitle:(NSString *)title
                    subTitle:(NSString *)subTitle
                      vcName:(NSString *)vcName
{
    TableItem *instance = [[TableItem alloc]init];
    instance.title      = title;
    instance.subTitle   = subTitle;
    instance.vcName= vcName;
    return instance;
}
@end


@interface DemoTableViewController ()
@property (nonatomic,strong)    NSArray *items;
@end

@implementation DemoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"IMY_RichText";
    self.navigationController.view.backgroundColor = [UIColor whiteColor];
    
    _items = @[[TableItem itemWithTitle:@"解析表情，链接"
                               subTitle:nil
                                 vcName:@"RichTextViewController"],
               
               [TableItem itemWithTitle:@"表情键盘"
                               subTitle:nil
                                 vcName:@"EmoticonViewController"],
               
               [TableItem itemWithTitle:@"自定义输入框"
                               subTitle:nil
                                 vcName:@"CustomInputViewController"],
               ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"test_demo_cell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                     reuseIdentifier:@"test_demo_cell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    TableItem *item = [_items objectAtIndex:[indexPath row]];
    cell.textLabel.text = item.title;
    cell.detailTextLabel.text = item.subTitle;
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TableItem *item = [_items objectAtIndex:[indexPath row]];
    NSString *vcName= [item vcName];
    UIViewController *controller = [[NSClassFromString(vcName) alloc] init];
    controller.title = [item title];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
