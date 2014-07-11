//
//  ADTitleScene.m
//  Space Cat
//
//  Created by Aleem Dhanji on 07-10-14.
//  Copyright (c) 2014 Aleem Dhanji. All rights reserved.
//

#import "ADTitleScene.h"

@implementation ADTitleScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"splash_1"];
        background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        [self addChild:background];
        
    }
    return self;
}


@end
