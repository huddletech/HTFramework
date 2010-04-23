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
@synthesize splitVC;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
		[window addSubview:[splitVC view]];
	} else {
		[window addSubview:[navigationController view]];
	}
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

