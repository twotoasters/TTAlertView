//
//  TTAlertView.h
//  TTAlertView
//
//  Created by Duncan Lewis on 10/12/12.
//  Copyright (c) 2012 Two Toasters. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TTAlertViewDelegate;

@interface TTAlertView : UIView

// normal UIAlertView methods
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, weak) id<TTAlertViewDelegate> delegate;
@property (nonatomic, readonly, getter = isVisible) BOOL visible;
@property (nonatomic, readonly) NSInteger cancelButtonIndex;
@property (nonatomic, readonly) NSInteger firstOtherButtonIndex;
@property (nonatomic, readonly) NSInteger numberOfButtons;

- (id)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...;
- (void)show;
- (void)dismissWithClickedButtonIndex:(NSInteger)index animated:(BOOL)animated;
- (void)addButtonWithTitle:(NSString *)title;
- (NSString *)buttonTitleAtIndex:(NSInteger)index;

// TTAlertView properties and methods exposed for customization

@property (nonatomic, readonly) UIImageView *backgroundView; // by default, the darkened background displayed behind the alert
@property (nonatomic, readonly) UIImageView *containerView; // the background of the alert view
@property (nonatomic, readonly) UILabel *titleLabel;
@property (nonatomic, readonly) UILabel *messageLabel;

/**
 * Set the background image for the button at a given index 
 * This is intended to be used with the button title text and a resizable image
 */
- (void)setButtonBackgroundImage:(UIImage *)image forState:(UIControlState)state atIndex:(NSUInteger)index;

/**
 * Set the button image for the button at a given index, with a given size
 * This is intended to be used for button images which have the text baked in, or for buttons with non-repeatable textures. It can also be used to force particular buttons to layout with a different size
 */
- (void)setButtonImage:(UIImage *)image forState:(UIControlState)state withSize:(CGSize)size atIndex:(NSUInteger)index;

@end

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
