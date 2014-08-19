//
//  ADProjectileNode.m
//  Space Cat
//
//  Created by Aleem Dhanji on 08-18-14.
//  Copyright (c) 2014 Aleem Dhanji. All rights reserved.
//

#import "ADProjectileNode.h"
#import "ADUtil.h"

@implementation ADProjectileNode

+ (instancetype) projectileAtPosition:(CGPoint)position {
    ADProjectileNode *projectile = [self spriteNodeWithImageNamed:@"projectile_1"];
    projectile.position = position;
    projectile.name = @"Projectile";
    [projectile setupAnimation];
    
    return projectile;
}

- (void) setupAnimation {
    NSArray *textures = @[[SKTexture textureWithImageNamed:@"projectile_1"],
                          [SKTexture textureWithImageNamed:@"projectile_2"],
                          [SKTexture textureWithImageNamed:@"projectile_3"]];
    SKAction *animation = [SKAction animateWithTextures:textures timePerFrame:0.1];
    SKAction *repeatAction = [SKAction repeatActionForever:animation];
    [self runAction:repeatAction];
}

- (void) moveTowardsPosition:(CGPoint)position {
    // slope = (y3 - y1) / (x3 - x1)
    float slope = (position.y - self.position.y) / (position.x - self.position.x);
    // y2 = slope * x2 - slope * x1 + y1
    
    float offscreenX;
    // determine which side of screen player touched
    if (position.x <= self.position.x) { // player touched left side of screen
        offscreenX = -10;
    } else { // player touched right side of screen
        offscreenX = self.parent.frame.size.width + 10; // parent of projectile is screen
    }
    
    float offscreenY = slope * offscreenX - slope * self.position.x + self.position.y;
    CGPoint pointOffscreen = CGPointMake(offscreenX, offscreenY);
    
    float distanceA = pointOffscreen.y - self.position.y;
    float distanceB = pointOffscreen.x - self.position.x;
    float distanceC = sqrtf(powf(distanceA, 2) + powf(distanceB, 2)); // distance projectile travels
    
    // time = distance / speed
    
    float time = distanceC / AD_PROJECTILE_SPEED;
    float waitToFade = time * 0.75;
    float fadeTime = time - waitToFade;
    
    SKAction *moveProjectile = [SKAction moveTo:pointOffscreen duration:time];
    [self runAction:moveProjectile];
    
    NSArray *sequence = @[[SKAction waitForDuration:waitToFade],
                          [SKAction fadeOutWithDuration:fadeTime],
                          [SKAction removeFromParent]];
    [self runAction:[SKAction sequence:sequence]];
}

@end