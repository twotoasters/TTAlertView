//
//  TTAlertView.h
//  TTAlertView
//
//  Created by Duncan Lewis on 10/12/12.
//  Copyright (c) 2012 Two Toasters. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TTAlertViewActionHandler)(NSInteger index);

@protocol TTAlertViewDelegate;

@interface TTAlertView : UIView
{}

#pragma mark - UIAlertView properties

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, weak) id<TTAlertViewDelegate> delegate;
@property (nonatomic, readonly, getter = isVisible) BOOL visible;
@property (nonatomic, readonly) NSInteger cancelButtonIndex;
@property (nonatomic, readonly) NSInteger firstOtherButtonIndex;
@property (nonatomic, readonly) NSInteger numberOfButtons;

#pragma mark - TTAlertView properties

@property (nonatomic, copy) TTAlertViewActionHandler buttonActionHandler;

@property (nonatomic, readonly) UIImageView *backgroundView; // by default, the darkened background displayed behind the alert
@property (nonatomic, readonly) UIImageView *containerView; // the background of the alert view
@property (nonatomic, readonly) UILabel *titleLabel;
@property (nonatomic, readonly) UILabel *messageLabel;

/**
 * Insets for the content area and the button area sized inside of the container view
 */
@property (nonatomic, assign) UIEdgeInsets contentInsets; // insets for the content area (title and message portion of the alert view)
@property (nonatomic, assign) UIEdgeInsets buttonInsets; // insets for the button area (all of the buttons layed out by the alert view)

/**
 * Insets for the container (view that contains the content view and the buttons). The minimum vertical inset describes the minimum ammount of space from top and bottom of the superview
 * that the container view can be sized in - this means at the container view's maximum size, it will be spaced the minimum vertical inset from the top and bottom of its superview.
 */
@property (nonatomic, assign) CGFloat containerLeftInset;
@property (nonatomic, assign) CGFloat containerRightInset;
@property (nonatomic, assign) CGFloat containerMinVerticalInset;
@property (nonatomic, assign) CGFloat containerVerticalOffset;

@property (nonatomic, assign) CGFloat contentTitleMessageSpacer; // space between the title label and the message label in the default layout
@property (nonatomic, assign) CGFloat buttonVerticalSpacerFirst; // the vertical distance between the first and second button in the #buttons > 2 vertical layout
@property (nonatomic, assign) CGFloat buttonVerticalSpacer; // the vertical distance between the buttons in the #buttons > 2 vertical layout
@property (nonatomic, assign) CGFloat buttonHorizontalSpacer; // the horizontal space between buttons

#pragma mark - UIAlertView methods

- (id)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...;
- (void)show;
- (void)dismissWithClickedButtonIndex:(NSInteger)index animated:(BOOL)animated;
- (void)addButtonWithTitle:(NSString *)title;
- (NSString *)buttonTitleAtIndex:(NSInteger)index;

#pragma mark - TTAlertView methods

/**
 * Set the background image for the button at a given index.
 * This is intended to be used with the button title text and a resizable image.
 */
- (void)setButtonBackgroundImage:(UIImage *)image forState:(UIControlState)state atIndex:(NSUInteger)index;

/**
 *
 */
- (void)setButtonBackgroundImage:(UIImage *)image forState:(UIControlState)state withSize:(CGSize)size atIndex:(NSUInteger)index;

/**
 * Set the button image for the button at a given index, with a given size
 * This is intended to be used for button images which have the text baked in, or for buttons with non-repeatable textures. It can also be used to force particular buttons to layout with a different size. It is the responsibility of the developer to not specify button sizes larger than the alert view can display
 */
- (void)setButtonImage:(UIImage *)image forState:(UIControlState)state withSize:(CGSize)size atIndex:(NSUInteger)index;

/**
 * Retrieve the button at the given index to allow for further customization. Changes to the button's frame may result in unexpected layout behavior.
 */
- (UIButton *)buttonAtIndex:(NSUInteger)index;

@end

#pragma mark - 

/**
 * TTAlertViewDelegate 
 * Mainly mimicks UIAlertViewDelegate methods
 */
@protocol TTAlertViewDelegate <NSObject>

@optional

// Called when a button is clicked. The view will be automatically dismissed after this call returns
- (void)alertView:(TTAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;

- (void)willPresentAlertView:(TTAlertView *)alertView;  // before animation and showing view
- (void)didPresentAlertView:(TTAlertView *)alertView;  // after animation

- (void)alertViewCancel:(TTAlertView *)alertView;
- (void)alertView:(TTAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex; // before animation and hiding view
- (void)alertView:(TTAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex;  // after animation

- (BOOL)alertViewShouldEnableFirstOtherButton:(TTAlertView *)alertView;

@end
