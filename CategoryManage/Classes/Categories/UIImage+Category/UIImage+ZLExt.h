//
//  UIImage+ZLExt.h
//  Zealer_zaaap!
//
//  Created by leihuiwu on 2019/11/23.
//  Copyright © 2019 Zealer_zaaap!. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <float.h>
#import <Accelerate/Accelerate.h>

@interface UIImage (ZLExt)

/**
 *  根据颜色来设置image
 *
 *  @param color 颜色
 *
 *  @return 设置好的image
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 *  根据颜色和尺寸返回
 *
 *  @param color 颜色
 *  @param size  image的尺寸
 *
 *  @return 设置好的image
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 *  根据尺寸裁剪image
 *
 *  @param rect 裁剪的尺寸
 *
 *  @return 设置好的image
 */
- (UIImage *)crop:(CGRect)rect;
- (UIImage *)toDiamondOne;
- (UIImage *)ToHeightWidthScale:(CGFloat)Scale;

/**
 *  重新设置设置image的尺寸
 *
 *  @param dstSize 自定义的尺寸
 *
 *  @return 设置好的image
 */
- (UIImage *)resizedImageToSize:(CGSize)dstSize;

/**
 *  按照比例尺寸来设置image
 *
 *  @param boundingSize 尺寸大小
 *  @param scale        比例大小
 *
 *  @return 设置好的image
 */
- (UIImage *)resizedImageToFitInSize:(CGSize)boundingSize scaleIfSmaller:(BOOL)scale;

- (UIImage *)imageByApplyingAlpha:(CGFloat)alpha;
/**
 * 把图片转换成base64编码的字符串
 */
- (NSString *)toBase64;

/*!
 * @brief 根据指定的Rect来截取图片，返回截取后的图片
 * @param rect 指定的Rect，如果大小超过图片大小，就会返回原图片
 * @return 返回截取后的图片
 */
- (UIImage *)subImageWithRect:(CGRect)rect;

/*!
 * @brief 把图片等比例缩放到指定的size
 * @param size 缩放后的图片的大小
 * @return 返回缩放后的图片
 */
- (UIImage *)scaleToSize:(CGSize)size;

/*!
 * @brief 根据指定的模式来压缩图片
 * @param contentMode 压缩模式
 * @param bounds      压缩到bounds
 * @param quality     压缩质量
 */
- (UIImage *)resizedImageWithContentMode:(UIViewContentMode)contentMode
                                  bounds:(CGSize)bounds
                    interpolationQuality:(CGInterpolationQuality)quality;

/*!
 * @brief 自动调整图片到目标大小
 * @param destImageSize 目标图片大小，单位是MB
 * @param quality     压缩质量
 */
- (UIImage *)resizedImageWithUncompressedSizeInMB:(CGFloat)destImageSize
                             interpolationQuality:(CGInterpolationQuality)quality;
/**
 *  将image缩放到目标最大尺寸
 *
 *  @param sourceImage 目标图片
 *
 *  @return 缩放后的图片
 */
- (UIImage *)imageByScalingToMaxSize:(UIImage *)sourceImage;

/**
 *  将image缩放裁剪到指定尺寸
 *
 *  @param sourceImage 目标image
 *  @param targetSize  指定尺寸
 *
 *  @return 处理后的image
 */
- (UIImage *)imageByScalingAndCroppingForSourceImage:(UIImage *)sourceImage targetSize:(CGSize)targetSize;


/**
 * 来自ImageEffects的方法，添加Lighblur等效果
 */
- (UIImage *)applyLightEffect;

/**
 *  添加较浅的高斯效果
 *
 */
- (UIImage *)applyExtraLightEffect;

/**
 *  添加深色的高斯效果
 *
 */
- (UIImage *)applyDarkEffect;

/**
 *  添加指定颜色的高斯效果
 *
 */
- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor;

/**
 *  添加指定圆角颜色背景的高斯效果
 *
 */
- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius
                       tintColor:(UIColor *)tintColor
           saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                       maskImage:(UIImage *)maskImage;

/**
 * 来自BlurredFrame的方法，添加部分高斯等效果
 */
- (UIImage *)applyLightEffectAtFrame:(CGRect)frame;

/**
 * 来自BlurredFrame的方法，添加部分ExtraLight高斯效果
 */
- (UIImage *)applyExtraLightEffectAtFrame:(CGRect)frame;

/**
 * 来自BlurredFrame的方法，添加部分DarkEffec高斯效果
 */
- (UIImage *)applyDarkEffectAtFrame:(CGRect)frame;

/**
 * 来自BlurredFrame的方法，添加部指定颜色高斯等效果
 */
- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor atFrame:(CGRect)frame;

/**
 * 来自BlurredFrame的方法，添加部指定颜色圆角背景的高斯等效果
 */

- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius
                       tintColor:(UIColor *)tintColor
           saturationDeltaFactor:(CGFloat)saturationDeltaFactor
                       maskImage:(UIImage *)maskImage
                         atFrame:(CGRect)frame;

- (UIImage*)gaussBlur:(CGFloat)blurRadius;
/**
 *  抓取屏幕。
 *  @param  scale:屏幕放大倍数，1为原尺寸。
 *  return  屏幕后的Image。
 */
+ (UIImage *)captureScreenWithScale:(CGFloat)scale;
+(UIImage *)imageWithOriginImage:(UIImage *)orginImg AndTargetRect:(CGRect)cropRect;
/**
 *  抓取UIView及其子类。
 *  @param  view: UIView及其子类。
 *  @param  scale:屏幕放大倍数，1为原尺寸。
 *  return  抓取图片后的Image。
 */
+ (UIImage *)captureImageWithView:(UIView *)view scale:(CGFloat)scale;

/**
 *  合并两个Image。
 *  @param  image1、image2: 两张图片。
 *  @param  frame1、frame2:两张图片放置的位置。
 *  @param  size:返回图片的尺寸。
 *  return  合并后的两个图片的Image。
 */
+ (UIImage *)mergeWithImage1:(UIImage *)image1 image2:(UIImage *)image2 frame1:(CGRect)frame1 frame2:(CGRect)frame2 size:(CGSize)size;

+ (UIImage *)mergeNewMeathWithBorderImage:(UIImage*)image1 SourceImg:(UIImage *)image2 frame1:(CGRect)frame1 frame2:(CGRect)frame2 size:(CGSize)size;
/**
 *  把一个Image盖在另一个Image上面。
 *  @param  image: 底图。
 *  @param  mask:盖在上面的图。
 *  return  Image。
 */
+ (UIImage *)maskImage:(UIImage *)image withMask:(UIImage *)mask;

/**
 *  把一个Image尺寸缩放到另一个尺寸。
 *  @param  view: UIView及其子类。
 *  @param  scale:屏幕放大倍数，1为原尺寸。
 *  return  尺寸更改后的Image。
 */
+ (UIImage *)scaleImage:(UIImage *)image toSize:(CGSize)size;

/**
 *  改变一个Image的色彩。
 *  @param  image: 被改变的Image。
 *  @param  color: 要改变的目标色彩。
 *  return  色彩更改后的Image。
 */
+(UIImage *)colorizeImage:(UIImage *)image withColor:(UIColor *)color;

/**
 *  按frame裁减图片
 *
 */
+ (UIImage *)captureView:(UIView *)view frame:(CGRect)frame;

/**
 *
 * 截取图片的指定区域
 */
- (UIImage *)imageAtRect:(CGRect)rect;
- (UIImage *)cropImage:(UIImage*)image toRect:(CGRect)rect;
- (UIImage *)imageCropFixOrientation;
/**
 *  将图片缩放到制定尺寸
 *
 *  @param targetSize 目标尺寸
 *
 *  @return 返回缩放后的图片
 */
- (UIImage *)imageByScalingToSize:(CGSize)targetSize;

/**
 *  旋转图片指定弧度
 *
 *  @param radians 弧度
 *
 *  @return 返回旋转后的图片
 */
- (UIImage *)imageRotatedByRadians:(CGFloat)radians;

/**
 *  旋转图片指定度数
 *
 *  @param degrees 要旋转的度数
 *
 *  @return 返回旋转后的图片
 */
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;

- (UIImage *)drawCircleImage;
- (UIImage *)addBlackGroundForVideoWithSize:(CGSize)size;
+ (UIImage *)videoHandlePhoto:(NSURL *)url;
+ (UIImage *)image:(UIImage *)image rotation:(UIImageOrientation)orientation;

#pragma mark - 截屏
+ (UIImage *)imageFromViewWithView:(UIView *)view;


+ (UIImage *)fixOrientation:(UIImage *)aImage ;


/// 水印功能
+(UIImage *) image:(UIImage *)image water:(NSString *)logo text:(NSString *)txt;

@end


