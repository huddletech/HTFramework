//
//  CatalogAppDelegate.m
//  Catalog
//
//  Created by Andy Waite on 12/04/2010.
//  Copyright HuddleTech 2010. All rights reserved.
//

#import "CatalogAppDelegate.h"
#import "RootViewController.h"


@implementation CatalogAppDelegate

@synthesize window;
@synthesize navigationController;
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 30200
@synthesize splitVC;
#endif
#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 30200
	[window addSubview:[splitVC view]];
#else
	[window addSubview:[navigationController view]];
#endif
	[window makeKeyAndVisible];
	return YES;
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

