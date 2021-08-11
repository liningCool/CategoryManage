//
//  UITextView+ZLPlaceholder.m
//  Zealer_zaaap!
//
//  Created by leihuiwu on 2019/11/12.
//  Copyright © 2019 Zealer_zaaap!. All rights reserved.
//

#import "UITextView+ZLPlaceholder.h"

#import <objc/runtime.h>

char textViewplaceholderFontKey;

@implementation UITextView (ZLPlaceholder)

#pragma mark - Swizzle Dealloc

+ (void)load
{
    [super load];
    
    // is this the best solution?
    method_exchangeImplementations(class_getInstanceMethod(self.class, NSSelectorFromString(@"dealloc")),
                                   class_getInstanceMethod(self.class, @selector(swizzledDealloc)));
}

- (void)swizzledDealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    UILabel *label = objc_getAssociatedObject(self, @selector(placeholderLabel));
    
    if (label)
    {
        for (NSString *key in self.class.observingKeys)
        {
            @try
            {
                [self removeObserver:self forKeyPath:key];
            }
            @catch (NSException *exception)
            {
                // Do nothing
            }
        }
    }
    
    [self swizzledDealloc];
}

#pragma mark - `observingKeys`

+ (NSArray *)observingKeys {
    
    return @[
             @"attributedText",
             @"bounds",
             @"font",
             @"frame",
             @"text",
             @"textAlignment",
             @"textContainerInset"
             ];
}


#pragma mark - Properties
#pragma mark `placeholderLabel`



- (UILabel *)placeholderLabel
{
    UILabel *label = objc_getAssociatedObject(self, @selector(placeholderLabel));
    
    if (!label)
    {
        NSAttributedString *originalText = self.attributedText;
        self.text = @" ";
        self.attributedText = originalText;
        
        label = [[UILabel alloc] init];
        label.textColor = [UIColor lightGrayColor];
        label.font=[UIFont systemFontOfSize:14];
        label.numberOfLines = 0;
        label.userInteractionEnabled = NO;
        objc_setAssociatedObject(self, @selector(placeholderLabel), label, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(updatePlaceholderLabel)
                                                     name:UITextViewTextDidChangeNotification
                                                   object:self];
        
        for (NSString *key in self.class.observingKeys)
        {
            [self addObserver:self
                   forKeyPath:key
                      options:NSKeyValueObservingOptionNew
                      context:nil];
        }
    }
    
    return label;
}

#pragma mark `placeholder`

- (NSString *)placeholder
{
    return self.placeholderLabel.text;
}

- (void)setPlaceholder:(NSString *)placeholder
{
    self.placeholderLabel.textAlignment = self.textAlignment;
    self.placeholderLabel.text = placeholder;
}

#pragma mark `placeholderColor`

- (UIColor *)placeholderColor
{
    return self.placeholderLabel.textColor;
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    self.placeholderLabel.textColor = placeholderColor;
}

#pragma mark `placeholderFont`

- (UIFont *)placeholderFont
{
//    return self.placeholderLabel.font;
    return objc_getAssociatedObject(self, &textViewplaceholderFontKey);
}

- (void)setPlaceholderFont:(UIFont *)placeholderFont
{
    objc_setAssociatedObject(self, &textViewplaceholderFontKey, placeholderFont, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    [self updatePlaceholderLabel];
}

#pragma mark - Update

- (void)updatePlaceholderLabel
{
    self.placeholderLabel.hidden = self.hasText;
    
    if (self.text.length)
    {
        [self.placeholderLabel removeFromSuperview];
        
        return;
    }
    
    [self insertSubview:self.placeholderLabel atIndex:0];
    
    self.placeholderLabel.font          = self.placeholderFont ? self.placeholderFont : self.font;;
    self.placeholderLabel.textAlignment = self.textAlignment;
    
    CGFloat lineFragmentPadding = self.textContainer.lineFragmentPadding;;
    UIEdgeInsets textContainerInset = self.textContainerInset;;
    
    
    CGFloat x = lineFragmentPadding + textContainerInset.left;
    CGFloat y = textContainerInset.top;
    
    CGFloat width = CGRectGetWidth(self.bounds) - x - lineFragmentPadding - textContainerInset.right;
    CGFloat height = [self.placeholderLabel sizeThatFits:CGSizeMake(width, 0)].height;
    
    self.placeholderLabel.frame = CGRectMake(x, y, width, height);
}


@end
