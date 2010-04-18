//
//  SwitchCell.h
//  Catalog
//
//  Created by Andy Waite on 15/04/2010.
//  Copyright 2010 HuddleTech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TableControlItem.h"

@protocol UISwitchDelegate <NSObject>
@required
-(void) switchAction:(UISwitch*)sender;
@end

@interface SwitchCell : TableControlItem {
	id<UISwitchDelegate> delegate;
}
@property (nonatomic, retain) id<UISwitchDelegate> delegate;


@end
