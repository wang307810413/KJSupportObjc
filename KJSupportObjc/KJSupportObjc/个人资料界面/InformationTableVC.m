
#import "InformationTableVC.h"
#import "CommonTableViewTool.h"


@implementation InformationCell

- (void)setupData:(CommonTableViewCellModel *)cellModel section:(NSInteger)section row:(NSInteger)row tableView:(UITableView *)tableView {
#warning 下面这行代码不要删除
    [super setupData:cellModel section:section row:row tableView:tableView];
    
    InformationCellModel *model = (InformationCellModel *)cellModel;
    // 在这里进行给子类Cell身上的一些控件赋值
}
@end

@implementation InformationCellModel
@end


@implementation InformationTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 如果不设置行高， 那么会自适应高度
    self.tableView.rowHeight = 50;
    
    NSMutableArray *cellModelArray = [NSMutableArray array];
    CommonSectionModel *sectionModel = [CommonSectionModel new];
    
    {   // 我的资料
        InformationCellModel *model = [InformationCellModel new];
        model.left_ImageString2 = @"icon_data";
        model.left_Title3 = @" 我的资料";
        model.right_arrowImageString9 = @"arrow_right_black";
        [cellModelArray addObject:model];
    }
    {   // 清除缓存
        InformationCellModel *model = [InformationCellModel new];
        model.left_Title3 = @"清除缓存";
        model.right_alikePrice7 = @"14 MB";
        model.right_arrowImageString9 = @"arrow_right_black";
        [cellModelArray addObject:model];
    }
    {   // 淘宝昵称
        InformationCellModel *model = [InformationCellModel new];
        model.left_Title3 = @"淘宝昵称";
        model.right_alikePrice7 = @"还是空的，快来取个有逼格的名字吧";
        [cellModelArray addObject:model];
    }
    {   // 芝麻信用
        InformationCellModel *model = [InformationCellModel new];
        model.left_Title3 = @"芝麻信用";
        model.left_subTitle4 = @"724";
        model.right_arrowImageString9 = @"arrow_right_black";
        [cellModelArray addObject:model];
    }
    {   // 消息推送
        InformationCellModel *model = [InformationCellModel new];
        model.left_ImageString2 = @"通知";
        model.left_Title3 = @" 消息推送";
        model.showSwitch = YES;
        model.swicthBlock = ^(BOOL switchOn) {
            //  可以在这里进行 处理事件
            NSLog(@"%@", switchOn ? @"开启推送" : @"关闭推送");
        };
        [cellModelArray addObject:model];
    }
    {   // 关于
        InformationCellModel *model = [InformationCellModel new];
        model.left_Title3 = @"关于";
        model.right_arrowImageString9 = @"arrow_right_black";
        [cellModelArray addObject:model];
    }
    {   // 账户管理
        InformationCellModel *model = [InformationCellModel new];
        model.left_Title3 = @"账户管理";
        model.right_imageViewString8 = @"icon_xin";
        model.right_arrowImageString9 = @"arrow_right_black";
        [cellModelArray addObject:model];
    }
    
    sectionModel.modelArray = cellModelArray;
    
    self.tableViewTool.dataArr = @[sectionModel];
    [self.tableView reloadData];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtSection:(NSInteger)section row:(NSInteger)row selectIndexPath:(NSIndexPath * _Nonnull)indexPath model:(CommonTableViewCellModel * _Nullable)cellModel tableViewTool:(CommonTableViewTool * _Nonnull)tool {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    InformationCellModel *model = (InformationCellModel *)cellModel;
    if (model.cellBlock) {
        model.cellBlock(model, section, row, indexPath);
    }
}

// 这个方法不要删除
- (NSDictionary<NSString *,NSDictionary<NSString *,id> *> *)returnCell_Model_keyValues {
    return @{NSStringFromClass([InformationCellModel class]) : @{cellKEY : NSStringFromClass([InformationCell class]), isRegisterNibKEY : @NO}};
}



@end

