//
//  DatosTableViewCell.m
//  UITableView con secciones
//
//  Created by PROIMA on 20/11/17.
//  Copyright © 2017 Tipping Point. All rights reserved.
//

#import "DatosTableViewCell.h"

@implementation DatosTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(int)getAltura {
	return 44;
}

@end
