//
//  ViewController.m
//  XXXXX
//
//  Created by Вова on 19.03.2019.
//  Copyright © 2019 Вова. All rights reserved.
//

#import "ViewController.h"
#import "AnimalTableViewCell.h"
#import "Animation-Swift.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray<NSString *> *animals;
//@property (nonatomic, strong) NSArray<UIImage *> *animalsImage;
@property (nonatomic, strong) NSArray<NSString *> *textAboutAnimals;
@property (nonatomic, strong) NSArray<NSString *> *subtextAboutAnimals;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    self.tableView = [[UITableView alloc] initWithFrame: self.view.bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    //self.tableView.rowHeight = UITableViewAutomaticDimension;

    self.animals = @[@"Корова", @"Собака", @"Кошка", @"Кролик", @"Лиса", @"Животное", @"Животное", @"Животное", @"Животное", @"Животное"];
    //self.animalsImage = @[];
    self.textAboutAnimals = @[@"Коро́ва — ......",
                              @"Соба́ка — ......",
                              @"Ко́шка — ......",
                              @"Кролик - ......",
                              @"Лиса - ......",
                              @"Животное - ......",
                              @"Животное - ......",
                              @"Животное - ......",
                              @"Животное - ......",@"Животное - ......"];
    self.subtextAboutAnimals = @[@"Какой то текст про коров",
                                 @"Какой-то текст про собак",
                                 @"Какой-то текст про кошек",
                                 @"Какой-то текст про кроликов",
                                 @"Какой-то текст про лис", @"XXXXX", @"XXXXX", @"XXXXX", @"XXXXX", @"XXXXX"];

    [self.tableView registerClass: [AnimalTableViewCell class] forCellReuseIdentifier:@"AnimalTableViewCell"];
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.animals.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AnimalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AnimalTableViewCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[AnimalTableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: @"AnimalTableViewCell"];
    }

    NSString *title = self.animals[indexPath.row];
    cell.titleLabel.text = title;
    cell.titleLabel.textAlignment = NSTextAlignmentCenter;

    NSString *subtitle = self.subtextAboutAnimals[indexPath.row];
    cell.subtitleLabel.text = subtitle;
    cell.subtitleLabel.textAlignment = NSTextAlignmentCenter;

    //cell.coverImageView.image = [UIImage imageNamed:[self.animalsImage objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    BirdsViewController *birdsVC = [BirdsViewController new];
//    [self.navigationController pushViewController:birdsVC animated:YES];
    [tableView reloadData];
    
    NSArray<__kindof UITableViewCell *> *cells = tableView.visibleCells;
    CGFloat tableHeight = tableView.bounds.size.height;
    
    for (UITableViewCell* cell in cells) {
        cell.transform = CGAffineTransformMakeTranslation(0, tableHeight);
    }
    
    double index = 0;
    
    for (UITableViewCell* a in cells) {
        [UIView animateWithDuration: 1.5 delay: 0.05 * index usingSpringWithDamping: 0.8 initialSpringVelocity: 0 options: 0 animations: ^{
            a.transform = CGAffineTransformMakeTranslation(0, 0);
        } completion: nil];
        
        index += 1;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //return indexPath.row % 2 == 0 ? 80 : 40;
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
   
    CATransform3D rotation;
    rotation = CATransform3DMakeRotation((90.0*M_PI)/180, 0.0, 0.7, 0.4);
    rotation.m23 = 1.0/ -600;
    
    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
    cell.layer.shadowOffset = CGSizeMake(10, 10);
    cell.alpha = 0;
    cell.layer.transform = rotation;
    cell.layer.anchorPoint = CGPointMake(0, 0.5);
    
    [UIView beginAnimations:@"rotation" context:NULL];
    [UIView setAnimationDuration:0.8];
    cell.layer.transform = CATransform3DIdentity;
    cell.alpha = 1;
    cell.layer.shadowOffset = CGSizeMake(0, 0);
    [UIView commitAnimations];

    [UIView animateWithDuration:5.0
                     animations:^{
                         
                         [cell.contentView setBackgroundColor:[UIColor clearColor]];
                         CAGradientLayer *grad = [CAGradientLayer layer];
                         grad.frame = cell.contentView.bounds;
                         
                         grad.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:10/255.0 green:10/255.0 blue:10/255.0 alpha:1] CGColor], (id)[[UIColor colorWithRed:140/255.0 green:160/255.0 blue:200/255.0 alpha:1] CGColor], nil];
                         
                         [cell.contentView.layer insertSublayer:grad atIndex:0];
                     }
                     completion:^(BOOL finished){
                     }];
}

@end
