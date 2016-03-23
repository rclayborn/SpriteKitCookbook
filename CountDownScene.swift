//
//  CouontdownScene.swift
//  CountDownToGame
//
//  Created by Randall Clayborn on 12/16/14.
//  Copyright (c) 2014 claybear39. All rights reserved.
//

import SpriteKit

class CountdownScene: SKScene {
    
    var timer = NSTimer()
    var seconds = Int()
    var secondsLabel = SKLabelNode()
    
    override func didMoveToView(view: SKView) {
        
        seconds = 0
        
        secondsLabel = SKLabelNode(fontNamed:"CopperPlate")
        secondsLabel.fontSize = 165;
        secondsLabel.fontColor = SKColor.greenColor()
        secondsLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        self.addChild(secondsLabel)
        
       
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target:self, selector: #selector(GameScene.countup), userInfo: nil, repeats: true)
    }
    
    func countup() {
    //setup timer
    seconds += 1;//plus counts up / minus goes down
        secondsLabel.text = (" \(seconds)")
        if (seconds > 25)//timer will go until it hits 100.
        {
           timer.invalidate()
        }
    
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            _ = touch.locationInNode(self)
             timer.invalidate()
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
