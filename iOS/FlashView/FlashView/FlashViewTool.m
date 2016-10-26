/*
 copyright 2016 wanghongyu.
 The project page：https://github.com/hardman/FlashAnimationToMobile
 My blog page: http://blog.csdn.net/hard_man/
 */

#import "FlashViewTool.h"


@interface FlashViewTool()
@property (nonatomic, strong) NSMutableDictionary<NSString*, UIImage *> *images;
@end

@implementation FlashViewTool

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.scale = CGPointMake(1, 1);
        self.isUseImplicitAnim = YES;
        self.implicitAnimDuration = 1.0 / 30;
    }
    return self;
}

-(NSMutableDictionary<NSString *,UIImage *> *)images{
    if (!_images) {
        _images = [[NSMutableDictionary alloc] init];
    }
    return _images;
}

-(void) addImage:(UIImage *)image withName:(NSString *)name{
    if (self.images[name]) {
        return;
    }
    self.images[name] = image;
}

-(void) replaceImage:(UIImage *)image withName:(NSString *)name{
    self.images[name] = image;
}

-(UIImage *) imageWithName:(NSString *) name{
    UIImage * image = self.images[name];
    if (!image) {
        image = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@", self.imagePath, name]];
        [self addImage:image withName:name];
    }
    return image;
}

@end
