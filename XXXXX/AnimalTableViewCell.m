//
//  AnimalTableViewCell.m
//  XXXXX
//
//  Created by Вова on 19.03.2019.
//  Copyright © 2019 Вова. All rights reserved.
//

#import "AnimalTableViewCell.h"
#import "ViewController.h"

@interface AnimalTableViewCell ()

@property (nonatomic, strong) NSLayoutConstraint *topCoverImageConstrait;

@end

@implementation AnimalTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        UITapGestureRecognizer *tapRecog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapCoverImage)];
        _coverImageView = [UIImageView new];
        _coverImageView.backgroundColor = [UIColor clearColor];
        _coverImageView.translatesAutoresizingMaskIntoConstraints = NO;
        _coverImageView.userInteractionEnabled = YES;
        [_coverImageView addGestureRecognizer:tapRecog];
        [self.contentView addSubview: _coverImageView];
        
        _titleLabel = [UILabel new];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_titleLabel];
        
        _subtitleLabel = [UILabel new];
        _subtitleLabel.backgroundColor = [UIColor clearColor];
        _subtitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_subtitleLabel];
        
        [self makeConstrait];
        
    }
    
    return self;
}

//- (void) prepareForReuse {
//    //self.subtitleLabel.text = nil;
//}
//
//-(void) layoutSubviews {
//    [super layoutSubviews];
//
//
//
//    if (CGRectGetHeight(self.bounds) == 80) {
//
//        self.coverImageView.frame = CGRectMake(0.f, 0.f, CGRectGetHeight(self.bounds), CGRectGetHeight(self.bounds));
//
//        self.titleLabel.frame = CGRectMake(CGRectGetMaxX(self.coverImageView.frame), 0.f, CGRectGetMaxX(self.frame) - CGRectGetHeight(self.bounds), CGRectGetMaxX(self.coverImageView.frame) / 2);
//
//        self.subtitleLabel.frame = CGRectMake(CGRectGetMaxX(self.coverImageView.frame), CGRectGetMaxY(self.titleLabel.frame), CGRectGetMaxX(self.frame) - CGRectGetHeight(self.bounds), CGRectGetMaxX(self.coverImageView.frame) / 2);
//    } else if (CGRectGetHeight(self.bounds) == 40) {
//        self.coverImageView.frame = CGRectMake(CGRectGetWidth(self.bounds) - CGRectGetHeight(self.bounds), 0.f, CGRectGetHeight(self.bounds), CGRectGetHeight(self.bounds));
//
//        self.titleLabel.frame = CGRectMake(0.f, 0.f,CGRectGetWidth(self.bounds) - CGRectGetHeight(self.bounds), CGRectGetHeight(self.bounds) / 2);
//
//        self.subtitleLabel.frame = CGRectMake(0.f, CGRectGetMaxY(self.titleLabel.frame),CGRectGetWidth(self.bounds) - CGRectGetHeight(self.bounds), CGRectGetHeight(self.bounds) / 2);
//    }
//
//
//}

-(void) makeConstrait {
    
    NSLayoutConstraint *bottomoConstrait =
                                [_subtitleLabel.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-16.f];
    bottomoConstrait.priority = UILayoutPriorityDefaultHigh;
    
    self.topCoverImageConstrait = [_coverImageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:16.f];
    
    [NSLayoutConstraint activateConstraints:@[
        [_coverImageView.leftAnchor constraintEqualToAnchor:self.contentView.leftAnchor constant:16.f],
        self.topCoverImageConstrait,
        [_coverImageView.widthAnchor constraintEqualToConstant:40.f],
        [_coverImageView.heightAnchor constraintEqualToConstant:40.f],
        
        [_titleLabel.leftAnchor constraintEqualToAnchor:_coverImageView.rightAnchor constant: 16.f],
        [_titleLabel.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant: 16.f],
        [_titleLabel.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant: - 16.f],
        [_titleLabel.heightAnchor constraintEqualToConstant: 16.f],
                                              
        [_subtitleLabel.leftAnchor constraintEqualToAnchor:_coverImageView.rightAnchor constant: 16.f],
        [_subtitleLabel.topAnchor constraintEqualToAnchor:_titleLabel.bottomAnchor constant: 16.f],
        [_subtitleLabel.rightAnchor constraintEqualToAnchor:self.contentView.rightAnchor constant: - 16.f],
        /*[_subtitleLabel.heightAnchor constraintEqualToConstant: 16.f],*/
        bottomoConstrait,
     ]];
}

-(void) didTapCoverImage {
   // self.topCoverImageConstrait.constant  += 32.f;
    [self.contentView removeConstraint:self.topCoverImageConstrait];
    NSLayoutConstraint *alignCenterYConstrait =
                                        [self.coverImageView.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor];
    [self.contentView addConstraint:alignCenterYConstrait];
    [UIView animateWithDuration:0.5 animations:^{
        [self layoutIfNeeded];
    }];
}

@end
