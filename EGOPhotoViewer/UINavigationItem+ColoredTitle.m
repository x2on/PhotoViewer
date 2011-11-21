//
//  UINavigationItem+ColoredTitle.m
//  photoviewer
//
//  Created by Schulze, Felix on 9/9/11.
//  Copyright 2011 Immobilienscout24. All rights reserved.
//

#import "UINavigationItem+ColoredTitle.h"

#define FONT_LABEL					[UIFont fontWithName:@"HelveticaNeue-Bold" size:18]


@implementation UINavigationItem (UINavigationItem_ColoredTitle)

-(void)setTitle:(NSString *)title withColor:(UIColor *)color {
    CGRect frame = CGRectMake(0, 0, 45, 45);
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    label.font =  FONT_LABEL;
    label.textColor = color;
    label.textAlignment = UITextAlignmentCenter;
    self.titleView = label;
    label.text = title;
    [label sizeToFit];
    [label release];
}
@end
