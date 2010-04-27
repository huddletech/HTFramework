//
//  Controls.m
//  Catalog
//
//  Created by Andy Waite on 18/04/2010.
//  Copyright 2010 HuddleTech. All rights reserved.
//

#import "Controls.h"


@implementation Controls

- (void)viewDidLoad
{	
    // setting up a bunch of controls is easy
	
	SwitchCell *switchCell = [[SwitchCell alloc] initWithTitle:@"Standard Switch"];
	switchCell.delegate = self;
	
	SliderCell *sliderCell = [[SliderCell alloc] initWithTitle:@"Slider"];
	sliderCell.delegate = self;
	
	ActivityCell *activityCell = [[ActivityCell alloc] initWithTitle:@"Activity Indicator"];
	
	ProgressCell *progressCell = [[ProgressCell alloc] initWithTitle:@"Progress"];
	
	TableControlItem *accessoryCell = [[TableControlItem alloc] initWithTitle:@"Hello"];
	accessoryCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	accessoryCell.detail = @"Goodbye";
	
	[self addIitems:[NSArray arrayWithObjects:
							switchCell,
							sliderCell,
							activityCell,
							progressCell,
							accessoryCell,
							nil]];
	[accessoryCell release];
	[switchCell release];
	[sliderCell release];
	[activityCell release];
	[progressCell release];
	
	[super viewDidLoad];
}

// since we're using the detailText attribute, choose a cell type that supports this

- (UITableViewCellStyle)tableViewCellStyle{
	return UITableViewCellStyleValue1;
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
