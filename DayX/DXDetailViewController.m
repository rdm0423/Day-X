//
//  DXDetailViewController.m
//  DayX
//
//  Created by Joshua Howland on 9/15/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "DXDetailViewController.h"
#import "EntryController.h"

@interface DXDetailViewController () <UITextFieldDelegate, UITextViewDelegate>

@property (nonatomic, strong) IBOutlet UITextField *textField;
@property (nonatomic, strong) IBOutlet UITextView *textView;
@property (nonatomic, strong) IBOutlet UIButton *clearButton;

@property (nonatomic, strong) Entry *entry;

@end

@implementation DXDetailViewController

- (void)updateWithEntry:(Entry *)entry {
    self.entry = entry;
    
    self.textField.text = entry.title;
    self.textView.text = entry.text;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textView.layer.cornerRadius = 8.0;
    self.textView.layer.masksToBounds = YES;
    self.textView.layer.borderWidth = 2.0;
    self.textView.layer.borderColor = [[UIColor blueColor]CGColor];
    

    self.textField.delegate = self;
    self.textView.delegate = self;
    
    self.textField.text = self.entry.title;
    self.textView.text = self.entry.text;
    
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(save:)];
    self.navigationItem.rightBarButtonItem = saveButton;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


- (IBAction)clear:(id)sender {
    self.textField.text = @"";
    self.textView.text = @"";

}

- (IBAction)save:(id)sender {
    
    Entry *entry = [[Entry alloc] initWithDictionary:@{titleKey: self.textField.text, textKey: self.textView.text}];

    if (self.entry) {
        [[EntryController sharedInstance] replaceEntry:self.entry withEntry:entry];
    } else {
        [[EntryController sharedInstance] addEntry:entry];
    }
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
