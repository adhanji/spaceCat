//
//  ADGamePlayScene.m
//  Space Cat
//
//  Created by Aleem Dhanji on 07-12-14.
//  Copyright (c) 2014 Aleem Dhanji. All rights reserved.
//

#import "ADGamePlayScene.h"

@implementation ADGamePlayScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"background_1"];
        background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        [self addChild:background];
        
        SKSpriteNode *machine = [SKSpriteNode spriteNodeWithImageNamed:@"machine_1"];
        machine.position = CGPointMake(CGRectGetMidX(self.frame), 12);
        machine.anchorPoint = CGPointMake(0.5, 0);
        [self addChild:machine];
    }
    return self;
}

- (void) update:(NSTimeInterval)currentTime {
    NSLog(@"%f", fmod(currentTime, 60));
}

@end
