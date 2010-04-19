#import "EditableListViewController.h"


@implementation EditableListViewController

#pragma mark - #pragma mark Table View Data Source Methods
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath {
	TableSection *sectionToDeleteFrom = [sections objectAtIndex:indexPath.section];
	NSObject *itemForDeletion = [sectionToDeleteFrom.items objectAtIndex:indexPath.row];
    [self didDeleteItem:itemForDeletion atIndexPath:indexPath];
	[sectionToDeleteFrom.items removeObjectAtIndex:indexPath.row];
	[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

- (void) didDeleteItem:(NSObject*)item atIndexPath:(NSIndexPath*)indexPath{
	NSLog(@"you deleted item %@ at indexPath %@ (you should override this method)", item, indexPath);
}

@end
