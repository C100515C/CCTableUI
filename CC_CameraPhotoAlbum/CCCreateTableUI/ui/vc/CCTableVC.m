//
//  CCTableVC.m
//  CC_CameraPhotoAlbum
//
//  Created by CC on 2017/12/21.
//  Copyright © 2017年 cc. All rights reserved.
//

#import "CCTableVC.h"
#import "CCManager.h"

@interface CCTableVC ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTable;
@property (nonatomic,strong) CCManager *manager;

@end

@implementation CCTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTable];
    [self initNav];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initTable{
    self.myTable.delegate = self;
    self.myTable.dataSource = self;
}

-(void)initNav{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
}

-(void)back{
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

#pragma mark - get
-(CCManager*)manager{
    if (_manager==nil) {
        _manager = [[CCManager alloc] init];
    }
    return _manager;
}
#pragma mark - table
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.manager.modelManager.tableModel.tableGroupArr.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.manager.modelManager getRowsWith:section];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.manager.modelManager getCellHeightWith:indexPath];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   CCBaseTableCell *cell= [self.manager.viewManager createCellWith:[self.manager.modelManager getCellTypeWith:indexPath]andIdentifier:nil andTable:tableView];
    [self.manager setCellWith:indexPath andCell:cell];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return [self.manager.modelManager getGroupHeaderHeight:section];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return [self.manager.modelManager getGroupFooterHeight:section];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [self.manager setHeaderWith:section andTable:tableView];
}

-(UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [self.manager setFooterWith:section andTable:tableView];
}


@end
