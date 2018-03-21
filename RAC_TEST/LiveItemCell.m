//
//  LiveItemCell.m
//  LiveVideo
//
//  Created by 朱来飞 on 2018/3/7.
//  Copyright © 2018年 朱来飞. All rights reserved.
//

#import "LiveItemCell.h"
#import <ReactiveCocoa/NSObject+RACKVOWrapper.h>
#import <SDWebImage/UIImageView+WebCache.h>
//#import "UILabel+Async.h"
//#import "Model.h"
@interface LiveItemCell ()

@property (weak, nonatomic) IBOutlet UIImageView *liveImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *audienceCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;

@end
@implementation LiveItemCell


- (void)configCell:(ViewModel *)viewModel indexPath:(NSIndexPath *)indexPath {

    [[viewModel.nameCommand execute:indexPath] subscribeNext:^(NSString * x) {
        _nameLabel.text = x ;
    }];
    
    _audienceCountLabel.text = @"999";
    [_liveImageView sd_setImageWithURL:[NSURL URLWithString:[viewModel header:indexPath]] placeholderImage:nil];
}
//-(void)setLive:(Live *)live{
//
//    Createor * c = live.creator ;
//
//    _nameLabel.text = c.nick ;
//    _cityLabel.text = live.city ;
//
//    [_liveImageView sd_setImageWithURL:[NSURL URLWithString:c.portrait] placeholderImage:nil];
//    [_audienceCountLabel setTextAsyncURL:live.ID placeholderText:@"placeholder"];
//}

@end
