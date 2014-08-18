//
//  ADMachineNode.m
//  Space Cat
//
//  Created by Aleem Dhanji on 08-18-14.
//  Copyright (c) 2014 Aleem Dhanji. All rights reserved.
//

#import "ADMachineNode.h"

@implementation ADMachineNode

+ (instancetype) machineAtPosition:(CGPoint)position {
    ADMachineNode *machine = [self spriteNodeWithImageNamed:@"machine_1"];
    machine.position = position;
    machine.anchorPoint = CGPointMake(0.5, 0);
    
    NSArray *textures = @[[SKTexture textureWithImageNamed:@"machine_1"],
                          [SKTexture textureWithImageNamed:@"machine_2"]];
    
    SKAction *machineAnimation = [SKAction animateWithTextures:textures timePerFrame:0.2];
    SKAction *machineRepeat = [SKAction repeatActionForever:machineAnimation];
    [machine runAction:machineRepeat];
    
    return machine;
}
@end
