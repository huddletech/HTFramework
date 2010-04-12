//
//  LongTextFieldViewController.h
//  iContractor
//
//  Created by Jeff LaMarche on 2/10/09.
//  Copyright 2009 Jeff LaMarche Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AbstractGenericViewController.h"
@protocol LongTextFieldEditingViewControllerDelegate <NSObject>
@required
- (void)takeNewString:(NSString *)newValue;
@end

@interface LongTextFieldViewController : AbstractGenericViewController 
{
	NSString	*string;
	UITextView	*textView;
	
	id<LongTextFieldEditingViewControllerDelegate>	delegate;
}
@property (nonatomic, retain) NSString *string;
@property (nonatomic, retain) IBOutlet UITextView *textView;
@property (nonatomic, assign)  id <LongTextFieldEditingViewControllerDelegate> delegate;
- (void)save;
@end
