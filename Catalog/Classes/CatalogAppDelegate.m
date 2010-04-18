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


#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
	
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
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

