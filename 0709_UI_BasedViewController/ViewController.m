//
//  ViewController.m
//  0709_UI_BasedViewController
//
//  Created by rimi on 15/7/9.
//  Copyright (c) 2015年 周林. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"

static NSString * const context = @"乔布斯是改变世界的天才，他凭敏锐的触觉和过人的智慧，勇于变革，不断创新，引领全球"
"资讯科技和电子产品的潮流，把电脑和电子产品不断变得简约化、平民化，让曾经是昂贵稀"
"罕的电子产品变为现代人生活的一部分。";

@interface ViewController () <UITextFieldDelegate>

{
    UITextField * _textField;
    UILabel * _textLable;
}
/**
 *  初始化用户界面
 */
- (void) initializeUserInterface;

/**
 *  计算文本标签大小(自适应)
 *
 *  @param context      显示文本
 *  @param constainWith 最大宽度约束
 *  @param font         字体
 *
 *  @return 自适应后的大小(宽度和高度)
 */
- (CGSize) sizeWithContext : (NSString *) context constainWitdth : (CGFloat) constainWith font : (UIFont *) font;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeUserInterface];
}

- (void)initializeUserInterface {
    
    self.view.backgroundColor = [UIColor whiteColor];
#pragma mark - Button
    /* 按钮 : lightButton*/
    UIButton * lightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    lightButton.bounds = CGRectMake(0, 0, 40, 40);
    lightButton.center = CGPointMake(40, 50);
//    [lightButton setTitle:@"普通" forState:UIControlStateNormal];
//    [lightButton setTitle:@"高亮" forState:UIControlStateHighlighted];
//    [lightButton setTitle:@"选中" forState:UIControlStateSelected];
//    [lightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    // png可不加后缀,背景图片在后边
    // 普通状态为关灯
    [lightButton setBackgroundImage:[UIImage imageNamed:@"关灯"] forState:UIControlStateNormal];
    [lightButton setImage:[UIImage imageNamed:@"开灯"] forState:UIControlStateSelected];
    [lightButton addTarget:self action:@selector(respondsToButton:) forControlEvents:UIControlEventTouchUpInside];
    
    // 设置前景色(模板色)
    lightButton.tintColor = [UIColor redColor];
    
//    // setImage默认加在左边
//    [lightButton setImage:[UIImage imageNamed:@"关灯"] forState:UIControlStateNormal];
    
    // 设置按钮是否选中
//    lightButton.selected = YES;
    
    [self.view addSubview:lightButton];
    
    /* 按钮: nextButton*/
    UIButton * nextButton = [UIButton buttonWithType:UIButtonTypeSystem];
    nextButton.bounds = CGRectMake(0, 0, 60, 40);
    nextButton.center = CGPointMake(330, 50);
    [nextButton setTitle:@"下一页" forState:UIControlStateNormal];
    [nextButton addTarget:self action:@selector(respondsToButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextButton];
   
    
#pragma mark - UITextField
    /* UITextField : 文本输入框*/
    _textField = [[UITextField alloc]init];
    _textField.bounds = CGRectMake(0, 0, 220, 30);
    _textField.center = CGPointMake(CGRectGetMidX(self.view.bounds), 80);
    // 设置圆角
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    // 设置占位符
    _textField.placeholder = @"请输入账号……";
    // 设置清除的模式
    _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    // 设置安全输入模式
    _textField.secureTextEntry = YES;
    // 设置键盘样式
    _textField.keyboardType = UIKeyboardTypeDefault;
    // 设置return键样式
    _textField.returnKeyType = UIReturnKeyDone;
    // 设置代理
    _textField.delegate = self;
    [self.view addSubview:_textField];
    
    
    
#pragma mark - UILable
    _textLable = [[UILabel alloc]init];
    _textLable.bounds = CGRectMake(0, 0, 150, 200);
    _textLable.center = CGPointMake(CGRectGetMidX(self.view.bounds) - CGRectGetMidX(_textField.bounds) + 10, CGRectGetMidY(self.view.bounds));
    _textLable.backgroundColor = [UIColor yellowColor];
    _textLable.text = context;
    // 设置显示行数，0表示不限制行数
    _textLable.numberOfLines = 0;
    
    // 设置边框宽度
    _textLable.layer.borderWidth = 0.5;
    
    // 设置边框颜色
    _textLable.layer.borderColor = [[UIColor blackColor] CGColor];
    
    // 自适应方法
    // 1.
//    [textLable sizeToFit];
    
    // 2.
    UIFont * font = [UIFont systemFontOfSize:17];
    CGSize size = [self sizeWithContext:context constainWitdth:150 font:font];
    UILabel * rightLable = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMidX(self.view.bounds) + 30, CGRectGetMinY(_textLable.frame), size.width, size.height)];
    
//    rightLable.bounds = CGRectMake(0, 0, size.width, size.height);
    
    rightLable.backgroundColor = [UIColor yellowColor];
    rightLable.text = context;
    // 设置显示行数，0表示不限制行数
    rightLable.numberOfLines = 0;
    
    // 设置边框宽度
    rightLable.layer.borderWidth = 0.5;
    
    // 设置边框颜色
    rightLable.layer.borderColor = [[UIColor blackColor] CGColor];

    
    
    [self.view addSubview:rightLable];
    
    [self.view addSubview:_textLable];
    
}

#pragma mark - responds event

- (void) respondsToButton : (UIButton *) sender {
    
    
    if ([sender.currentTitle isEqualToString:@"下一页"]) {
        // 处理nextButton事件
        
        NextViewController * next_vc = [[NextViewController alloc]init];
        
        // 设置动画效果,系统自带四种动画效果, 课后自行脑补
        [next_vc setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
        [self presentViewController:next_vc animated:YES completion:nil];
    } else {
        // 处理lightButtton事件
        sender.selected = !sender.selected;
        self.view.backgroundColor = sender.selected ? [UIColor darkGrayColor] : [UIColor whiteColor];
    }
}

#pragma mark - <UITextFieldDelegate>

- (void)textFieldDidBeginEditing:(UITextField *)textField {

    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

// 可做输入判断
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    // 限制字符串长度
    if (textField.text.length > 9) {
        return NO;
    }
    
    // 判断输入字符是否合法
    if ([textField.text isEqualToString:@"*"]) {
        return NO;
    }
    return YES;
}

// 是否允许开始编辑
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return YES;
}

// 是否允许结束编辑
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    
    return YES;
}

// 是否响应return键
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    // 失去第一响应，收起键盘
    [textField resignFirstResponder];
    [self updateLableContext];
    return YES;
}

#pragma mark - responds touch
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    // 按屏幕收起键盘
    [self.view endEditing:YES];
    [self updateLableContext];
    
}

#pragma mark - private methods

// 刷新文本标签显示
- (void) updateLableContext {
    
    _textLable.text = _textField.text;
}


- (CGSize)sizeWithContext:(NSString *)context constainWitdth:(CGFloat)constainWith font:(UIFont *)font {
    CGSize size = CGSizeZero;
    // 计算大小
    CGRect rect =  [context boundingRectWithSize:CGSizeMake(constainWith, 1000) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil];
    
    size = rect.size;
    
    return size;
}
@end
