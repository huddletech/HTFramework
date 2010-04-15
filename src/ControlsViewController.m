/*
     File: ControlsViewController.m
 Abstract: The view controller for hosting the UIControls features of this sample.
  Version: 2.6
 
 Disclaimer: IMPORTANT:  This Apple software is supplied to you by Apple
 Inc. ("Apple") in consideration of your agreement to the following
 terms, and your use, installation, modification or redistribution of
 this Apple software constitutes acceptance of these terms.  If you do
 not agree with these terms, please do not use, install, modify or
 redistribute this Apple software.
 
 In consideration of your agreement to abide by the following terms, and
 subject to these terms, Apple grants you a personal, non-exclusive
 license, under Apple's copyrights in this original Apple software (the
 "Apple Software"), to use, reproduce, modify and redistribute the Apple
 Software, with or without modifications, in source and/or binary forms;
 provided that if you redistribute the Apple Software in its entirety and
 without modifications, you must retain this notice and the following
 text and disclaimers in all such redistributions of the Apple Software.
 Neither the name, trademarks, service marks or logos of Apple Inc. may
 be used to endorse or promote products derived from the Apple Software
 without specific prior written permission from Apple.  Except as
 expressly stated in this notice, no other rights or licenses, express or
 implied, are granted by Apple herein, including but not limited to any
 patent rights that may be infringed by your derivative works or by other
 works in which the Apple Software may be incorporated.
 
 The Apple Software is provided by Apple on an "AS IS" basis.  APPLE
 MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION
 THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS
 FOR A PARTICULAR PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND
 OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.
 
 IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL
 OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION,
 MODIFICATION AND/OR DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED
 AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE),
 STRICT LIABILITY OR OTHERWISE, EVEN IF APPLE HAS BEEN ADVISED OF THE
 POSSIBILITY OF SUCH DAMAGE.
 
 Copyright (C) 2009 Apple Inc. All Rights Reserved.
 
 */

#import "ControlsViewController.h"
#import "SwitchCell.h"

#pragma mark -

@implementation ControlsViewController

@synthesize dataSourceArray;

- (void)dealloc
{	
	[dataSourceArray release];
	[super dealloc];
}

- (void)viewDidLoad
{	
    [super viewDidLoad];

	SwitchCell *switchCell = [[SwitchCell alloc] initWithTitle:@"Standard Switch"];
	switchCell.delegate = self;
	
	SliderCell *sliderCell = [[SliderCell alloc] initWithTitle:@"Slider"];
	sliderCell.delegate = self;
	
	ActivityCell *activityCell = [[ActivityCell alloc] initWithTitle:@"Activity Indicator"];
	
	ProgressCell *progressCell = [[ProgressCell alloc] initWithTitle:@"Progress"];
	
	self.dataSourceArray = [NSArray arrayWithObjects:
							switchCell,
							sliderCell,
							activityCell,
							progressCell,
							nil];
	[switchCell release];
	[sliderCell release];
	[activityCell release];
	[progressCell release];
}

// called after the view controller's view is released and set to nil.
// For example, a memory warning which causes the view to be purged. Not invoked as a result of -dealloc.
// So release any properties that are loaded in viewDidLoad or can be recreated lazily.
//
- (void)viewDidUnload 
{
    [super viewDidUnload];
	self.dataSourceArray = nil;	// this will release and set to nil
}


#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.dataSourceArray count];
}


// to determine which UITableViewCell to be used on a given row.
//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *kDisplayCell_ID = @"DisplayCellID";
	UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kDisplayCell_ID];
	if (cell == nil)
	{
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kDisplayCell_ID] autorelease];
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
	}
	else
	{
		// the cell is being recycled, remove old embedded controls
		UIView *viewToRemove = nil;
		viewToRemove = [cell.contentView viewWithTag:kViewTag];
		if (viewToRemove)
			[viewToRemove removeFromSuperview];
	}
	
	TableControlItem *controlItem = [self.dataSourceArray objectAtIndex: indexPath.row];
	
	cell.textLabel.text = [controlItem title];

	cell.accessoryView = [controlItem control];
	 
	return cell;
}

- (void)sliderAction:(id)sender{
	UISlider *slider = (UISlider*)sender;
	NSLog(@"slider moved to %f", slider.value);
}


- (void)switchAction:(id)sender
{
	NSLog(@"switchAction: value = %d", [sender isOn]);
}

@end

