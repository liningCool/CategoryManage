//
//  NSString+Ext.h
//  Treasure
//
//  Created by xiayiyong on 15/7/1.
//  Copyright (c) 2015年 Zealer. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

/*!
 * 对NSString有用的扩展类
 * 
 * @author huangyibiao
 */
@interface NSString (ZLExt)

/**
*  去掉左边的空格
*
*  @return 处理后的字符串
*/
- (NSString *)trimLeft;

/**
 *  去掉右边的空格
 *
 *  @return 处理后的字符串
 */
- (NSString *)trimRight;

/**
 *  去掉两边的空格
 *
 *  @return 处理后的字符串
 */
- (NSString *)trim;

/**
 *  去掉所有空格
 *
 *  @return 处理后的字符串
 */
- (NSString *)trimAll;

/**
 *  去掉所有字母
 *
 *  @return 处理后的字符串
 */
- (NSString *)trimLetters;

/**
 *  去掉字符中中所有的指定的字符
 *
 *  @param character 指定的字符串
 *
 *  @return 处理后的字符串
 */
- (NSString *)trimCharacter:(unichar)character;

/**
 *  去掉两端的空格
 *
 *  @return 处理后的字符串
 */
- (NSString *)trimWhitespace;

/**
 *  计算行数
 *
 *  @return 返回行数
 */
- (NSUInteger)numberOfLines;

/*!
 * @brief 判断是否是空串
 *
 * @return YES表示是空串，NO表示非空
 */
- (BOOL)isEmpty;

/**
 *  判断去掉两边的空格后是否是空串
 *
 *  @return YES表示是空串，NO表示非空
 */
- (BOOL)isTrimEmpty;

/**
 @brief     是否符合最小长度、最长长度，是否包含中文,首字母是否可以为数字
 @param     minLenth 账号最小长度
 @param     maxLenth 账号最长长度
 @param     containChinese 是否包含中文
 @param     firstCannotBeDigtal 首字母不能为数字
 @return    正则验证成功返回YES, 否则返回NO
 */
- (BOOL)isValidWithMinLenth:(NSInteger)minLenth
                   maxLenth:(NSInteger)maxLenth
             containChinese:(BOOL)containChinese
        firstCannotBeDigtal:(BOOL)firstCannotBeDigtal;

/**
 @brief     是否符合最小长度、最长长度，是否包含中文,数字，字母，其他字符，首字母是否可以为数字
 @param     minLenth 账号最小长度
 @param     maxLenth 账号最长长度
 @param     containChinese 是否包含中文
 @param     containDigtal   包含数字
 @param     containLetter   包含字母
 @param     containOtherCharacter   其他字符
 @param     firstCannotBeDigtal 首字母不能为数字
 @return    正则验证成功返回YES, 否则返回NO
 */
- (BOOL)isValidWithMinLenth:(NSInteger)minLenth
                   maxLenth:(NSInteger)maxLenth
             containChinese:(BOOL)containChinese
              containDigtal:(BOOL)containDigtal
              containLetter:(BOOL)containLetter
      containOtherCharacter:(NSString *)containOtherCharacter
        firstCannotBeDigtal:(BOOL)firstCannotBeDigtal;

/** 去掉两端空格和换行符 */
- (NSString *)stringByTrimmingBlank;

/*!
 * 添加前缀（不修改self）
 *
 * @param prefix-前缀
 * @param 返回添加后的字符串
 */
- (NSString *)addPrefix:(NSString *)prefix;

/**
 *  添加后缀（不修改self）
 *
 *  @param subfix 后缀
 *
 *  @return 返回添加后的字符串
 */
- (NSString *)addSubfix:(NSString *)subfix;

/**
 *  从指定文件名读取文件内容
 *
 *  @param fileName 文件名，需要带文件类型，如:abc.json
 *
 *  @return 文件内容
 */
//+ (NSString *)contentsOfFile:(NSString *)fileName;

/**
 *  读取指定文件名中的字符，并序列化为NSDictionary或NSArray
 *
 *  @param fileName 文件名，需要带文件类型，如:abc.json
 *
 *  @return NSDictionary或NSArra对象
 */
+ (id)jsonDataFromFileName:(NSString *)fileName;

/**
 十进制转换为二进制
 
 @param decimal 十进制数
 @return 二进制数
 */
+ (NSString *)getBinaryByDecimal:(NSInteger)decimal;

/**
 十进制转换十六进制
 
 @param decimal 十进制数
 @return 十六进制数
 */
+ (NSString *)getHexByDecimal:(NSInteger)decimal;

/**
 二进制转换成十六进制
 
 @param binary 二进制数
 @return 十六进制数
 */
+ (NSString *)getHexByBinary:(NSString *)binary;

/**
 十六进制转换为二进制
 
 @param hex 十六进制数
 @return 二进制数
 */
+ (NSString *)getBinaryByHex:(NSString *)hex;

/**
 二进制转换为十进制
 
 @param binary 二进制数
 @return 十进制数
 */
+ (NSInteger)getDecimalByBinary:(NSString *)binary;

/**
 十六进制转换为字符串
 
 @param binary 二进制数
 @return 十六进制字符串
 */
+ (NSString *)hexStringFromData:(NSData*)data;

//去掉字符串的换行符号
+(NSString *)removeSpaceAndNewline:(NSString *)str;

// 检查字符串是否包含emoji表情
- (BOOL)containsEmoji;

+ (BOOL)stringContainsEmoji:(NSString *)string;

+ (NSInteger)getStringLengthWithString:(NSString *)string;

/**
 *  3、相关可设置属性对照

 NSFontAttributeName ：字体字号
 value值：UIFont类型
 NSParagraphStyleAttributeName ： 段落样式
 value值：NSParagraphStyle类型（其属性如下）
 lineSpacing 行间距(具体用法可查看上面的设置行间距API)
 paragraphSpacing 段落间距
 alignment 对齐方式
 firstLineHeadIndent 指定段落开始的缩进像素
 headIndent 调整全部文字的缩进像素
 NSForegroundColorAttributeName 字体颜色
 value值：UIColor类型
 NSBackgroundColorAttributeName 背景颜色
 value值：UIColor类型
 NSObliquenessAttributeName 字体粗倾斜
 value值：NSNumber类型
 NSExpansionAttributeName 字体加粗
 value值：NSNumber类型(比例) 0就是不变 1增加一倍
 NSKernAttributeName 字间距
 value值：CGFloat类型
 NSUnderlineStyleAttributeName 下划线
 value值：1或0
 NSUnderlineColorAttributeName 下划线颜色
 value值：UIColor类型
 NSStrikethroughStyleAttributeName 删除线
 value值：1或0
 NSStrikethroughColorAttributeName 删除线颜色
 value值：UIColor类型
 NSStrokeColorAttributeName 字体颜色
 value值：UIColor类型
 NSStrokeWidthAttributeName 字体描边
 value值：CGFloat
 NSLigatureAttributeName 连笔字
 value值：1或0
 NSShadowAttributeName 阴影
 value值：NSShawdow类型（下面是其属性）
 shadowOffset 影子与字符串的偏移量
 shadowBlurRadius 影子的模糊程度
 shadowColor 影子的颜色
 NSTextEffectAttributeName 设置文本特殊效果,目前只有图版印刷效果可用
 value值：NSString类型
 NSAttachmentAttributeName 设置文本附件
 value值：NSTextAttachment类型（没研究过，可自行百度研究）
 NSLinkAttributeName 链接
 value值：NSURL (preferred) or NSString类型
 NSBaselineOffsetAttributeName 基准线偏移
 value值：NSNumber类型
 NSWritingDirectionAttributeName 文字方向 分别代表不同的文字出现方向
 value值：@[@(1),@(2)]
 NSVerticalGlyphFormAttributeName 水平或者竖直文本 在iOS没卵用，不支持竖版
 value值：1竖直 0水平
 */

/**
 *  单纯改变一句话中的某些字的颜色（一种颜色）
 *
 *  @param color    需要改变成的颜色
 *  @param totalStr 总的字符串
 *  @param subArray 需要改变颜色的文字数组(要是有相同的 只取第一个)
 *
 *  @return 生成的富文本
 */
+ (NSMutableAttributedString *)zl_changeCorlorWithColor:(UIColor *)color TotalString:(NSString *)totalStr SubStringArray:(NSArray *)subArray;

/**
 *  单纯改变一句话中的某些字的字体（一种字体）
 *
 *  @param color    需要改变成的字体
 *  @param totalStr 总的字符串
 *  @param subArray 需要改变字体的文字数组(要是有相同的 只取第一个)
 *
 *  @return 生成的富文本
 */
+ (NSMutableAttributedString *)zl_changeFontWithFont:(UIFont *)font TotalString:(NSString *)totalStr SubStringArray:(NSArray *)subArray;

/**
 *  单纯改变句子的字间距（需要 <CoreText/CoreText.h>）
 *
 *  @param totalString 需要更改的字符串
 *  @param space       字间距
 *
 *  @return 生成的富文本
 */
+ (NSMutableAttributedString *)zl_changeSpaceWithTotalString:(NSString *)totalString Space:(CGFloat)space;

/**
 *  单纯改变段落的行间距
 *
 *  @param totalString 需要更改的字符串
 *  @param lineSpace   行间距
 *
 *  @return 生成的富文本
 */
+ (NSMutableAttributedString *)zl_changeLineSpaceWithTotalString:(NSString *)totalString LineSpace:(CGFloat)lineSpace;

/**
 *  改变段落的行间距并且结尾....
 *
 *  @param totalString 需要更改的字符串
 *  @param lineSpace   行间距
 *
 *  @return 生成的富文本
 */
+ (NSMutableAttributedString *)zl_changeLineSpaceAndTruncatingTailWithTotalString:(NSString *)totalString LineSpace:(CGFloat)lineSpace;

/**
 *  同时更改行间距和字间距
 *
 *  @param totalString 需要改变的字符串
 *  @param lineSpace   行间距
 *  @param textSpace   字间距
 *
 *  @return 生成的富文本
 */
+ (NSMutableAttributedString *)zl_changeLineAndTextSpaceWithTotalString:(NSString *)totalString LineSpace:(CGFloat)lineSpace textSpace:(CGFloat)textSpace;
/**
 *  改变某些文字的颜色 并单独设置其字体
 *
 *  @param font        设置的字体
 *  @param color       颜色
 *  @param totalString 总的字符串
 *  @param subArray    想要变色的字符数组
 *
 *  @return 生成的富文本
 */
+ (NSMutableAttributedString *)zl_changeFontAndColor:(UIFont *)font Color:(UIColor *)color TotalString:(NSString *)totalString SubStringArray:(NSArray *)subArray;

/**
 *  为某些文字改为链接形式
 *
 *  @param totalString 总的字符串
 *  @param subArray    需要改变颜色的文字数组(要是有相同的 只取第一个)
 *
 *  @return 生成的富文本
 */
+ (NSMutableAttributedString *)zl_addLinkWithTotalString:(NSString *)totalString SubStringArray:(NSArray *)subArray;


/**
 改变字符串某些字符字体大小

 @param originFont 字符串字体大小
 @param font 需改变的某些字符的字体
 @param totalStr 总字符串
 @param subArray 子字符串
 @return NSMutableAttributedString
 */
+ (NSMutableAttributedString *)zl_OriginStringFont:(UIFont *)originFont  zl_changeFontWithFont:(UIFont *)font TotalString:(NSString *)totalStr SubStringArray:(NSArray *)subArray;

+ (BOOL)isInputRuleAndBlank:(NSString *)str;

+ (NSString *)replaceImageHtml:(NSString *)oldHtml;

+ (NSString *)getMMSSFromSS:(NSString *)totalTime;

+ (NSString *)contentTypeWithImageData: (NSData *)data;

///判断是否空的字符串
-(BOOL)isBlankString;

@end
