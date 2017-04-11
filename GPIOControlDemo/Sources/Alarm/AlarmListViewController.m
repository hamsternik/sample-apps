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

static NSString * const kAlarmTableViewCellID = @"AlarmTableViewCellID";
static NSString * const kAddAlarmViewControllerID = @"AddAlarmViewControllerID";

@interface AlarmListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *emptyListLabel;
@property (weak, nonatomic) IBOutlet UITableView *alarmsTableView;

@end


@implementation AlarmListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.alarmsTableView.delegate = self;
    self.alarmsTableView.dataSource = self;
    
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
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    dateFormatter.dateFormat = @"HH:mm";
    cell.timeLabel.text = [dateFormatter stringFromDate:alarm.time];
    cell.actionLabel.text = alarm.action;
    cell.alarmNameLabel.text = alarm.name;
    cell.iterationStateLabel.text = alarm.iteration;
    cell.alarmStateButton.selected = alarm.isActive;
    
    return cell;
}

#pragma mark - UITableViewDelegate

#pragma mark - Actions

- (IBAction)changeAlarmState:(id)sender
{
    // TODO: !Impl
}

- (IBAction)addNewAlarm:(id)sender
{
    AddAlarmViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:kAddAlarmViewControllerID];
    __weak AlarmListViewController *wself = self;
    vc.block = ^(Alarm *alarm){
        [wself.alarms addObject:alarm];
        // TODO: Update UI
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


@end
