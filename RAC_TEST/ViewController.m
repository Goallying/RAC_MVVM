//
//  ViewController.m
//  LiveVideo
//
//  Created by 朱来飞 on 2018/3/5.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import "ViewController.h"
#import "LiveItemCell.h"
#import "ViewModel.h"
#import "PlayViewController.h"
#import "PlayViewModel.h"

@interface ViewController ()<UICollectionViewDelegate ,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic ,strong)UICollectionView * collectionView ;
@property (nonatomic ,strong)ViewModel * mainViewModel ;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.collectionView];
    
    [self bindViewModel];
}
- (IBAction)refreshUI:(UIBarButtonItem *)sender {
    [self bindViewModel];
}
- (void)bindViewModel{
    
        [[self.mainViewModel.dataCommand execute:nil] subscribeNext:^(NSMutableArray * x) {
//            BOOL hidden = x.count == 0;
            
        [self.collectionView reloadData];
        } error:^(NSError *error) {
            NSLog(@"==== %@",error);
        }];
}



- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat w = (self.view.bounds.size.width - 30)/2 ;
    return CGSizeMake(w, w);
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.mainViewModel.lives.count ;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LiveItemCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    [cell configCell:self.mainViewModel indexPath:indexPath];
    return cell ;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString * url = [self.mainViewModel didSelectAtIndexPath:indexPath];
    
    PlayViewModel * playViewModel = [PlayViewModel new];
    playViewModel.urlString = url ;
    PlayViewController * playVC = [[PlayViewController alloc]initWithViewModel:playViewModel];
    [self.navigationController pushViewController:playVC animated:YES];
}


- (ViewModel *)mainViewModel{
    if(!_mainViewModel){
        _mainViewModel = [[ViewModel alloc]init];
    }
    return _mainViewModel ;
}
- (UICollectionView *)collectionView{
    
    if (!_collectionView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
        _collectionView.contentInset = UIEdgeInsetsMake(0, 10, 0, 10);
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self ;
        _collectionView.dataSource = self;
        [_collectionView registerNib:[UINib nibWithNibName:@"LiveItemCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    }
    return _collectionView;
}


@end

