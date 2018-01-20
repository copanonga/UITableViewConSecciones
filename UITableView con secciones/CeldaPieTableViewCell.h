//
//  CeldaPieTableViewCell.h
//  UITableView con secciones
//
//  Created by PROIMA on 20/11/17.
//  Copyright © 2017 Tipping Point. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CeldaPieTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIView *viewContenido;
@property (strong, nonatomic) IBOutlet UILabel *labelTexto;

-(int)getAltura;

@end
