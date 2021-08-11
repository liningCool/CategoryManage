//
//  UIFont+ZLEditLine.m
//  Zealer_zaaap!
//
//  Created by leihuiwu on 2020/2/16.
//  Copyright © 2020 Zealer_zaaap!. All rights reserved.
//

#import "UIFont+ZLEditLine.h"


@implementation UIFont (ZLEditLine)

+ (instancetype)fontWithCustomFont:(UIFont *)font bold:(BOOL)bold italic:(BOOL)italic {
    UIFontDescriptor *existingDescriptor = [font fontDescriptor];
    UIFontDescriptorSymbolicTraits traits = existingDescriptor.symbolicTraits;
    if (bold) {
        traits |= UIFontDescriptorTraitBold;
    }
    if (italic) {
        traits |= UIFontDescriptorTraitItalic;
    }
    UIFontDescriptor *descriptor = [existingDescriptor fontDescriptorWithSymbolicTraits:traits];
    return [UIFont fontWithDescriptor:descriptor size:font.fontSize];
}

- (BOOL)bold {
    return self.fontDescriptor.symbolicTraits & UIFontDescriptorTraitBold;
}

- (BOOL)italic {
    return self.fontDescriptor.symbolicTraits & UIFontDescriptorTraitItalic;
}

- (float)fontSize {
    return [self.fontDescriptor.fontAttributes[@"NSFontSizeAttribute"] floatValue];
}


@end
