//
//  LongTextFieldViewController.h
//  iContractor
//
//  Created by Jeff LaMarche on 2/10/09.
//  Copyright 2009 Jeff LaMarche Consulting. All rights reserved.
//
//  Modifications by Andy Waite

#import <UIKit/UIKit.h>
#import "AbstractGenericViewController.h"

#define kTextViewOffset 10.0

@protocol LongTextFieldEditingViewControllerDelegate <NSObject>
@required
- (void)takeNewString:(NSString *)newValue;
@end

@interface LongTextFieldViewController : AbstractGenericViewController 
{
	NSString	*string;
	UITextView	*textView;
	double keyboardHeight;
	id<LongTextFieldEditingViewControllerDelegate>	delegate;
	BOOL reloadedTable;
}
@property (nonatomic, retain) NSString *string;
@property (nonatomic, retain) IBOutlet UITextView *textView;
@property (nonatomic, assign) id <LongTextFieldEditingViewControllerDelegate> delegate;
@property (nonatomic) double keyboardHeight;
@property (nonatomic) BOOL reloadedTable;
- (void)save;
- (float)margin;
@end
