/*
 DateViewController.h
 */

#import "AbstractGenericViewController.h"
#import "HTStyle.h"

@protocol DateViewDelegate <NSObject>
@required
- (void)takeNewDate:(NSDate *)newDate;
@end

@interface DateViewController : AbstractGenericViewController <UITableViewDelegate, UITableViewDataSource>
{
    UIDatePicker            *datePicker;
	UITableView				*dateTableView;
    NSDate                  *date;
    
    id <DateViewDelegate>   delegate;   // weak ref
}
@property (nonatomic, retain) UIDatePicker *datePicker;
@property (nonatomic, retain) UITableView *dateTableView;
@property (nonatomic, retain) NSDate *date;
@property (nonatomic, assign)  id <DateViewDelegate> delegate;
-(IBAction)dateChanged;
@end