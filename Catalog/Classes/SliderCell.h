//
//  SliderCell.h
//  Catalog
//
//  Created by Andy Waite on 15/04/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TableControlItem.h"

@protocol UISliderDelegate <NSObject>
@required
-(void) sliderAction:(UISlider*)sender;
@end

@interface SliderCell : TableControlItem {
	id<UISliderDelegate> delegate;

}

@property (nonatomic, retain) id<UISliderDelegate> delegate;

@end
