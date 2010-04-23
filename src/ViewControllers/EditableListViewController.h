#import <Foundation/Foundation.h>
#import "HTFramework.h"

@interface EditableListViewController : ListViewController {

}

- (void) didDeleteItem:(NSObject*)item atIndexPath:(NSIndexPath*)indexPath;

@end
