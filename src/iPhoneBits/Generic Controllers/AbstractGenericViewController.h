//
//  AbstractGenericViewController.h
//  iContractor
//
//  Created by Jeff LaMarche on 2/18/09.
//  Copyright 2009 Jeff LaMarche Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AbstractGenericViewController : UITableViewController 
{
	BOOL hideCancelButton;
	BOOL hideSaveButton;
}
-(IBAction)cancel;
@property (nonatomic) BOOL hideCancelButton;
@property (nonatomic) BOOL hideSaveButton;

@end
