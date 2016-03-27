//
//  GameScene.swift
//  SpriteKitLoop
//
//  Created by Randall Clayborn on 3/1/16.
//  Copyright (c) 2016 claybear39. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
    print("didMoveToView")
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
    print("TouchesBegan")
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        print("1")
    }
    
    override func didEvaluateActions() {
        print("2")
        
    }
    
    override func didSimulatePhysics() {
        print("3")
    }
    
    override func didApplyConstraints() {
        print("4")
    }
    
    override func didFinishUpdate() {
        print("5")
        paused = true
    }

}
