
#import <UIKit/UIKit.h>
#import "AbstractGenericViewController.h"

#define kDefaultLabelTag 50002

@protocol TextFieldEditingViewControllerDelegate <NSObject>
@required
- (void)valuesDidChange:(NSDictionary *)newValues;
@end


@interface TextFieldEditingViewController : AbstractGenericViewController <UITextFieldDelegate> {
	
	NSArray								*fieldNames;		// Field name to be displayed to user
	NSArray								*fieldKeys;			// Key value to be used in dictionary when values are passed back to delegate
	NSArray								*fieldValues;		// Starting display values for each field. Values should be strings.
	
	NSMutableArray						*changedValues;		// Changes will be stored in this array , which will also be passed back to delegate on save
	UIKeyboardType						keyboardTypes[5];	// Keyboard types for each field
	
	BOOL								shouldClearOnEditing; 
	
	id <TextFieldEditingViewControllerDelegate>	delegate;	// Delegate who will received the changed values. Delegate
															// is responsble for converting back from string if necessary
	
	UITextField							*textFieldBeingEdited; // The field currently being edited
}

@property (nonatomic, retain) NSArray *fieldNames;
@property (nonatomic, retain) NSArray *fieldKeys;
@property (nonatomic, retain) NSArray *fieldValues;
@property (nonatomic, retain) NSMutableArray *changedValues;
@property (nonatomic, assign /* for weak ref */) id <TextFieldEditingViewControllerDelegate> delegate;
@property (nonatomic, retain) UITextField *textFieldBeingEdited;
@property BOOL shouldClearOnEditing;
-(IBAction)save;
-(IBAction)textFieldDone:(id)sender;
-(void)setKeyboardType:(UIKeyboardType)theType forIndex:(NSUInteger)index;
@end
