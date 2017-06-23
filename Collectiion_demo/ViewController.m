 //
//  ViewController.m
//  Collectiion_demo
//
//  Created by 田耀琦 on 2017/6/23.
//  Copyright © 2017年 田耀琦. All rights reserved.
//

#import "ViewController.h"

#import "CollectionViewCell.h"
#import "CollectionReusableFooter.h"
#import "CollectionReusableHeader.h"

#define App_Width [UIScreen mainScreen].bounds.size.width
#define App_Height [UIScreen mainScreen].bounds.size.height

/*
 *   注意事项： 1. layout 控制item的大小 间距 ，头部视图子控件的展示位置
 *            2.  section 头部视图和底部视图 自定义创建 （参CollectionReusableFooter.h CollectionReusableHeader.h）

 *   3. collection 的整体头部和底部 无直接方法创建。 可根据section判断只添加section = 0 和 section = 最后的一个section 时 分别添加头部和底部，中间section 不添加
 *   4. 头部和底部自定的过程中都继承于 UICollectionReusableView （其他疑问具体参照一下代码）
**/

@interface ViewController () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)UICollectionView *collect;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatUI];
    
}

#pragma mark - UI 
- (void)creatUI {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    layout.itemSize = CGSizeMake((App_Width - 40.5) / 3.0, (App_Width - 40) / 4.0);
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 10;
    layout.headerReferenceSize = CGSizeMake((App_Width - 40.0) / 3.0, 10);
    layout.headerReferenceSize = CGSizeMake(App_Width - 20, 40);
    
    self.collect = [[UICollectionView alloc] initWithFrame:CGRectMake(10, 10, App_Width - 20, App_Height - 10) collectionViewLayout:layout];
    self.collect.backgroundColor = [UIColor whiteColor];
    self.collect.delegate = self;
    self.collect.dataSource = self;
    [self.view addSubview:self.collect];
    
    [self.collect registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"CollectionViewCell"];
    [self.collect registerClass:[CollectionReusableHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CollectionReusableHeader"];
    [self.collect registerClass:[CollectionReusableFooter class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"CollectionReusableFooter"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 4;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 10;
}

//   cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = (CollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor lightGrayColor];
    cell.textLabel.text = [NSString stringWithFormat:@"(%zd,%zd)", indexPath.section, indexPath.row];
    return cell;
}

//  设置头底部视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader) {
        CollectionReusableHeader *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CollectionReusableHeader" forIndexPath:indexPath];
        [header setTitle];
        return header;
    }
    else {
        CollectionReusableFooter *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"CollectionReusableFooter" forIndexPath:indexPath];
        [footer setFooter];
        return footer;
    }
    return nil;
}

//   头部视图大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(App_Width - 20, 40);
}

//  底部视图大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    if (section == 9) {
        return CGSizeMake(App_Width - 20, 40);
    }
    return CGSizeZero;
}


@end
