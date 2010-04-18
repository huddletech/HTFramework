//
//  Controls.m
//  Catalog
//
//  Created by Andy Waite on 18/04/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Controls.h"


@implementation Controls

- (void)viewDidLoad
{	
    [super viewDidLoad];
	
	SwitchCell *switchCell = [[SwitchCell alloc] initWithTitle:@"Standard Switch"];
	switchCell.delegate = self;
	
	SliderCell *sliderCell = [[SliderCell alloc] initWithTitle:@"Slider"];
	sliderCell.delegate = self;
	
	ActivityCell *activityCell = [[ActivityCell alloc] initWithTitle:@"Activity Indicator"];
	
	ProgressCell *progressCell = [[ProgressCell alloc] initWithTitle:@"Progress"];
	
	TableControlItem *accessoryCell = [[TableControlItem alloc] initWithTitle:@"Hello"];
	accessoryCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	accessoryCell.detail = @"Goodbye";
	
	self.dataSourceArray = [NSArray arrayWithObjects:
							switchCell,
							sliderCell,
							activityCell,
							progressCell,
							accessoryCell,
							nil];
	[accessoryCell release];
	[switchCell release];
	[sliderCell release];
	[activityCell release];
	[progressCell release];
}

- (void)switchAction:(id)sender
{
	NSLog(@"switchAction: value = %d", [sender isOn]);
}

- (void)sliderAction:(id)sender{
	UISlider *slider = (UISlider*)sender;
	NSLog(@"slider moved to %f", slider.value);
}

@end
