//
//  TTAlertView.m
//  TTAlertView
//
//  Created by Duncan Lewis on 10/12/12.
//  Copyright (c) 2012 Two Toasters. All rights reserved.
//

#import "TTAlertView.h"
#import <QuartzCore/QuartzCore.h>

static CGFloat const kTTDialogLeftInset = 20.0f;
static CGFloat const kTTDialogContentLeftInset = 10.0f; // space from left edge of dialogContainer to the content (i.e. buttons, message)
static CGFloat const kTTDialogMinVerticalInset = 60.0f;
static CGFloat const kTTDialogContentTopInset = 14.0f;
static CGFloat const kTTDialogContentBottomInset = 8.0f;
static CGFloat const kTTDialogContentTitleMessageSpacer = 8.0f;
static CGFloat const kTTDialogContentMessageButtonSpacer = 14.0f;
static CGFloat const kTTDialogContentExtraButtonsVerticalSpacer = 10.0f;
static CGFloat const kTTDialogContentBetweenButtonsVerticalSpacer = 4.0f;
static CGFloat const kTTDialogContentButtonSpacer = 8.0f;
static CGFloat const kTTDialogContentButtonHeight = 42.0f;

@interface TTAlertView ()

@property (nonatomic, copy) NSString *cancelButtonTitle;
@property (nonatomic, strong) NSArray *otherButtonTitles;
@property (nonatomic, strong) NSMutableArray *buttons;
@property (nonatomic, strong) NSMutableDictionary *buttonSizeStrings;

@end

@implementation TTAlertView

- (id)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...
{
    self = [super init];
    if (self) {
        
        self.title = title;
        self.message = message;
        self.delegate = delegate;

        self.cancelButtonTitle = cancelButtonTitle;
        
        NSMutableArray *otherTitlesArray = [NSMutableArray array];
        id eachObject;
        va_list argList;
        if (otherButtonTitles) {
            _firstOtherButtonIndex = 1;
            [otherTitlesArray addObject:otherButtonTitles];
            va_start(argList, otherButtonTitles);
            while ( (eachObject = va_arg(argList, id)) ) {
                [otherTitlesArray addObject:eachObject];
            }
            va_end(argList);
        }
        self.otherButtonTitles = otherTitlesArray;
        
        self.buttonSizeStrings = [NSMutableDictionary dictionary];
        _visible = NO;
        [self setUserInteractionEnabled:YES];
        
        [self setupView];
        
    }
    return self;
}

#pragma mark - Show/Dismiss

#warning TODO generalize
- (CAKeyframeAnimation *)attachPopUpAnimation
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation
                                      animationWithKeyPath:@"transform"];
    
    CATransform3D scale1 = CATransform3DMakeScale(0.0, 0.0, 1);
    CATransform3D scale2 = CATransform3DMakeScale(1.1, 1.1, 1);
    CATransform3D scale3 = CATransform3DMakeScale(0.9, 0.9, 1);
    CATransform3D scale4 = CATransform3DMakeScale(1.0, 1.0, 1);
    
    NSArray *frameValues = [NSArray arrayWithObjects:
                            [NSValue valueWithCATransform3D:scale1],
                            [NSValue valueWithCATransform3D:scale2],
                            [NSValue valueWithCATransform3D:scale3],
                            [NSValue valueWithCATransform3D:scale4],
                            nil];
    [animation setValues:frameValues];
    
    NSArray *frameTimes = [NSArray arrayWithObjects:
                           [NSNumber numberWithFloat:0.0],
                           [NSNumber numberWithFloat:0.5],
                           [NSNumber numberWithFloat:0.75],
                           [NSNumber numberWithFloat:1.0],
                           nil];    
    [animation setKeyTimes:frameTimes];
    
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.duration = .4;
    
    return animation;
}

- (void)show
{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    
    [self layoutInWindow:window];
    
    [self setAlpha:0.0f];
    [window addSubview:self];
    
    if([self.delegate respondsToSelector:@selector(willPresentAlertView:)]) {
        [self.delegate willPresentAlertView:self];
    }
    
    [UIView animateWithDuration:0.25f
                     animations:^{
                         [self setAlpha:1.0f];
                     }
                     completion:^(BOOL finished) {
                         _visible = YES;
                         if([self.delegate respondsToSelector:@selector(didPresentAlertView:)]) {
                             [self.delegate didPresentAlertView:self];
                         }
                     }];
    [self.dialogContainerView.layer addAnimation:[self attachPopUpAnimation] forKey:@"popup"];
}

- (void)dismissWithClickedButtonIndex:(NSInteger)index animated:(BOOL)animated
{
    if([self.delegate respondsToSelector:@selector(alertView:willDismissWithButtonIndex:)]) {
        [self.delegate alertView:self willDismissWithButtonIndex:index];
    }
    
    [UIView animateWithDuration:0.25f
                     animations:^{
                         [self setAlpha:0.0];
                     }
                     completion:^(BOOL finished) {
                         [self removeFromSuperview];
                         _visible = NO;
                         if([self.delegate respondsToSelector:@selector(alertView:didDismissWithButtonIndex:)]) {
                             [self.delegate alertView:self didDismissWithButtonIndex:index];
                         }
                     }];
}

#pragma mark - Setters

- (void)setTitle:(NSString *)title
{
    _title = [title copy];
    if (self.titleLabel) {
        [self.titleLabel setText:title];
    }
    if(self.isVisible) {
        [self setNeedsLayout];   
    }
}

- (void)setMessage:(NSString *)message
{
    _message = [message copy];
    if (self.messageLabel) {
        [self.messageLabel setText:message];
    }
    if(self.isVisible) {
        [self setNeedsLayout];
    }
}

#pragma mark - Getters

- (NSInteger)numberOfButtons
{
    return [self.buttons count];
}

- (NSString *)buttonTitleAtIndex:(NSInteger)index
{
    if (index == self.cancelButtonIndex) {
        return self.cancelButtonTitle;
    } else if(index >= self.firstOtherButtonIndex) {
        return [self.otherButtonTitles objectAtIndex:index];
    } else {
        return nil;
    }
}

#pragma mark - TTAlertView customization methods

- (void)setBackgroundImage:(UIImage *)image
{
    [self.dialogBackgroundView setImage:image];
}

- (void)setAlertContainerImage:(UIImage *)image
{
    [self.dialogContainerView setImage:image];
}

- (void)setButtonBackgroundImage:(UIImage *)image forState:(UIControlState)state atIndex:(NSUInteger)index
{
    [(UIButton *)[self.buttons objectAtIndex:index] setBackgroundImage:image forState:state];
    [(UIButton *)[self.buttons objectAtIndex:index] setBackgroundColor:[UIColor clearColor]];
    
    if ([self.buttonSizeStrings objectForKey:[NSNumber numberWithInteger:index]]) {
        [self.buttonSizeStrings removeObjectForKey:[NSNumber numberWithInteger:index]];
    }
}

- (void)setButtonImage:(UIImage *)image forState:(UIControlState)state withSize:(CGSize)size atIndex:(NSUInteger)index
{
    [self.buttonSizeStrings setObject:NSStringFromCGSize(size) forKey:[NSNumber numberWithInteger:index]];
    
    [(UIButton *)[self.buttons objectAtIndex:index] setImage:image forState:UIControlStateNormal];
    
    if(self.isVisible) {
        [self setNeedsLayout];
    }
}

#pragma mark - Buttons

- (void)addButtonWithTitle:(NSString *)title
{
    UIButton *otherButton = [[UIButton alloc] init];
    [otherButton setBackgroundColor:[UIColor blackColor]];
    [otherButton addTarget:self action:@selector(otherButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [otherButton setTitle:title forState:UIControlStateNormal];
    [self.dialogContainerView addSubview:otherButton];
    [self.buttons insertObject:otherButton atIndex:([self.buttons count] - 1) + self.firstOtherButtonIndex];
    
    if(self.isVisible) {
        [self setNeedsLayout];
    }
}

- (void)setupButtons
{
    if (self.cancelButtonTitle != nil) {
        _cancelButtonIndex = 0;
    } else {
        _cancelButtonIndex = -1;
    }
    
    if ([self.otherButtonTitles count] > 0) {
        _firstOtherButtonIndex = _cancelButtonIndex + 1;
    } else {
        _firstOtherButtonIndex = -1;
    }
    
    self.buttons = [NSMutableArray array];
    
    UIButton *cancelButton = [[UIButton alloc] init];
    [cancelButton setBackgroundColor:[UIColor blackColor]];
    [cancelButton addTarget:self action:@selector(cancelButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [cancelButton setTitle:self.cancelButtonTitle forState:UIControlStateNormal];
    [self.dialogContainerView addSubview:cancelButton];
    [self.buttons insertObject:cancelButton atIndex:_cancelButtonIndex];
    
    [self.otherButtonTitles enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [self addButtonWithTitle:(NSString *)obj];
    }];
    
}

#pragma mark - Layout helpers

- (void)layoutSubviews
{
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    
    [self layoutInWindow:window];
}

- (void)layoutInWindow:(UIWindow *)window
{
    [self setFrame:window.bounds];
    
    [self.dialogBackgroundView setFrame:self.bounds];
    
    // size title label
    CGFloat contentWidth = self.bounds.size.width - 2*kTTDialogLeftInset - 2*kTTDialogContentLeftInset;
    CGSize titleTextSize = [self.titleLabel.text sizeWithFont:self.titleLabel.font forWidth:contentWidth lineBreakMode:self.titleLabel.lineBreakMode];

    [self.titleLabel setFrame:(CGRect){ { kTTDialogContentLeftInset, kTTDialogContentTopInset}, { contentWidth, titleTextSize.height } }];
    
    // buttons (layed out from bottom up)
    CGFloat totalButtonHeight = 0.0f; // space from the top of the topmost button to the bottom of the bottom most button. Does not include message-button spacer or contentBottomInset
    CGFloat buttonWidth = 0.0f;
    if ([self.buttons count] > 2) {
        buttonWidth = contentWidth;
        totalButtonHeight = (kTTDialogContentButtonHeight * [self.buttons count]) + kTTDialogContentExtraButtonsVerticalSpacer + ([self.buttons count] - 2)*(kTTDialogContentBetweenButtonsVerticalSpacer);
    } else if ([self.buttons count] == 2) {
        buttonWidth = (CGFloat)( (contentWidth - kTTDialogContentButtonSpacer*MAX(0, [self.buttons count]-1)) / [self.buttons count] );
        totalButtonHeight = kTTDialogContentButtonHeight;
    } else {
        buttonWidth = contentWidth;
        totalButtonHeight = kTTDialogContentButtonHeight;
    }

    // max message size is (height of screen) - (min dialog vertical inset) - (content vertical inset) - (title height) - (content title-message spacer) - (content message-button spacer) - (button height) - (content vertical inset) - (min dialog vertical inset)
    CGFloat maxMessageHeight = self.bounds.size.height - kTTDialogMinVerticalInset - kTTDialogContentTopInset - titleTextSize.height - kTTDialogContentTitleMessageSpacer - kTTDialogContentMessageButtonSpacer - totalButtonHeight - kTTDialogContentBottomInset - kTTDialogMinVerticalInset;
    CGSize messageTextSize = [self.messageLabel.text sizeWithFont:self.messageLabel.font constrainedToSize:CGSizeMake(contentWidth, CGFLOAT_MAX) lineBreakMode:self.messageLabel.lineBreakMode];
    
    [self.messageLabel setFrame:(CGRect){ CGPointZero, { contentWidth, messageTextSize.height } }];
    [self.messageScrollView setFrame:(CGRect){ { kTTDialogContentLeftInset, kTTDialogContentTopInset + self.titleLabel.frame.size.height + kTTDialogContentTitleMessageSpacer }, { contentWidth, MIN( maxMessageHeight, messageTextSize.height ) } }];
    [self.messageScrollView setContentSize:messageTextSize];
    
    [self.buttons enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIButton *button = (UIButton *)obj;
        
        if([self.buttons count] > 2) {
            [button setFrame:(CGRect){ { kTTDialogContentLeftInset, kTTDialogContentTopInset + self.titleLabel.frame.size.height + kTTDialogContentTitleMessageSpacer + self.messageScrollView.frame.size.height + kTTDialogContentMessageButtonSpacer + totalButtonHeight - ((idx+1)*kTTDialogContentButtonHeight) - (idx > 0 ? kTTDialogContentExtraButtonsVerticalSpacer : 0) - (idx > 1 ? kTTDialogContentBetweenButtonsVerticalSpacer*(idx-1) : 0) }, { buttonWidth, kTTDialogContentButtonHeight } }];
        } else {
            [button setFrame:(CGRect){ { kTTDialogContentLeftInset + (idx * (buttonWidth+kTTDialogContentButtonSpacer)), kTTDialogContentTopInset + self.titleLabel.frame.size.height + kTTDialogContentTitleMessageSpacer + self.messageScrollView.frame.size.height + kTTDialogContentMessageButtonSpacer }, { buttonWidth, kTTDialogContentButtonHeight } }];
        }
    }];
    
    // finish sizing content view
    CGFloat dialogHeight = kTTDialogContentTopInset + self.titleLabel.frame.size.height + kTTDialogContentTitleMessageSpacer + self.messageScrollView.frame.size.height + kTTDialogContentMessageButtonSpacer + totalButtonHeight + kTTDialogContentBottomInset;
    [self.dialogContainerView setFrame:(CGRect){ { kTTDialogLeftInset, MAX(kTTDialogMinVerticalInset, self.frame.size.height/2 - dialogHeight/2) }, { self.bounds.size.width - 2*kTTDialogLeftInset, dialogHeight } }];
    
}

- (void)setupView
{   
    UIImageView *backgroundView = [[UIImageView alloc] init];
    [backgroundView setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:0.7]];
    [self addSubview:backgroundView];
    _dialogBackgroundView = backgroundView;
    
    UIImageView *dialogContainerView = [[UIImageView alloc] init];
    [dialogContainerView setBackgroundColor:[UIColor whiteColor]];
    [dialogContainerView setUserInteractionEnabled:YES];
    [self addSubview:dialogContainerView];
    _dialogContainerView = dialogContainerView;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    [titleLabel setTextColor:[UIColor blackColor]];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setText:self.title];
    [self.dialogContainerView addSubview:titleLabel];
    _titleLabel = titleLabel;
    
    UIScrollView *messageScrollView = [[UIScrollView alloc] init];
    [self.dialogContainerView addSubview:messageScrollView];
    _messageScrollView = messageScrollView;
    
    UILabel *messageLabel = [[UILabel alloc] init];
    [messageLabel setBackgroundColor:[UIColor clearColor]];
    [messageLabel setTextColor:[UIColor blackColor]];
    [messageLabel setTextAlignment:NSTextAlignmentCenter];
    [messageLabel setText:self.message];
    [messageLabel setNumberOfLines:0];
    [messageLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [self.messageScrollView addSubview:messageLabel];
    _messageLabel = messageLabel;
    
    [self setupButtons];

}

#pragma mark - Button action methods

- (void)cancelButtonAction:(id)sender
{
    [self dismissWithClickedButtonIndex:self.cancelButtonIndex animated:YES];
}

- (void)otherButtonAction:(id)sender
{
    [self dismissWithClickedButtonIndex:[self.buttons indexOfObject:sender] + self.firstOtherButtonIndex animated:YES];
}

@end
