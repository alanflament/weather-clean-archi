#import "LoadingViewCell.h"

@interface LoadingViewCell ()

@property(nonatomic, strong) UIActivityIndicatorView *activity;

@end

@implementation LoadingViewCell

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        self.activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [self.activity startAnimating];
        [self.activity setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:self.activity];

        [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                         attribute:NSLayoutAttributeCenterX
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.activity
                                                         attribute:NSLayoutAttributeCenterX
                                                        multiplier:1.0
                                                          constant:0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                         attribute:NSLayoutAttributeCenterY
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self.activity
                                                         attribute:NSLayoutAttributeCenterY
                                                        multiplier:1.0
                                                          constant:0]];
    }
    return self;
}

- (void)stopLoading {
    [self.activity stopAnimating];
    [self.activity hidesWhenStopped];
}

- (void)startLoading {
    [self.activity startAnimating];
}

@end
