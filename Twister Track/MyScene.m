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
@property (strong)NSArray* animationArray;
@end
@implementation MyScene
#define kShipSize CGSizeMake(30, 45)
#define kShipName @"ship"
-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
     
    }
    return self;
}
- (void)didMoveToView:(SKView *)view{
    self.motionManager = [[CMMotionManager alloc] init];
    [self.motionManager startAccelerometerUpdates];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
    }
    else {
        self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:CGRectMake(self.frame.origin.x +21, self.frame.origin.y, self.frame.size.width - 42, self.frame.size.height)];
    }
    
    self.physicsWorld.gravity = CGVectorMake(0, -5.0);
    self.physicsBody.friction = 0.3;
    [self setupShip];
    [self performSelector:@selector(setupAnimationArray) withObject:self afterDelay:5.0];


}
- (void)setupAnimationArray{
    SKTexture *texture1 = [SKTexture textureWithImageNamed:@"Track1"];
    SKTexture *texture2 = [SKTexture textureWithImageNamed:@"Track2"];
    SKTexture *texture3 = [SKTexture textureWithImageNamed:@"Track3"];
    SKTexture *texture4 = [SKTexture textureWithImageNamed:@"Track4"];
    SKTexture *texture5 = [SKTexture textureWithImageNamed:@"Track5"];
    SKTexture *texture6 = [SKTexture textureWithImageNamed:@"Track6"];
    SKTexture *texture7 = [SKTexture textureWithImageNamed:@"Track7"];
    SKTexture *texture8 = [SKTexture textureWithImageNamed:@"Track8"];
    SKTexture *texture9 = [SKTexture textureWithImageNamed:@"Track9"];
    SKTexture *texture10 = [SKTexture textureWithImageNamed:@"Track10"];
    SKTexture *texture11 = [SKTexture textureWithImageNamed:@"Track11"];
    SKTexture *texture12 = [SKTexture textureWithImageNamed:@"Track12"];
    SKTexture *texture13 = [SKTexture textureWithImageNamed:@"Track13"];
    SKTexture *texture14 = [SKTexture textureWithImageNamed:@"Track14"];
    SKTexture *texture15 = [SKTexture textureWithImageNamed:@"Track15"];
    SKTexture *texture16 = [SKTexture textureWithImageNamed:@"Track16"];
    SKTexture *texture17 = [SKTexture textureWithImageNamed:@"Track17"];
    SKTexture *texture18 = [SKTexture textureWithImageNamed:@"Track18"];
    SKTexture *texture19 = [SKTexture textureWithImageNamed:@"Track19"];
    SKTexture *texture20 = [SKTexture textureWithImageNamed:@"Track20"];
    SKTexture *texture21 = [SKTexture textureWithImageNamed:@"Track21"];
    SKTexture *texture22 = [SKTexture textureWithImageNamed:@"Track22"];
    SKTexture *texture23 = [SKTexture textureWithImageNamed:@"Track23"];
    SKTexture *texture24 = [SKTexture textureWithImageNamed:@"Track24"];
    SKTexture *texture25 = [SKTexture textureWithImageNamed:@"Track25"];
    SKTexture *texture26 = [SKTexture textureWithImageNamed:@"Track26"];
    SKTexture *texture27 = [SKTexture textureWithImageNamed:@"Track27"];
    SKTexture *texture28 = [SKTexture textureWithImageNamed:@"Track28"];
    SKTexture *texture29 = [SKTexture textureWithImageNamed:@"Track29"];
    SKTexture *texture30 = [SKTexture textureWithImageNamed:@"Track30"];
    self.animationArray = @[texture1, texture2, texture3, texture4, texture5, texture6, texture7, texture8, texture9, texture10, texture11, texture12,
                            texture13, texture14, texture15, texture16, texture17, texture18, texture19, texture20, texture21, texture22, texture23,
                            texture24, texture25, texture26, texture27, texture28, texture29, texture30
                            ];
        [self makeBackground];
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
    SKNode* ship = [SKSpriteNode spriteNodeWithImageNamed:@"RaceCar"];
    ship.name = kShipName;
    //1
    ship.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:ship.frame.size];
    //2
    ship.physicsBody.dynamic = YES;
    //3
    ship.physicsBody.affectedByGravity = NO;
    //4
    ship.physicsBody.mass = 0.02;
    ship.physicsBody.dynamic = YES;
    ship.physicsBody.allowsRotation = NO;
    ship.physicsBody.affectedByGravity = NO;
    ship.physicsBody.restitution = 0.325;
    ship.zPosition = 100;
    
    
    return ship;
}
-(void)processUserMotionForUpdate:(NSTimeInterval)currentTime {
    //1
    SKSpriteNode* ship = (SKSpriteNode*)[self childNodeWithName:kShipName];
    //2
    CMAccelerometerData* data = self.motionManager.accelerometerData;
    //3
    
        //4 How do you move the ship?
       [ship.physicsBody applyForce:CGVectorMake(30.0 * data.acceleration.x, 30.0 * data.acceleration.y)];
    ship.physicsBody.friction = 50.0;
    
    
}
- (void)makeBackground{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        {
            NSLog(@"R4");
            SKAction *animationOne = [SKAction animateWithTextures:self.animationArray timePerFrame:0.015];
            SKAction *animation = [SKAction repeatActionForever:animationOne];
            SKSpriteNode *pieceOne = [[SKSpriteNode alloc] initWithTexture:[SKTexture textureWithImageNamed:@"Track1"]];
            pieceOne.position = CGPointMake(CGRectGetMidX(self.frame), 30);
            SKSpriteNode *pieceTwo = [[SKSpriteNode alloc] initWithImageNamed:@"Track1"];
            pieceTwo.position = CGPointMake(CGRectGetMidX(self.frame), 90);
            SKSpriteNode *pieceThree = [[SKSpriteNode alloc] initWithImageNamed:@"Track1"];
            pieceThree.position = CGPointMake(CGRectGetMidX(self.frame), 150);
            SKSpriteNode *pieceFour = [[SKSpriteNode alloc] initWithImageNamed:@"Track1"];
            pieceFour.position = CGPointMake(CGRectGetMidX(self.frame), 210);
            SKSpriteNode *pieceFive = [[SKSpriteNode alloc] initWithImageNamed:@"Track1"];
            pieceFive.position = CGPointMake(CGRectGetMidX(self.frame), 270);
            SKSpriteNode *pieceSix = [[SKSpriteNode alloc] initWithImageNamed:@"Track1"];
            pieceSix.position = CGPointMake(CGRectGetMidX(self.frame), 330);
            SKSpriteNode *pieceSeven = [[SKSpriteNode alloc] initWithImageNamed:@"Track1"];
            pieceSeven.position = CGPointMake(CGRectGetMidX(self.frame), 390);
            SKSpriteNode *pieceEight = [[SKSpriteNode alloc] initWithImageNamed:@"Track1"];
            pieceEight.position = CGPointMake(CGRectGetMidX(self.frame), 450);
            SKSpriteNode *pieceNine = [[SKSpriteNode alloc] initWithImageNamed:@"Track1"];
            pieceNine.position = CGPointMake(CGRectGetMidX(self.frame), 510);
            SKSpriteNode *pieceTen = [[SKSpriteNode alloc] initWithImageNamed:@"Track1"];
            pieceTen.position = CGPointMake(CGRectGetMidX(self.frame), 570);
            
            [pieceOne runAction:animation];
            [pieceTwo runAction:animation];
            [pieceThree runAction:animation];
            [pieceFour runAction:animation];
            [pieceFive runAction:animation];
            [pieceSix runAction:animation];
            [pieceSeven runAction:animation];
            [pieceEight runAction:animation];
            [pieceNine runAction:animation];
            [pieceTen runAction:animation];
            
            [self addChild:pieceOne];
            [self addChild:pieceTwo];
            [self addChild:pieceThree];
            [self addChild:pieceFour];
            [self addChild:pieceFive];
            [self addChild:pieceSix];
            [self addChild:pieceSeven];
            [self addChild:pieceEight];
            [self addChild:pieceNine];
            [self addChild:pieceTen];
            
            
        }
    }
    else if (self.frame.size.height == 568) {
        NSLog(@"R4");
        SKAction *animationOne = [SKAction animateWithTextures:self.animationArray timePerFrame:0.015];
        SKAction *animation = [SKAction repeatActionForever:animationOne];
        SKSpriteNode *pieceOne = [[SKSpriteNode alloc] initWithTexture:[SKTexture textureWithImageNamed:@"Track1"]];
        pieceOne.position = CGPointMake(CGRectGetMidX(self.frame), 30);
        SKSpriteNode *pieceTwo = [[SKSpriteNode alloc] initWithImageNamed:@"Track1"];
        pieceTwo.position = CGPointMake(CGRectGetMidX(self.frame), 90);
        SKSpriteNode *pieceThree = [[SKSpriteNode alloc] initWithImageNamed:@"Track1"];
        pieceThree.position = CGPointMake(CGRectGetMidX(self.frame), 150);
        SKSpriteNode *pieceFour = [[SKSpriteNode alloc] initWithImageNamed:@"Track1"];
        pieceFour.position = CGPointMake(CGRectGetMidX(self.frame), 210);
        SKSpriteNode *pieceFive = [[SKSpriteNode alloc] initWithImageNamed:@"Track1"];
        pieceFive.position = CGPointMake(CGRectGetMidX(self.frame), 270);
        SKSpriteNode *pieceSix = [[SKSpriteNode alloc] initWithImageNamed:@"Track1"];
        pieceSix.position = CGPointMake(CGRectGetMidX(self.frame), 330);
        SKSpriteNode *pieceSeven = [[SKSpriteNode alloc] initWithImageNamed:@"Track1"];
        pieceSeven.position = CGPointMake(CGRectGetMidX(self.frame), 390);
        SKSpriteNode *pieceEight = [[SKSpriteNode alloc] initWithImageNamed:@"Track1"];
        pieceEight.position = CGPointMake(CGRectGetMidX(self.frame), 450);
        SKSpriteNode *pieceNine = [[SKSpriteNode alloc] initWithImageNamed:@"Track1"];
        pieceNine.position = CGPointMake(CGRectGetMidX(self.frame), 510);
        SKSpriteNode *pieceTen = [[SKSpriteNode alloc] initWithImageNamed:@"Track1"];
        pieceTen.position = CGPointMake(CGRectGetMidX(self.frame), 570);
        
        [pieceOne runAction:animation];
        [pieceTwo runAction:animation];
        [pieceThree runAction:animation];
        [pieceFour runAction:animation];
        [pieceFive runAction:animation];
        [pieceSix runAction:animation];
        [pieceSeven runAction:animation];
        [pieceEight runAction:animation];
        [pieceNine runAction:animation];
        [pieceTen runAction:animation];
        
        [self addChild:pieceOne];
        [self addChild:pieceTwo];
        [self addChild:pieceThree];
        [self addChild:pieceFour];
        [self addChild:pieceFive];
        [self addChild:pieceSix];
        [self addChild:pieceSeven];
        [self addChild:pieceEight];
        [self addChild:pieceNine];
        [self addChild:pieceTen];
        
 
    }
    else {
        SKAction *animation = [SKAction repeatActionForever:[SKAction animateWithTextures:self.animationArray timePerFrame:0.015]];
        SKSpriteNode *pieceOne = [[SKSpriteNode alloc] initWithImageNamed:@"Track1"];
        pieceOne.position = CGPointMake(CGRectGetMidX(self.frame), 30);
        SKSpriteNode *pieceTwo = [[SKSpriteNode alloc] initWithImageNamed:@"Track1"];
        pieceTwo.position = CGPointMake(CGRectGetMidX(self.frame), 90);
        SKSpriteNode *pieceThree = [[SKSpriteNode alloc] initWithImageNamed:@"Track1"];
        pieceThree.position = CGPointMake(CGRectGetMidX(self.frame), 150);
        SKSpriteNode *pieceFour = [[SKSpriteNode alloc] initWithImageNamed:@"Track1"];
        pieceFour.position = CGPointMake(CGRectGetMidX(self.frame), 210);
        SKSpriteNode *pieceFive = [[SKSpriteNode alloc] initWithImageNamed:@"Track1"];
        pieceFive.position = CGPointMake(CGRectGetMidX(self.frame), 270);
        SKSpriteNode *pieceSix = [[SKSpriteNode alloc] initWithImageNamed:@"Track1"];
        pieceSix.position = CGPointMake(CGRectGetMidX(self.frame), 330);
        SKSpriteNode *pieceSeven = [[SKSpriteNode alloc] initWithImageNamed:@"Track1"];
        pieceSeven.position = CGPointMake(CGRectGetMidX(self.frame), 390);
        SKSpriteNode *pieceEight = [[SKSpriteNode alloc] initWithImageNamed:@"Track1"];
        pieceEight.position = CGPointMake(CGRectGetMidX(self.frame), 450);

        [pieceOne runAction:animation];
        [pieceTwo runAction:animation];
        [pieceThree runAction:animation];
        [pieceFour runAction:animation];
        [pieceFive runAction:animation];
        [pieceSix runAction:animation];
        [pieceSeven runAction:animation];
        [pieceEight runAction:animation];
        
        [self addChild:pieceOne];
        [self addChild:pieceTwo];
        [self addChild:pieceThree];
        [self addChild:pieceFour];
        [self addChild:pieceFive];
        [self addChild:pieceSix];
        [self addChild:pieceSeven];
        [self addChild:pieceEight];
        

     
    }
}
@end
