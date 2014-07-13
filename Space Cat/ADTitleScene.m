//
//  ADTitleScene.m
//  Space Cat
//
//  Created by Aleem Dhanji on 07-10-14.
//  Copyright (c) 2014 Aleem Dhanji. All rights reserved.
//

#import "ADTitleScene.h"
#import "ADGamePlayScene.h"

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

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    ADGamePlayScene *gamePlayScene = [ADGamePlayScene sceneWithSize:self.frame.size];
    SKTransition *transition = [SKTransition fadeWithDuration:1.0];
    [self.view presentScene:gamePlayScene transition:transition];
}


@end
