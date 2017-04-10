//
//  ChooseTemplateImageViewController.m
//  GPIOControlDemo
//
//  Created by Nikita Khomitsevich on 3/20/17.
//  Copyright © 2017 cybervisiontech. All rights reserved.
//

#import "ChooseTemplateImageViewController.h"
#import "TemplateImageCollectionViewCell.h"


static NSString * const kTemplateImageCollectionViewCellID = @"kTemplateImageCollectionViewCellID";

@interface ChooseTemplateImageViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) NSArray<NSString *> *templateImages;
@property (weak, nonatomic) IBOutlet UICollectionView *imagesCollectionView;

@end

@implementation ChooseTemplateImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.templateImages = @[@"No_image_054_1x", @"flat_tv_054_1x", @"sv4_054_1x", @"kitchen_054_1x", @"Win_054_1x", @"fan_054_1x", @"refregerator_054_1x", @"wash_054_1x", @"gas_stove_054-01_1x", @"cond_054-01_1x", @"lamp2_054_1x", @"lamp-_054_1x"];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.templateImages.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TemplateImageCollectionViewCell *cell = [self.imagesCollectionView dequeueReusableCellWithReuseIdentifier:kTemplateImageCollectionViewCellID forIndexPath:indexPath];
    cell.templateImageView.image = [UIImage imageNamed:self.templateImages[indexPath.row]];
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"You selected cell number: %li.", (long)indexPath.row);
    if (self.block)
        self.block([UIImage imageNamed:self.templateImages[indexPath.row]]);
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
