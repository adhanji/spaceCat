//
//  ADGamePlayScene.m
//  Space Cat
//
//  Created by Aleem Dhanji on 07-12-14.
//  Copyright (c) 2014 Aleem Dhanji. All rights reserved.
//

#import "ADGamePlayScene.h"
#import "ADMachineNode.h"
#import "ADSpaceCatNode.h"
#import "ADProjectileNode.h"

@implementation ADGamePlayScene

-(id)initWithSize:(CGSize)size {
    if (self == [super initWithSize:size]) {
        /* Setup your scene here */
        
        SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"background_1"];
        background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        [self addChild:background];
        
        ADMachineNode *machine = [ADMachineNode machineAtPosition:CGPointMake(CGRectGetMidX(self.frame), 12)];
        [self addChild:machine];
        
        ADSpaceCatNode *spaceCat = [ADSpaceCatNode spaceCatAtPosition:CGPointMake(machine.position.x, machine.position.y - 2)];
        [self addChild:spaceCat];
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint position = [touch locationInNode:self]; // return x & y coords of touch in the scene
        [self shootProjectileTowardsPosition:position];
    }
}

- (void) shootProjectileTowardsPosition:(CGPoint)position {
    ADSpaceCatNode *spaceCat = (ADSpaceCatNode*) [self childNodeWithName:@"SpaceCat"];
    [spaceCat performTap]; // animate space cat pressing button
    
    ADMachineNode *machine = (ADMachineNode*) [self childNodeWithName:@"Machine"];
    
    ADProjectileNode *projectile = [ADProjectileNode projectileAtPosition:CGPointMake(machine.position.x,
                                                                                      machine.position.y + machine.frame.size.height - 15)];
    [self addChild:projectile];
    [projectile moveTowardsPosition:position];
}

@end
