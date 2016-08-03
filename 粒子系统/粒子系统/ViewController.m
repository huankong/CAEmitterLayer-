//
//  ViewController.m
//  粒子系统
//
//  Created by ldy on 16/4/28.
//  Copyright © 2016年 ldy. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController ()
{
    CAEmitterLayer *_emitterLayer;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //单个粒子的原型，UIKit根据这个发射粒子和定义的基础上创建一个随机粒子。此原型包括一些属性来控制粒子的图片，颜色，方向，运动，缩放比例和生命周期。
//    CAEmitterCell *emitterCell = [CAEmitterCell emitterCell];
//    //一个粒子的颜色alpha能改变的范围
//    emitterCell.alphaRange = 0.5;
//    //粒子透明度在生命周期内的改变速度
//    emitterCell.alphaSpeed = -0.5;
//    //粒子参数的速度乘数因子，每秒发射的粒子数量
//    emitterCell.birthRate = 800;
//    //一个粒子的颜色blue,green,red能改变的范围
//    emitterCell.blueRange = 1;
//    emitterCell.greenRange = 1;
//    emitterCell.redRange = 1;
////    //一个粒子blue,green,red在生命周期内改变的速度
////    emitterCell.blueSpeed = 1;
////    emitterCell.greenSpeed = 1;
////    emitterCell.redSpeed = 1;
//    //粒子的颜色
//    emitterCell.color = [UIColor colorWithRed:1 green:0.8 blue:0.1 alpha:0.1].CGColor;;
//    //粒子要展现的图片，CGImageRef类型，否则不显示
//    emitterCell.contents = (id)[UIImage imageNamed:@"DazFire.png"].CGImage;
//    //渲染的范围
////    emitterCell.contentsRect = CGRectMake(0, 0, 1, 1);
//    //发射Z轴方向的发射角度
////    emitterCell.emissionLatitude = M_PI_2;
//    //粒子在xy平面的发射角度
//    emitterCell.emissionLongitude = M_PI + M_PI_2;
////    //粒子发射角度的容差
//    emitterCell.emissionRange = M_PI_2;
//    //粒子发射的粒子
////    emitterCell.emitterCells = @[];
//    //粒子是否允许发射器渲染
////    emitterCell.enabled = YES;
//    //粒子生存时间
//    emitterCell.lifetime = 2;
//    //粒子生存时间范围，设置之后 lifetime +/-= lifetimeRange
//    emitterCell.lifetimeRange = 1.5;
//    //增加,减小自己的大小
////    emitterCell.magnificationFilter = @"";
////    emitterCell.minificationFilter = @"";
////    //减少大小的因子
////    emitterCell.minificationFilterBias = 0;
//    //粒子的名字
//    emitterCell.name = @"funncy";
//    //粒子缩放大小
////    emitterCell.scale = 1;
//////    //粒子缩放范围
//    emitterCell.scaleRange = 0.3;
//////    //粒子缩放速度
////    emitterCell.scaleSpeed = 0.4;
////    //旋转角度
////    emitterCell.spin = 0.2;
////    //旋转角度范围
////    emitterCell.spinRange = 1;
//    //粒子的速度
//    emitterCell.velocity = 160;
//    //粒子速度范围
//    emitterCell.velocityRange = 80;
    //粒子在x,y,x方向的加速度
//    emitterCell.xAcceleration = 1;
//    emitterCell.yAcceleration = 1;
//    emitterCell.zAcceleration = 1;
    
    //火焰
    CAEmitterCell* fire = [CAEmitterCell emitterCell];
    [fire setName:@"fire"];
    
    fire.birthRate			= 500;
    fire.emissionLongitude  = M_PI;
    fire.velocity			= -80;
    fire.velocityRange		= 30;
    fire.emissionRange		= 1.1;
    fire.yAcceleration		= -200;
    fire.scaleSpeed			= 0.3;
    fire.lifetime			= 1;
    fire.lifetimeRange		= 0.35;
    
    fire.color = [[UIColor colorWithRed:0.8 green:0.4 blue:0.2 alpha:0.1] CGColor];
    fire.contents = (id) [[UIImage imageNamed:@"DazFire"] CGImage];
    
    //烟雾
    CAEmitterCell* smoke = [CAEmitterCell emitterCell];
    [smoke setName:@"smoke"];
    
    smoke.birthRate			= 11;
    smoke.lifetime			= 4;
    smoke.velocity			= -40;
    smoke.velocityRange		= 20;
    smoke.emissionRange		= M_PI / 4;
    smoke.spinRange			= 6;
    smoke.yAcceleration		= -160;
    smoke.contents			= (id) [[UIImage imageNamed:@"DazSmoke"] CGImage];
    smoke.scale				= 0.1;
    smoke.alphaSpeed		= -0.12;
    smoke.scaleSpeed		= 0.7;
    smoke.color = [[UIColor colorWithWhite:0.5 alpha:0.3]CGColor];
//    _fireEmitter.emitterCells=[NSArray arrayWithObjects:smoke,fire,nil];
//    [self.view.layer addSublayer:_fireEmitter];

    //由很多emitterCell组成的发射层，控制粒子的形状，发射位置，提供了一个粒子发射器系统为核心的动画
    _emitterLayer = [CAEmitterLayer layer];
    //装着CAEmitterCell对象的粒子单元数组，被用于把粒子投放到layer上
    _emitterLayer.emitterCells = @[fire,smoke];
    //发射器在xy平面的中心位置
    _emitterLayer.emitterPosition = CGPointMake(self.view.frame.size.width/2.0, self.view.frame.size.height - 60);
    //发射器的Z平面位置
//        _emitterLayer.emitterZPosition = 0;
    //发射器的尺寸大小
    _emitterLayer.emitterSize = CGSizeMake(50, 0);
    //发射模式
    /*
     kCAEmitterLayerPoints      从发射器中发出
     kCAEmitterLayerOutline     从发射器边缘发出
     kCAEmitterLayerSurface     从发射器表面发出
     kCAEmitterLayerVolume      从发射器中点发出
     */
//    _emitterLayer.emitterMode = kCAEmitterLayerOutline;
    //发射器的形状
    /*
     kCAEmitterLayerPoint   点的形状，粒子从一个点出发
     kCAEmitterLayerLine    线的形状，粒子从一条线出发
     kCAEmitterLayerRectangle   矩形形状，粒子从一个矩形出发
     kCAEmitterLayerCuboid      立方体形状，会影响Z平面的效果
     kCAEmitterLayerCircle      圆形，粒子会在圆形范围发射
     kCAEmitterLayerSphere      球形
     */
    _emitterLayer.emitterShape = kCAEmitterLayerLine;
    
    //渲染模式
    /*
     kCAEmitterLayerUnordered      这种模式下，粒子是无序出现的，多个发射源将混合
     kCAEmitterLayerOldestFirst    这种模式下，生命久的粒子会被渲染在最上层
     kCAEmitterLayerOldestLast     这种模式下，年轻的粒子会被渲染在最上层
     kCAEmitterLayerBackToFront    这种模式下，粒子的渲染按照Z轴的前后顺序进行
     kCAEmitterLayerAdditive       这种模式会进行粒子混合
     */
    _emitterLayer.renderMode = kCAEmitterLayerAdditive;
//    //是否开启三维空间效果
//    _emitterLayer.preservesDepth = YES;
//    //粒子产生速度 默认为1.0
//    _emitterLayer.birthRate = 5;
//    //发射器的深度，在某些模式下会产生立体效果
//    _emitterLayer.emitterDepth = 1;
//    //粒子存活时间，默认为1s
//    _emitterLayer.lifetime = 2;
//    //粒子的缩放大小
//    _emitterLayer.scale = 0.5;
////    //用于初始化随机数产生的粒子
//    _emitterLayer.seed = 2;
//    //粒子的旋转位置
//    _emitterLayer.spin = 10;
//    //粒子的运动速度
//    _emitterLayer.velocity = 5;
    [self.view.layer addSublayer:_emitterLayer];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
