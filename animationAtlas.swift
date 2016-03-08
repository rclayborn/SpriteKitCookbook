//
//  GameScene.swift
//  AtlasAnimationExample
//
//  Created by Randall Clayborn on 3/7/16.
//  Copyright (c) 2016 claybear39. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {

    let textureAtlas = SKTextureAtlas(named:"BearImages.atlas")
    var spriteArray = Array<SKTexture>()
    var bearSprite = SKSpriteNode()

    override func didMoveToView(view: SKView) {
        
            view.scene!.anchorPoint = CGPoint(x: 0.5,y: 0.5)
            
            spriteArray.append(textureAtlas.textureNamed("bear1.png"));
            spriteArray.append(textureAtlas.textureNamed("bear2.png"));
            spriteArray.append(textureAtlas.textureNamed("bear3.png"));
            spriteArray.append(textureAtlas.textureNamed("bear4.png"));
            spriteArray.append(textureAtlas.textureNamed("bear5.png"));
            spriteArray.append(textureAtlas.textureNamed("bear6.png"));
            spriteArray.append(textureAtlas.textureNamed("bear7.png"));
            spriteArray.append(textureAtlas.textureNamed("bear8.png"));
        
            bearSprite = SKSpriteNode(texture:spriteArray[0])
        
            bearSprite.position = CGPoint(x:view.bounds.width/2, y:0)
            bearSprite.xScale = 0.5;
            bearSprite.yScale = 0.5;
        
            addChild(self.bearSprite);
        
            let animateAction = SKAction.animateWithTextures(self.spriteArray, timePerFrame: 0.2)//speed of walk animation
            let repeatAction = SKAction.repeatActionForever(animateAction);
            self.bearSprite.runAction(repeatAction)
        
            let moveAction = SKAction.moveToX(-view.bounds.width - 100, duration: 8.0)//duration time it takes to complete
            self.bearSprite.runAction(moveAction)

        }
        
    override func update(currentTime: NSTimeInterval) {
          
        }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {

    }
   
}
