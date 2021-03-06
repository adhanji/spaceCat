//
//  ADProjectileNode.h
//  Space Cat
//
//  Created by Aleem Dhanji on 08-18-14.
//  Copyright (c) 2014 Aleem Dhanji. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface ADProjectileNode : SKSpriteNode

+ (instancetype) projectileAtPosition:(CGPoint)position;
- (void) moveTowardsPosition:(CGPoint)position;

@end
