//
//  STPAddSourceViewController.h
//  Runner
//
//  Created by Jonas Bark on 06.11.17.
//  Copyright © 2017 The Chromium Authors. All rights reserved.
//

#import <Stripe/Stripe.h>

@class STPAddSourceViewController;
@protocol STPAddPaymentMethodViewControllerDelegate;

@interface STPAddSourceViewController : STPAddCardViewController

@property (nonatomic, weak, nullable) id<STPAddPaymentMethodViewControllerDelegate> srcDelegate;

@end

/**
 An `STPAddCardViewControllerDelegate` is notified when an `STPAddCardViewController` successfully creates a card token or is cancelled. It has internal error-handling logic, so there's no error case to deal with.
 */
@protocol STPAddPaymentMethodViewControllerDelegate <NSObject>

/**
 Called when the user cancels adding a card. You should dismiss (or pop) the view controller at this point.
 
 @param addCardViewController the view controller that has been cancelled
 */
- (void)addCardViewControllerDidCancel:(STPAddSourceViewController *)addCardViewController;

- (void)addCardViewControllerDidCreateToken:(STPAddSourceViewController *)addCardViewController                                                 didCreateToken:(nonnull STPToken *)token
                                 completion:(nonnull STPErrorBlock)completion;
@end
