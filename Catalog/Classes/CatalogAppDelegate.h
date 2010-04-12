//
//  CatalogAppDelegate.h
//  Catalog
//
//  Created by Andy Waite on 12/04/2010.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

@interface CatalogAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

