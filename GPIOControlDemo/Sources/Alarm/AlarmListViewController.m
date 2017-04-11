//
//  AlarmListViewController.m
//  GPIOControlDemo
//
//  Created by Nikita Khomitsevich on 4/10/17.
//  Copyright © 2017 cybervisiontech. All rights reserved.
//

#import "AlarmListViewController.h"
#import "AlarmTableViewCell.h"
#import "AddAlarmViewController.h"

double const kAlarmTableViewCellHeight = 70.0;

static NSString * const kAlarmTableViewCellID = @"AlarmTableViewCellID";
static NSString * const kAddAlarmViewControllerID = @"AddAlarmViewControllerID";
static NSString * const kDefaultAlarmDateFormat = @"HH:mm";

@interface AlarmListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *emptyListLabel;
@property (weak, nonatomic) IBOutlet UITableView *alarmsTableView;

@property (strong, nonatomic) NSDateFormatter *dateFormatter;

@end


@implementation AlarmListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupInitialData];
    [self createStubAlarms]; /// Stub Data
    [self checkAlarmList];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.alarms.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AlarmTableViewCell *cell = (AlarmTableViewCell *) [tableView dequeueReusableCellWithIdentifier:kAlarmTableViewCellID
                                                                                      forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[AlarmTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kAlarmTableViewCellID];
    }
    
    Alarm *alarm = self.alarms[indexPath.row];
    
    cell.timeLabel.text = [self.dateFormatter stringFromDate:alarm.time];
    cell.actionLabel.text = alarm.actionTitle; // TOOD: FIX to work with UISegmented object
    cell.alarmNameLabel.text = alarm.name;
    cell.iterationStateLabel.text = alarm.iteration;
    cell.alarmStateButton.selected = alarm.isActive;
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kAlarmTableViewCellHeight;
}

#pragma mark - Actions

- (IBAction)changeAlarmState:(id)sender
{
#pragma mark - TODO
    UIButton *selectedButton = (UIButton *)sender;
    NSIndexPath *indexPath = [self indexPathForPressedButton:sender];
    selectedButton.selected = !selectedButton.selected;
    [self updateAlarmState:selectedButton.selected forIndex:indexPath.row];
}

- (IBAction)addNewAlarm:(id)sender
{
    NSIndexPath *indexPath = [self indexPathForPressedButton:sender];
    AddAlarmViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:kAddAlarmViewControllerID];
    __weak AlarmListViewController *wself = self;
    vc.block = ^(Alarm *alarm){
        [wself.alarms addObject:alarm];
        [wself reloadCellsForIndexPaths:@[indexPath]];
    };
    vc.providesPresentationContextTransitionStyle = YES;
    vc.definesPresentationContext = YES;
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma makr - Helpers

- (void)checkAlarmList
{
    if (self.alarms.count == 0) {
        self.alarmsTableView.hidden = YES;
        self.emptyListLabel.hidden = NO;
    } else {
        self.alarmsTableView.hidden = NO;
        self.emptyListLabel.hidden = YES;
    }
}

- (void)setupInitialData
{
    self.alarmsTableView.delegate = self;
    self.alarmsTableView.dataSource = self;
    
    self.alarms = [NSMutableArray new];
    
    self.dateFormatter.timeZone = [NSTimeZone defaultTimeZone];
    self.dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    self.dateFormatter.dateFormat = kDefaultAlarmDateFormat;
}

- (void)createStubAlarms
{
    NSString *alarmTimeStr = @"12:40";
    NSDate *date = [self.dateFormatter dateFromString:alarmTimeStr];
    Alarm *first = [[Alarm alloc] initWithTime:date action:AlarmActionToggle name:@"Morning Alarm" iteration:@"Every day" isActive:YES ID:1];
    [self.alarms addObject:first];
}

- (void)updateAlarmState:(BOOL)state forIndex:(NSInteger)row
{
    Alarm *selectedAlarm = self.alarms[row];
    selectedAlarm.isActive = state;
    [self.alarms replaceObjectAtIndex:row withObject:selectedAlarm];
}

- (UIColor *)colorForAction:(AlarmAction)action
{
    switch (action) {
        case AlarmActionPowerOff:
            return [UIColor redColor];
        case AlarmActionPowerOn:
            return [UIColor greenColor];
        case AlarmActionToggle:
            return [UIColor yellowColor];
    }
}

- (void)reloadCellsForIndexPaths:(NSArray<NSIndexPath *> *)indexPaths
{
    __weak AlarmListViewController *wself = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [wself.alarmsTableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    });
}

- (NSIndexPath *)indexPathForPressedButton:(UIButton *)sender
{
    UITableViewCell *selectedCell = (UITableViewCell *) [[sender superview] superview];
    return [self.alarmsTableView indexPathForCell:selectedCell];
}

@end
