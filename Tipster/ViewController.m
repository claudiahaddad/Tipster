//
//  ViewController.m
//  Tipster
//
//  Created by Claudia Haddad on 6/26/18.
//  Copyright © 2018 Claudia Haddad. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *bill;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    NSLog(@"hello");
    [self.view endEditing:YES];
}

- (IBAction)onEdit:(id)sender {
    double billAmount = [self.bill.text doubleValue];
    
    NSArray *percentages = @[@(0.15),@(0.2),@(0.22)];
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex]doubleValue];
    
    double tip = tipPercentage * billAmount;
    double total = billAmount + tip;
    
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
}

- (IBAction)onEditingBegin:(id)sender {
    [UIView animateWithDuration:0.2 animations :^{

   self.bill.frame = CGRectMake(self.bill.frame.origin.x, self.bill.frame.origin.y + 30, self.bill.frame.size.width, self.bill.frame.size.height);
        self.tipLabel.alpha = 0;

    }];
}

- (IBAction)onEditingEnd:(id)sender {
    CGRect newFrame  = self.bill.frame;
    newFrame.origin.y -= 30;
    
    [UIView animateWithDuration:0.2 animations:^{
    self.bill.frame = newFrame;
        
    }];
    
    [UIView animateWithDuration:1 animations:^{
        self.tipLabel.alpha = 1;
    }];
}

@end
