//
//  CatalogAppDelegate.h
//  Catalog
//
//  Created by Andy Waite on 12/04/2010.
//  Copyright HuddleTech 2010. All rights reserved.
//

@interface CatalogAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 30200
	UISplitViewController *splitVC;
#endif
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 30200
@property (nonatomic, retain) IBOutlet UISplitViewController *splitVC;
#endif
@end

