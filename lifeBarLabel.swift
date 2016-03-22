//
//  GameScene.swift
//  LoveBarExample
//
//  Created by Randall Clayborn on 11/21/14.
//  Copyright (c) 2014 claybear39. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var healthMeterText = NSString()
    var health = Double()
    var maxHealth = Double()
    var healthMeter = SKLabelNode()
    var healthBarString: NSString = "xoxoxoxxoxoxoxoxoxoxoxoxoxoxoxoxoxxoxoxoxxoxoxoxoxox"
    var playerHealthLabel = SKLabelNode(fontNamed: "Arial")
    
    override func didMoveToView(view: SKView) {
        backgroundColor = SKColor.blackColor()
        
        // Set the initial health
        health = 100.0

        createLoveBar()
    }

    func createLoveBar() {
        
        playerHealthLabel.name = "playerHealthLabel"
        playerHealthLabel.fontColor = SKColor.greenColor()
        playerHealthLabel.fontSize = 30
        playerHealthLabel.text = healthBarString.substringToIndex(20*75/100)
        playerHealthLabel.horizontalAlignmentMode = .Left
        playerHealthLabel.verticalAlignmentMode = .Top
        playerHealthLabel.zPosition = 10
        playerHealthLabel.position = CGPointMake(self.size.width * 0.1, self.size.height * 0.8)
        self.addChild(playerHealthLabel)
    }
        
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.health -= 5;
        if (self.health <= 0) {
        self.health = 0
            print("game Over")
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
 
    // update the color so that the closer to 0 it gets the more red it becomes
    playerHealthLabel.fontColor = SKColor(red: CGFloat(2.0 * (1 - self.health / 100)), green: CGFloat(2.0 * self.health / 100), blue: 0, alpha: 1)
    
    // Calculate the length of the players health bar.
    let healthBarLength = Double(healthBarString.length) * self.health / 100.0
    playerHealthLabel.text = healthBarString.substringToIndex(Int(healthBarLength))

    // If the player health reaches 0 then change the game state.
    if self.health <= 0 {
       print("gameover")
        }
    }
}
