//
//  ADSpaceCatNode.m
//  Space Cat
//
//  Created by Aleem Dhanji on 08-18-14.
//  Copyright (c) 2014 Aleem Dhanji. All rights reserved.
//

#import "ADSpaceCatNode.h"

@interface ADSpaceCatNode ()
@property (nonatomic) SKAction *tapAction;
@end

@implementation ADSpaceCatNode

+ (instancetype) spaceCatAtPosition:(CGPoint)position {
    ADSpaceCatNode *spaceCat = [self spriteNodeWithImageNamed:@"spacecat_1"];
    spaceCat.position = position;
    spaceCat.anchorPoint = CGPointMake(0.5, 0);
    spaceCat.name = @"SpaceCat";
    
    return spaceCat;
}

- (void) performTap {
    [self runAction:self.tapAction];
}

- (SKAction *) tapAction {
    if (_tapAction != nil) {
        return _tapAction;
    }
    
    NSArray *textures = @[[SKTexture textureWithImageNamed:@"spacecat_2"],
                          [SKTexture textureWithImageNamed:@"spacecat_1"]];
    _tapAction = [SKAction animateWithTextures:textures timePerFrame:0.20];
    
    return _tapAction;
}

@end
