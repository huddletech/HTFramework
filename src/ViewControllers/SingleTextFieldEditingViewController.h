#import <Foundation/Foundation.h>
#import "TextFieldEditingViewController.h"


@interface SingleTextFieldEditingViewController : TextFieldEditingViewController <TextFieldEditingViewControllerDelegate>{
	NSString *fieldName, *fieldKey, *fieldValue;
}

@property (nonatomic, retain) NSString *fieldName, *fieldKey, *fieldValue;

@end
