//
//  ipadHomeTableCell.m
//  cultureDemo
//
//  Created by dujw on 11-11-7.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ipadHomeTableCell.h"


@implementation ipadHomeTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code.
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state.
}


- (void)dealloc {
    [super dealloc];
}


@end
