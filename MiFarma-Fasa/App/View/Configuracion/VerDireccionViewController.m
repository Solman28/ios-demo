//
//  VerDireccionViewController.m
//  MiFarma-Fasa
//
//  Created by Mi Manzana on 1/29/14.
//  Copyright (c) 2014 Janaq. All rights reserved.
//

#import "VerDireccionViewController.h"
#import "ItemVerDireccionCell.h"
#import "PortadaIniViewController.h"
#import "BackgroundConfigurationWhiteView.h"

#import "BackgroundTipo1PerfilCell.h"
#import "BackgroundTipo2PerfilCell.h"
#import "BackgroundTipo3PerfilCell.h"
#import "BackgroundTipo4PerfilCell.h"

#import "BackgroundConfigurationSelectCell.h"


@interface VerDireccionViewController ()

@end

@implementation VerDireccionViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGFloat alto = [[UIScreen mainScreen] bounds].size.height;
    
    [[PortadaIniViewController sharedInstance] toolBarSetup:self];
    
    // NavigationBar
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 180, 44)];
    [title setText:[self.dic objectForKey:@"c_alias_address"]];
    [title setTextColor:[UIColor grayColor]];
    [title setBackgroundColor:[UIColor colorWithRed:247.0/255 green:247.0/255 blue:247.0/255 alpha:1]];
    [title setTextAlignment:NSTextAlignmentCenter];
    [self.navigationItem setTitleView:title];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7) {
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"barraploma7.jpg"] forBarMetrics:UIBarMetricsDefault];
    } else {
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"barraploma6.jpg"] forBarMetrics:UIBarMetricsDefault];
    }
    
    
    //ToolBar Buttons ------------
    UIButton *back = [[PortadaIniViewController sharedInstance] getBackButton];
    [back addTarget:self action:@selector(btnRetroceder:) forControlEvents:UIControlEventTouchUpInside];
    self.btnBack.customView = back;

    // ------------------------------
    
    
    [self.tableView setBackgroundView:[BackgroundConfigurationWhiteView new]];

}


// --- Buttons ToolBar -----
- (void) btnRetroceder: (UIButton *) sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void) btnMenu: (UIButton *) sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
// -------------------------

//Controles de ToolBar
- (void) btnHome:(UIButton*) sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void) btnNotification:(UIButton*) sender {
    [self performSegueWithIdentifier:@"SegueNotificacion" sender:self];
}
- (void) btnConfig:(UIButton*) sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) btnDelivery:(UIButton*) sender {
    NSLog(@"boton delivery");
}

// ---------------------------


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 6;
    } else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (indexPath.section == 0) {
        ItemVerDireccionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        [cell.lblTitulo setTextColor:[UIColor colorWithRed:75.0/255 green:75.0/255 blue:75.0/255 alpha:1]];
        
        if (indexPath.row == 0) {
            cell.backgroundView = [BackgroundTipo1PerfilCell new];
            cell.lblTitulo.text = @"Alias";
            cell.lblDireccion.text = [self.dic objectForKey:@"c_alias_address"];
        } else if (indexPath.row == 1) {
            cell.backgroundView = [BackgroundTipo2PerfilCell new];
            cell.lblTitulo.text = @"Distrito";
            cell.lblDireccion.text = [self.dic objectForKey:@"c_district_address"];
        } else if (indexPath.row == 2) {
            cell.backgroundView = [BackgroundTipo2PerfilCell new];
            cell.lblTitulo.text = @"Via";
            cell.lblDireccion.text = [self.dic objectForKey:@"c_via_address"];
        } else if (indexPath.row == 3) {
            cell.backgroundView = [BackgroundTipo2PerfilCell new];
            cell.lblTitulo.text = @"Dirección";
            cell.lblDireccion.text = [self.dic objectForKey:@"c_address_address"];
        } else if (indexPath.row == 4) {
            cell.backgroundView = [BackgroundTipo2PerfilCell new];
            cell.lblTitulo.text = @"Nro";
            cell.lblDireccion.text = [self.dic objectForKey:@"c_nro_address"];
        } else {
            cell.backgroundView = [BackgroundTipo3PerfilCell new];
            cell.lblTitulo.text = @"Referencia";
            cell.lblDireccion.text = [self.dic objectForKey:@"c_reference_address"];
        }
        
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
        cell.backgroundView = [BackgroundTipo4PerfilCell new];
        cell.selectedBackgroundView = [BackgroundConfigurationSelectCell new];
        return cell;
    }

}


@end
