//
//  TTDemoViewController.m
//  TTAlertView
//
//  Created by Duncan Lewis on 10/15/12.
//  Copyright (c) 2012 Two Toasters. All rights reserved.
//

#import "TTDemoViewController.h"

static NSString * const mediumText = @"Medium\nmultiple line\ntext";

static NSString * const loremIpsum = @"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. \n Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

@interface TTDemoViewController ()

@end

@implementation TTDemoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGFloat buttonWidth = floorf(self.view.frame.size.width/3.0f);
    CGFloat buttonHeight = 80.0f;
    CGFloat xSpacing = floorf(buttonWidth / 3.0f);
    CGFloat ySpacing = 20.0f;
    CGFloat y = 20.0f;
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    
    UIButton *demoSimple = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [demoSimple setTitle:@"Simple" forState:UIControlStateNormal];
    [demoSimple addTarget:self action:@selector(demoSimpleAction:) forControlEvents:UIControlEventTouchUpInside];
    [demoSimple setFrame:(CGRect){ xSpacing, y, buttonWidth, buttonHeight }];
    [scrollView addSubview:demoSimple];
    
    UIButton *demoSimpleCustom = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [demoSimpleCustom setTitle:@"Simple Custom" forState:UIControlStateNormal];
    [demoSimpleCustom addTarget:self action:@selector(demoSimpleCustomAction:) forControlEvents:UIControlEventTouchUpInside];
    [demoSimpleCustom setFrame:(CGRect){ 2*xSpacing + buttonWidth, y, buttonWidth, buttonHeight }];
    [[demoSimpleCustom titleLabel] setLineBreakMode:NSLineBreakByWordWrapping];
    [scrollView addSubview:demoSimpleCustom];
    
    y += ySpacing + buttonHeight;
    
    UIButton *demoMediumText = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [demoMediumText setTitle:@"Medium Text" forState:UIControlStateNormal];
    [demoMediumText addTarget:self action:@selector(demoMediumTextAction:) forControlEvents:UIControlEventTouchUpInside];
    [demoMediumText setFrame:(CGRect){ xSpacing, y, buttonWidth, buttonHeight }];
    [scrollView addSubview:demoMediumText];
    
    UIButton *demoMediumTextCustom = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [demoMediumTextCustom setTitle:@"Medium Text Custom" forState:UIControlStateNormal];
    [demoMediumTextCustom addTarget:self action:@selector(demoMediumTextCustomAction:) forControlEvents:UIControlEventTouchUpInside];
    [demoMediumTextCustom setFrame:(CGRect){ 2*xSpacing + buttonWidth, y, buttonWidth, buttonHeight }];
    [[demoMediumTextCustom titleLabel] setLineBreakMode:NSLineBreakByWordWrapping];
    [scrollView addSubview:demoMediumTextCustom];
    
    y += ySpacing + buttonHeight;
    
    UIButton *demoLongText = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [demoLongText setTitle:@"Long Text" forState:UIControlStateNormal];
    [demoLongText addTarget:self action:@selector(demoLongTextAction:) forControlEvents:UIControlEventTouchUpInside];
    [demoLongText setFrame:(CGRect){ xSpacing, y, buttonWidth, buttonHeight }];
    [scrollView addSubview:demoLongText];
    
    UIButton *demoLongTextCustom = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [demoLongTextCustom setTitle:@"Long Text Custom" forState:UIControlStateNormal];
    [demoLongTextCustom addTarget:self action:@selector(demoLongTextCustomAction:) forControlEvents:UIControlEventTouchUpInside];
    [demoLongTextCustom setFrame:(CGRect){ 2*xSpacing + buttonWidth, y, buttonWidth, buttonHeight }];
    [[demoLongTextCustom titleLabel] setLineBreakMode:NSLineBreakByWordWrapping];
    [scrollView addSubview:demoLongTextCustom];
    
    y += ySpacing + buttonHeight;
    
    UIButton *demoThreeButtonsText = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [demoThreeButtonsText setTitle:@"Three Buttons" forState:UIControlStateNormal];
    [demoThreeButtonsText addTarget:self action:@selector(demoThreeButtonsAction:) forControlEvents:UIControlEventTouchUpInside];
    [demoThreeButtonsText setFrame:(CGRect){ xSpacing, y, buttonWidth, buttonHeight }];
    [scrollView addSubview:demoThreeButtonsText];
    
    UIButton *demoThreeButtonsCustom = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [demoThreeButtonsCustom setTitle:@"Three Buttons Custom" forState:UIControlStateNormal];
    [demoThreeButtonsCustom addTarget:self action:@selector(demoThreeButtonsCustomAction:) forControlEvents:UIControlEventTouchUpInside];
    [demoThreeButtonsCustom setFrame:(CGRect){ 2*xSpacing + buttonWidth, y, buttonWidth, buttonHeight }];
    [[demoThreeButtonsCustom titleLabel] setLineBreakMode:NSLineBreakByWordWrapping];
    [scrollView addSubview:demoThreeButtonsCustom];
    
    y += ySpacing + buttonHeight;
    
    UIButton *demoFourButtonsText = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [demoFourButtonsText setTitle:@"Four Buttons" forState:UIControlStateNormal];
    [demoFourButtonsText addTarget:self action:@selector(demoFourButtonsAction:) forControlEvents:UIControlEventTouchUpInside];
    [demoFourButtonsText setFrame:(CGRect){ xSpacing, y, buttonWidth, buttonHeight }];
    [scrollView addSubview:demoFourButtonsText];
    
    UIButton *demoFourButtonsCustom = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [demoFourButtonsCustom setTitle:@"Four Buttons Custom" forState:UIControlStateNormal];
    [demoFourButtonsCustom addTarget:self action:@selector(demoFourButtonsCustomAction:) forControlEvents:UIControlEventTouchUpInside];
    [demoFourButtonsCustom setFrame:(CGRect){ 2*xSpacing + buttonWidth, y, buttonWidth, buttonHeight }];
    [[demoFourButtonsCustom titleLabel] setLineBreakMode:NSLineBreakByWordWrapping];
    [scrollView addSubview:demoFourButtonsCustom];
    
    y += ySpacing + buttonHeight;
    
    UIButton *demoFiveButtonsText = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [demoFiveButtonsText setTitle:@"Five Buttons" forState:UIControlStateNormal];
    [demoFiveButtonsText addTarget:self action:@selector(demoFiveButtonsAction:) forControlEvents:UIControlEventTouchUpInside];
    [demoFiveButtonsText setFrame:(CGRect){ xSpacing, y, buttonWidth, buttonHeight }];
    [scrollView addSubview:demoFiveButtonsText];
    
    UIButton *demoFiveButtonsCustom = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [demoFiveButtonsCustom setTitle:@"Five Buttons Custom" forState:UIControlStateNormal];
    [demoFiveButtonsCustom addTarget:self action:@selector(demoFiveButtonsCustomAction:) forControlEvents:UIControlEventTouchUpInside];
    [demoFiveButtonsCustom setFrame:(CGRect){ 2*xSpacing + buttonWidth, y, buttonWidth, buttonHeight }];
    [[demoFiveButtonsCustom titleLabel] setLineBreakMode:NSLineBreakByWordWrapping];
    [scrollView addSubview:demoFiveButtonsCustom];
    
    y += ySpacing + buttonHeight;
    
    UIButton *demoLongTextFourButtonsTest = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [demoLongTextFourButtonsTest setTitle:@"Long Text, 4 buttons" forState:UIControlStateNormal];
    [demoLongTextFourButtonsTest addTarget:self action:@selector(demoLongTextFourButtonsAction:) forControlEvents:UIControlEventTouchUpInside];
    [demoLongTextFourButtonsTest setFrame:(CGRect){ xSpacing, y, buttonWidth, buttonHeight }];
    [scrollView addSubview:demoLongTextFourButtonsTest];
    
    UIButton *demoLongTextFourButtonsTestCustom = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [demoLongTextFourButtonsTestCustom setTitle:@"Long Text, 4 buttons Custom" forState:UIControlStateNormal];
    [demoLongTextFourButtonsTestCustom addTarget:self action:@selector(demoLongTextFourButtonsCustomAction:) forControlEvents:UIControlEventTouchUpInside];
    [demoLongTextFourButtonsTestCustom setFrame:(CGRect){ 2*xSpacing + buttonWidth, y, buttonWidth, buttonHeight }];
    [[demoLongTextFourButtonsTestCustom titleLabel] setLineBreakMode:NSLineBreakByWordWrapping];
    [scrollView addSubview:demoLongTextFourButtonsTestCustom];
    
    y += ySpacing + buttonHeight;
    
    // test cases with no UIAlertView analog
    
    UIButton *demoOneButtonSizedTest = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [demoOneButtonSizedTest setTitle:@"One Button Custom Size" forState:UIControlStateNormal];
    [demoOneButtonSizedTest addTarget:self action:@selector(demoOneButtonSizedAction:) forControlEvents:UIControlEventTouchUpInside];
    [demoOneButtonSizedTest setFrame:(CGRect){ buttonWidth, y, buttonWidth, buttonHeight }];
    [[demoOneButtonSizedTest titleLabel] setLineBreakMode:NSLineBreakByWordWrapping];
    [scrollView addSubview:demoOneButtonSizedTest];
    
    y += ySpacing + buttonHeight;
    
    UIButton *demoTwoButtonsOneSizedTest = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [demoTwoButtonsOneSizedTest setTitle:@"Two Buttons, one sized" forState:UIControlStateNormal];
    [demoTwoButtonsOneSizedTest addTarget:self action:@selector(demoTwoButtonsOneSizedAction:) forControlEvents:UIControlEventTouchUpInside];
    [demoTwoButtonsOneSizedTest setFrame:(CGRect){ buttonWidth, y, buttonWidth, buttonHeight }];
    [[demoTwoButtonsOneSizedTest titleLabel] setLineBreakMode:NSLineBreakByWordWrapping];
    [scrollView addSubview:demoTwoButtonsOneSizedTest];
    
    y += ySpacing + buttonHeight;
    
    UIButton *demoTwoButtonsOtherSizedTest = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [demoTwoButtonsOtherSizedTest setTitle:@"Two Buttons, other sized" forState:UIControlStateNormal];
    [demoTwoButtonsOtherSizedTest addTarget:self action:@selector(demoTwoButtonsOtherSizedAction:) forControlEvents:UIControlEventTouchUpInside];
    [demoTwoButtonsOtherSizedTest setFrame:(CGRect){ buttonWidth, y, buttonWidth, buttonHeight }];
    [[demoTwoButtonsOtherSizedTest titleLabel] setLineBreakMode:NSLineBreakByWordWrapping];
    [scrollView addSubview:demoTwoButtonsOtherSizedTest];
    
    y += ySpacing + buttonHeight;
    
    UIButton *demoTwoButtonsBothSizedTest = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [demoTwoButtonsBothSizedTest setTitle:@"Two Buttons, both sized" forState:UIControlStateNormal];
    [demoTwoButtonsBothSizedTest addTarget:self action:@selector(demoTwoButtonsBothSizedAction:) forControlEvents:UIControlEventTouchUpInside];
    [demoTwoButtonsBothSizedTest setFrame:(CGRect){ buttonWidth, y, buttonWidth, buttonHeight }];
    [[demoTwoButtonsBothSizedTest titleLabel] setLineBreakMode:NSLineBreakByWordWrapping];
    [scrollView addSubview:demoTwoButtonsBothSizedTest];
    
    y += ySpacing + buttonHeight;
    
    UIButton *demoThreeButtonsCustomSizedTest = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [demoThreeButtonsCustomSizedTest setTitle:@"Three Buttons, custom sized" forState:UIControlStateNormal];
    [demoThreeButtonsCustomSizedTest addTarget:self action:@selector(demoThreeButtonsCustomSizedAction:) forControlEvents:UIControlEventTouchUpInside];
    [demoThreeButtonsCustomSizedTest setFrame:(CGRect){ buttonWidth, y, buttonWidth, buttonHeight }];
    [[demoThreeButtonsCustomSizedTest titleLabel] setLineBreakMode:NSLineBreakByWordWrapping];
    [scrollView addSubview:demoThreeButtonsCustomSizedTest];
    
    y += ySpacing + buttonHeight;

    UIButton *verticalOffsetTest = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [verticalOffsetTest setTitle:@"Vertical Offset" forState:UIControlStateNormal];
    [verticalOffsetTest addTarget:self action:@selector(demoVerticalOffsetButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [verticalOffsetTest setFrame:(CGRect){ buttonWidth, y, buttonWidth, buttonHeight }];
    [[verticalOffsetTest titleLabel] setLineBreakMode:NSLineBreakByWordWrapping];
    [scrollView addSubview:verticalOffsetTest];

    y += ySpacing + buttonHeight;
    
    [scrollView setContentSize:(CGSize){self.view.bounds.size.width, y}];
    [self.view addSubview:scrollView];
    
}

- (void)styleCustomAlertView:(TTAlertView *)alertView
{
    [alertView.containerView setImage:[[UIImage imageNamed:@"alert.bg.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(11.0f, 13.0f, 14.0f, 13.0f)]];
    [alertView.containerView setBackgroundColor:[UIColor clearColor]];
    
    alertView.buttonInsets = UIEdgeInsetsMake(alertView.buttonInsets.top, alertView.buttonInsets.left + 4.0f, alertView.buttonInsets.bottom + 6.0f, alertView.buttonInsets.right + 4.0f);
}

- (void)addButtonsWithBackgroundImagesToAlertView:(TTAlertView *)alertView
{
    UIImage *redButtonImageOff = [[UIImage imageNamed:@"large.button.red.off.png"] stretchableImageWithLeftCapWidth:2.0 topCapHeight:2.0];
    UIImage *redButtonImageOn = [[UIImage imageNamed:@"large.button.red.on.png"] stretchableImageWithLeftCapWidth:2.0 topCapHeight:2.0];
    
    UIImage *greenButtonImageOff = [[UIImage imageNamed:@"large.button.green.off.png"] stretchableImageWithLeftCapWidth:2.0 topCapHeight:2.0];
    UIImage *greenButtonImageOn = [[UIImage imageNamed:@"large.button.green.on.png"] stretchableImageWithLeftCapWidth:2.0 topCapHeight:2.0];
    
    for(int i = 0; i < [alertView numberOfButtons]; i++) {
        if (i == 0) {
            [alertView setButtonBackgroundImage:redButtonImageOff forState:UIControlStateNormal atIndex:i];
            [alertView setButtonBackgroundImage:redButtonImageOn forState:UIControlStateHighlighted atIndex:i];
        } else {
            [alertView setButtonBackgroundImage:greenButtonImageOff forState:UIControlStateNormal atIndex:i];
            [alertView setButtonBackgroundImage:greenButtonImageOn forState:UIControlStateHighlighted atIndex:i];
        }
    }
}

#pragma mark - Demo cases

// simple demo
- (void)demoSimpleAction:(id)sender
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Simple" message:@"Simple" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    [alertView show];
}

- (void)demoSimpleCustomAction:(id)sender
{
    TTAlertView *alertView = [[TTAlertView alloc] initWithTitle:@"Simple" message:@"Simple" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    [self styleCustomAlertView:alertView];
    [self addButtonsWithBackgroundImagesToAlertView:alertView];
    [alertView show];
}

// medium text demo
- (void)demoMediumTextAction:(id)sender
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Medium Text" message:mediumText delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Test", nil];
    [alertView show];
}

- (void)demoMediumTextCustomAction:(id)sender
{
    TTAlertView *alertView = [[TTAlertView alloc] initWithTitle:@"Medium Text" message:mediumText delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Test", nil];
    [self styleCustomAlertView:alertView];
    [self addButtonsWithBackgroundImagesToAlertView:alertView];    
    [alertView show];
}

// long text demo
- (void)demoLongTextAction:(id)sender
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Long Text" message:loremIpsum delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Test", nil];
    [alertView show];
}

- (void)demoLongTextCustomAction:(id)sender
{
    TTAlertView *alertView = [[TTAlertView alloc] initWithTitle:@"Long Text" message:loremIpsum delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Test", nil];
    [self styleCustomAlertView:alertView];
    [self addButtonsWithBackgroundImagesToAlertView:alertView];
    [alertView show];
}

// three buttons demo
- (void)demoThreeButtonsAction:(id)sender
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Three Buttons" message:@"Three Buttons" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Two", @"Three", nil];
    [alertView show];
}

- (void)demoThreeButtonsCustomAction:(id)sender
{
    TTAlertView *alertView = [[TTAlertView alloc] initWithTitle:@"Three Buttons" message:@"Three Buttons" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Two", @"Three", nil];
    [self styleCustomAlertView:alertView];
    [self addButtonsWithBackgroundImagesToAlertView:alertView];
    [alertView show];
}

// four buttons demo
- (void)demoFourButtonsAction:(id)sender
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Four Buttons" message:@"Four Buttons" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Two", @"Three", @"Four", nil];
    [alertView show];
}

- (void)demoFourButtonsCustomAction:(id)sender
{
    TTAlertView *alertView = [[TTAlertView alloc] initWithTitle:@"Four Buttons" message:@"Four Buttons" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Two", @"Three", @"Four", nil];
    [self styleCustomAlertView:alertView];
    [self addButtonsWithBackgroundImagesToAlertView:alertView];
    [alertView show];
}

// five buttons demo
- (void)demoFiveButtonsAction:(id)sender
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Five Buttons" message:@"Five Buttons" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Two", @"Three", @"Four", @"Five", nil];
    [alertView show];
}

- (void)demoFiveButtonsCustomAction:(id)sender
{
    TTAlertView *alertView = [[TTAlertView alloc] initWithTitle:@"Five Buttons" message:@"Five Buttons" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Two", @"Three", @"Four", @"Five", nil];
    [self styleCustomAlertView:alertView];
    [self addButtonsWithBackgroundImagesToAlertView:alertView];
    [alertView show];
}

// long text four buttons demo
- (void)demoLongTextFourButtonsAction:(id)sender
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Four Buttons Long Text" message:loremIpsum delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Two", @"Three", @"Four", nil];
    [alertView show];
}

- (void)demoLongTextFourButtonsCustomAction:(id)sender
{
    TTAlertView *alertView = [[TTAlertView alloc] initWithTitle:@"Four Buttons Long Text" message:loremIpsum delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Two", @"Three", @"Four", nil];
    [self styleCustomAlertView:alertView];
    [self addButtonsWithBackgroundImagesToAlertView:alertView];
    [alertView show];
}

- (void)demoOneButtonSizedAction:(id)sender
{
    TTAlertView *alertView = [[TTAlertView alloc] initWithTitle:@"One Button Custom Size" message:@"Simple" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    [self styleCustomAlertView:alertView];
    
    UIImage *redButtonImageOff = [[UIImage imageNamed:@"large.button.red.off.png"] stretchableImageWithLeftCapWidth:2.0 topCapHeight:2.0];
    UIImage *redButtonImageOn = [[UIImage imageNamed:@"large.button.red.on.png"] stretchableImageWithLeftCapWidth:2.0 topCapHeight:2.0];
    
    [alertView setButtonBackgroundImage:redButtonImageOff forState:UIControlStateNormal withSize:CGSizeMake(100, 44) atIndex:0];
    [alertView setButtonBackgroundImage:redButtonImageOn forState:UIControlStateHighlighted withSize:CGSizeMake(100, 44) atIndex:0];
    
    [alertView show];
}

- (void)demoTwoButtonsOneSizedAction:(id)sender
{
    TTAlertView *alertView = [[TTAlertView alloc] initWithTitle:@"Two Buttons, One Sized" message:@"Simple" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Other", nil];
    [self styleCustomAlertView:alertView];
    
    UIImage *redButtonImageOff = [[UIImage imageNamed:@"large.button.red.off.png"] stretchableImageWithLeftCapWidth:2.0 topCapHeight:2.0];
    UIImage *redButtonImageOn = [[UIImage imageNamed:@"large.button.red.on.png"] stretchableImageWithLeftCapWidth:2.0 topCapHeight:2.0];
    
    UIImage *greenButtonImageOff = [[UIImage imageNamed:@"large.button.green.off.png"] stretchableImageWithLeftCapWidth:2.0 topCapHeight:2.0];
    UIImage *greenButtonImageOn = [[UIImage imageNamed:@"large.button.green.on.png"] stretchableImageWithLeftCapWidth:2.0 topCapHeight:2.0];

    [alertView setButtonBackgroundImage:redButtonImageOff forState:UIControlStateNormal withSize:CGSizeMake(100, 44) atIndex:0];
    [alertView setButtonBackgroundImage:redButtonImageOn forState:UIControlStateHighlighted withSize:CGSizeMake(100, 44) atIndex:0];
    
    [alertView setButtonBackgroundImage:greenButtonImageOff forState:UIControlStateNormal atIndex:1];
    [alertView setButtonBackgroundImage:greenButtonImageOn forState:UIControlStateHighlighted atIndex:1];
    
    [alertView show];
}

- (void)demoTwoButtonsOtherSizedAction:(id)sender
{
    TTAlertView *alertView = [[TTAlertView alloc] initWithTitle:@"Two Buttons, Other Sized" message:@"Simple" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Other", nil];
    [self styleCustomAlertView:alertView];
    
    UIImage *redButtonImageOff = [[UIImage imageNamed:@"large.button.red.off.png"] stretchableImageWithLeftCapWidth:2.0 topCapHeight:2.0];
    UIImage *redButtonImageOn = [[UIImage imageNamed:@"large.button.red.on.png"] stretchableImageWithLeftCapWidth:2.0 topCapHeight:2.0];
    
    UIImage *greenButtonImageOff = [[UIImage imageNamed:@"large.button.green.off.png"] stretchableImageWithLeftCapWidth:2.0 topCapHeight:2.0];
    UIImage *greenButtonImageOn = [[UIImage imageNamed:@"large.button.green.on.png"] stretchableImageWithLeftCapWidth:2.0 topCapHeight:2.0];
    
    [alertView setButtonBackgroundImage:redButtonImageOff forState:UIControlStateNormal atIndex:0];
    [alertView setButtonBackgroundImage:redButtonImageOn forState:UIControlStateHighlighted atIndex:0];
    
    [alertView setButtonBackgroundImage:greenButtonImageOff forState:UIControlStateNormal withSize:CGSizeMake(100, 44) atIndex:1];
    [alertView setButtonBackgroundImage:greenButtonImageOn forState:UIControlStateHighlighted withSize:CGSizeMake(100, 44) atIndex:1];
    
    [alertView show];
}

- (void)demoTwoButtonsBothSizedAction:(id)sender
{
    TTAlertView *alertView = [[TTAlertView alloc] initWithTitle:@"Two Buttons, Both Sized" message:@"Simple" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Other", nil];
    [self styleCustomAlertView:alertView];
    
    UIImage *redButtonImageOff = [[UIImage imageNamed:@"large.button.red.off.png"] stretchableImageWithLeftCapWidth:2.0 topCapHeight:2.0];
    UIImage *redButtonImageOn = [[UIImage imageNamed:@"large.button.red.on.png"] stretchableImageWithLeftCapWidth:2.0 topCapHeight:2.0];
    
    UIImage *greenButtonImageOff = [[UIImage imageNamed:@"large.button.green.off.png"] stretchableImageWithLeftCapWidth:2.0 topCapHeight:2.0];
    UIImage *greenButtonImageOn = [[UIImage imageNamed:@"large.button.green.on.png"] stretchableImageWithLeftCapWidth:2.0 topCapHeight:2.0];
    
    [alertView setButtonBackgroundImage:redButtonImageOff forState:UIControlStateNormal withSize:CGSizeMake(100, 44) atIndex:0];
    [alertView setButtonBackgroundImage:redButtonImageOn forState:UIControlStateHighlighted withSize:CGSizeMake(100, 44) atIndex:0];
    
    [alertView setButtonBackgroundImage:greenButtonImageOff forState:UIControlStateNormal withSize:CGSizeMake(100, 44) atIndex:1];
    [alertView setButtonBackgroundImage:greenButtonImageOn forState:UIControlStateHighlighted withSize:CGSizeMake(100, 44) atIndex:1];
    
    [alertView show];
}

- (void)demoThreeButtonsCustomSizedAction:(id)sender
{
    TTAlertView *alertView = [[TTAlertView alloc] initWithTitle:@"Three Buttons, Custom Sized" message:@"Simple" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Two", @"Three", nil];
    [self styleCustomAlertView:alertView];
    
    UIImage *redButtonImageOff = [[UIImage imageNamed:@"large.button.red.off.png"] stretchableImageWithLeftCapWidth:2.0 topCapHeight:2.0];
    UIImage *redButtonImageOn = [[UIImage imageNamed:@"large.button.red.on.png"] stretchableImageWithLeftCapWidth:2.0 topCapHeight:2.0];
    
    UIImage *greenButtonImageOff = [[UIImage imageNamed:@"large.button.green.off.png"] stretchableImageWithLeftCapWidth:2.0 topCapHeight:2.0];
    UIImage *greenButtonImageOn = [[UIImage imageNamed:@"large.button.green.on.png"] stretchableImageWithLeftCapWidth:2.0 topCapHeight:2.0];
    
    [alertView setButtonBackgroundImage:redButtonImageOff forState:UIControlStateNormal withSize:CGSizeMake(100, 44) atIndex:0];
    [alertView setButtonBackgroundImage:redButtonImageOn forState:UIControlStateHighlighted withSize:CGSizeMake(100, 44) atIndex:0];
    
    [alertView setButtonBackgroundImage:greenButtonImageOff forState:UIControlStateNormal withSize:CGSizeMake(100, 88) atIndex:1];
    [alertView setButtonBackgroundImage:greenButtonImageOn forState:UIControlStateHighlighted withSize:CGSizeMake(100, 88) atIndex:1];
    
    [alertView setButtonBackgroundImage:greenButtonImageOff forState:UIControlStateNormal withSize:CGSizeMake(100, 44) atIndex:2];
    [alertView setButtonBackgroundImage:greenButtonImageOn forState:UIControlStateHighlighted withSize:CGSizeMake(100, 44) atIndex:2];
    
    [alertView show];
}

- (void)demoVerticalOffsetButtonAction
{
    TTAlertView *alertView = [[TTAlertView alloc] initWithTitle:@"Vertical Offset" message:@"-80 point offset" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    [self styleCustomAlertView:alertView];
    [self addButtonsWithBackgroundImagesToAlertView:alertView];
    alertView.containerVerticalOffset = -80.0f;
    [alertView show];
}

@end
