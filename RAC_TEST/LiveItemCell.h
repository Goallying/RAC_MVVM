//
//  LiveItemCell.h
//  LiveVideo
//
//  Created by 朱来飞 on 2018/3/7.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewModel.h"
@interface LiveItemCell : UICollectionViewCell

- (void)configCell:(ViewModel *)viewModel indexPath:(NSIndexPath *)indexPath ;
@end
