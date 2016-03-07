//
//  GameScene.swift
//  ninjaAnimation
//
//  Created by Randall Clayborn on 3/5/16.
//  Copyright (c) 2016 claybear39. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    //let textureAtlas = SKTextureAtlas(named: "bikerAll.atlas")
    //var spriteArray = Array<SKTexture>()
    //let player =
    var walkCharacter = SKSpriteNode(imageNamed: "walk1.png")
    var standingCharacter = SKSpriteNode(imageNamed: "idle.png")
    var characterAnimation = SKAction()
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello Ninja!"
        myLabel.fontSize = 45
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        self.addChild(myLabel)
   
        ninjaIdle()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        standingCharacter.removeFromParent()
        walking()
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        walkCharacter.removeAllActions()
        walkCharacter.removeFromParent()
        ninjaIdle()
  
    }
        func ninjaIdle() {
        standingCharacter.position = CGPointMake(self.size.width * 0.4, self.size.height * 0.45)
        standingCharacter.xScale = 1.0
        standingCharacter.yScale = 1.0
        addChild(standingCharacter)

    }
    
    func walking() {
        standingCharacter.removeAllChildren()
        walkCharacter.position = CGPointMake(self.size.width * 0.4, self.size.height * 0.45)
        walkCharacter.xScale = 1.0
        walkCharacter.yScale = 1.0
        addChild(walkCharacter)
        
        var textures:[SKTexture] = []
        
        for i in 1...4 {
            textures.append(SKTexture(imageNamed: "walk\(i)"))
        }
        textures.append(textures[1])
        textures.append(textures[2])
        textures.append(textures[3])
        textures.append(textures[4])
        
        characterAnimation = SKAction.repeatActionForever( SKAction.animateWithTextures(textures, timePerFrame: 0.2))
          walkCharacter.runAction(SKAction.repeatActionForever(characterAnimation))
    }

    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
