//
//  GameScene.swift
//  SpriteKitTouchCoor
//
//  Created by Randall Clayborn on 3/21/16.
//  Copyright (c) 2016 claybear39. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
        var xCoordLabel = SKLabelNode()
        var yCoordLabel = SKLabelNode()
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Move X Label to Touch"
        myLabel.fontSize = 30
        myLabel.alpha = 0.5
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame) + 90)
        self.addChild(myLabel)
        
        xCoordLabel = SKLabelNode(fontNamed: "copperPlate")
        xCoordLabel.text = "X"
        xCoordLabel.position = CGPointMake(self.size.width * 0.5, self.size.height * 0.8)
        xCoordLabel.fontSize = 100
        xCoordLabel.alpha = 1.0
        xCoordLabel.zPosition = 12
        addChild(xCoordLabel)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        // Capture the touch event.
        let touch = touches.first
        
        // Get the position that was touched (a.k.a. ending point).
        let touchPosition = touch!.locationInNode(self)
        
        // Get sprite's current position (a.k.a. starting point).
        let currentPosition = xCoordLabel.position
        
        // Calculate the angle using the relative positions of the sprite and touch.
        let angle = atan2(currentPosition.y - touchPosition.y, currentPosition.x - touchPosition.x)
        
        // Define actions for the ship to take.
        let rotateAction = SKAction.rotateToAngle(angle + CGFloat(M_PI*0.5), duration: 0.0)
        let moveAction = SKAction.moveTo(touchPosition, duration: 0.5)
        
        // Tell the ship to execute actions.
        xCoordLabel.runAction(SKAction.sequence([rotateAction, moveAction]))
        
    }
    
}
