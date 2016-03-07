//
//  GameScene.swift
//  ScrollingExperiementSwift2.1
//
//  Created by Randall Clayborn on 1/8/16.
//  Copyright (c) 2016 claybear39. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    //for topdown Scrolling
    var backgroundRoad = SKSpriteNode(imageNamed: "background")
    
    //for side scrolling
    var bg = SKSpriteNode()
    
    override func didMoveToView(view: SKView) {
       
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Scrolling Experiement!"
        myLabel.fontSize = 65
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        self.addChild(myLabel)
        
        //comment out the one you will not use.
        makeSideScrollingBg()
        // makeTopDownScrollingBg()
        
    }
    
    func makeTopDownScrollingBg() {
            //not that this one has a time factor.
                let moveBackground = SKAction.moveByX(0, y: -backgroundRoad.size.height, duration: NSTimeInterval(0.01 * backgroundRoad.size.width))
                let resetBackGround = SKAction.moveByX(0, y: backgroundRoad.size.height, duration: 0.0)
                let moveBackgoundForever = SKAction.repeatActionForever(SKAction.sequence([moveBackground, resetBackGround]))
        
                //then run a for loop to make the images line up end to end.
                for var i:CGFloat = 0; i<2 + self.frame.size.width / (backgroundRoad.size.width); ++i {
                    let sprite = SKSpriteNode(imageNamed:  "background")
                    sprite.xScale = 1.0
                    sprite.yScale = 1
                    sprite.position = CGPointMake(sprite.size.width / 2, i * sprite.size.height)
                    sprite.runAction(moveBackgoundForever)
                    self.addChild(sprite)
               }

    }
    
    func makeSideScrollingBg() {
        
        let bgTexture = SKTexture(imageNamed: "background.png")
        
        let movebg = SKAction.moveByX(-bgTexture.size().width, y: 0, duration: 9)
        let replacebg = SKAction.moveByX(bgTexture.size().width, y: 0, duration: 0)
        let movebgForever = SKAction.repeatActionForever(SKAction.sequence([movebg, replacebg]))
        
        
        for var i: CGFloat = 0; i<3; i++ {
            bg = SKSpriteNode(texture: bgTexture)
            bg.position = CGPoint(x: bgTexture.size().width/2 + bgTexture.size().width * i, y: CGRectGetMidY(self.frame))
            bg.size.height = self.frame.height
            bg.zPosition = -1
            bg.runAction(movebgForever)
            self.addChild(bg)
        }
    }


}

    


