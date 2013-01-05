//
//  ViewController.m
//  Relogio
//
//  Created by Rafael Brigagão Paulino on 16/10/12.
//  Copyright (c) 2012 rafapaulino.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //colocar view do relogio na tela
    Relogio *rel = [[Relogio alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 -100, self.view.frame.size.height/2 -100, 200, 200)];
    
    rel.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:rel];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
