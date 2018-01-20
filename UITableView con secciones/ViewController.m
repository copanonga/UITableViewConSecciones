//
//  ViewController.m
//  UITableView con secciones
//
//  Created by PROIMA on 20/11/17.
//  Copyright © 2017 Tipping Point. All rights reserved.
//

#import "ViewController.h"
#import "DatosTableViewCell.h"
#import "CeldaCabeceraTableViewCell.h"
#import "CeldaPieTableViewCell.h"

@interface ViewController () {
	NSMutableArray *datosSeccionCero;
	NSMutableArray *datosSeccionUno;
	NSMutableArray *datosSeccionDos;
}

@property (strong, nonatomic) IBOutlet UITableView *tablaResultados;

@end

@implementation ViewController
@synthesize tablaResultados;

- (void)viewDidLoad {
	
	NSLog(@"\nViewController");
	[super viewDidLoad];
	
	[self registrarCeldas];
	[self inicializarContenido];
	[tablaResultados reloadData];
	
}

-(void)registrarCeldas {
	
	[tablaResultados registerNib:[UINib nibWithNibName:NSStringFromClass([DatosTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"DatosIdentifier"];
	
	[tablaResultados registerNib:[UINib nibWithNibName:NSStringFromClass([CeldaCabeceraTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"CeldaCabeceraIdentifier"];
	
	[tablaResultados registerNib:[UINib nibWithNibName:NSStringFromClass([CeldaPieTableViewCell class]) bundle:nil] forCellReuseIdentifier:@"CeldaPieIdentifier"];
	
}

-(void)inicializarContenido {

	datosSeccionCero = [[NSMutableArray alloc] init];
	
	for (int i = 0 ; i < 10 ; i++){
		NSString *dato = [NSString stringWithFormat:@"Dato sección 0: %i",i];
		[datosSeccionCero addObject:dato];
	}
	
	datosSeccionUno = [[NSMutableArray alloc] init];
	
	for (int i = 0 ; i < 5 ; i++){
		NSString *dato = [NSString stringWithFormat:@"Dato sección 1: %i",i];
		[datosSeccionUno addObject:dato];
	}
	
	datosSeccionDos = [[NSMutableArray alloc] init];
	
	for (int i = 0 ; i < 20 ; i++){
		NSString *dato = [NSString stringWithFormat:@"Dato sección 2: %i",i];
		[datosSeccionDos addObject:dato];
	}
	
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

#pragma mark - TableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	
	switch (section) {
		case 0:
			return [datosSeccionCero count];
			break;
		case 1:
			return [datosSeccionUno count];
			break;
		case 2:
			return [datosSeccionDos count];
			break;
		default:
			return 0;
			break;
	}
	
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return [[DatosTableViewCell alloc] getAltura];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	NSString *textoDato = [[NSString alloc] init];
	switch (indexPath.section) {
		case 0:
			textoDato = [datosSeccionCero objectAtIndex:indexPath.row];
			break;
		case 1:
			textoDato = [datosSeccionUno objectAtIndex:indexPath.row];
			break;
		case 2:
			textoDato = [datosSeccionDos objectAtIndex:indexPath.row];
			break;
		default:
			textoDato = nil;
			break;
	}
	
	static NSString *cellIdentifier = @"DatosIdentifier";
	DatosTableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if (!cell) {
		cell = [[DatosTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
	}
	
	cell.labelTexto.text = textoDato;
	
	return cell;
	
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	
}

#pragma mark - Cabecera

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return [[CeldaCabeceraTableViewCell alloc] getAltura];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	
	static NSString *cellIdentifier = @"CeldaCabeceraIdentifier";
	CeldaCabeceraTableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if (!cell) {
		cell = [[CeldaCabeceraTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
	}
	
	cell.labelTexto.text = [NSString stringWithFormat:@"Cabecera sección %i",(int)section];
	
	return cell;
	
}

#pragma mark - Pie

-(CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

	return [[CeldaPieTableViewCell alloc] getAltura];
	
}

-(UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
	
	static NSString *cellIdentifier = @"CeldaPieIdentifier";
	CeldaPieTableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if (!cell) {
		cell = [[CeldaPieTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
	}
	
	cell.labelTexto.text = [NSString stringWithFormat:@"Pie sección %i",(int)section];
	
	return cell;
	
}

@end
