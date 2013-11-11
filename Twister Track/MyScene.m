//
//  MyScene.m
//  Twister Track
//
//  Created by Andrew Paterson on 11/6/13.
//  Copyright (c) 2013 Karl Paterson. All rights reserved.
//

#import "MyScene.h"
#import <CoreMotion/CoreMotion.h>
@interface MyScene ()
@property (strong) CMMotionManager* motionManager;

@end
@implementation MyScene
#define kShipSize CGSizeMake(30, 16)
#define kShipName @"ship"
-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        self.motionManager = [[CMMotionManager alloc] init];
        [self.motionManager startAccelerometerUpdates];
        self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
       [self setupShip];
    }
    return self;
}



-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    [self processUserMotionForUpdate:currentTime];
}
-(void)setupShip {
    //1
    SKNode* ship = [self makeShip];
    //2
    ship.position = CGPointMake(self.size.width / 2.0f, kShipSize.height/2.0f);
    [self addChild:ship];
}

-(SKNode*)makeShip {
    SKNode* ship = [SKSpriteNode spriteNodeWithColor:[SKColor greenColor] size:kShipSize];
    ship.name = kShipName;
    //1
    ship.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:ship.frame.size];
    //2
    ship.physicsBody.dynamic = YES;
    //3
    ship.physicsBody.affectedByGravity = NO;
    //4
    ship.physicsBody.mass = 0.02;
    return ship;
}
-(void)processUserMotionForUpdate:(NSTimeInterval)currentTime {
    //1
    SKSpriteNode* ship = (SKSpriteNode*)[self childNodeWithName:kShipName];
    //2
    CMAccelerometerData* data = self.motionManager.accelerometerData;
    //3
    if (fabs(data.acceleration.x) > 0.2) {
        //4 How do you move the ship?
       [ship.physicsBody applyForce:CGVectorMake(40.0 * data.acceleration.x, 0)];
    }
}
@end
