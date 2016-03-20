//
//  GameScene.swift
//  ShadowNode
//
//  Created by Randall Clayborn on 3/7/16.
//  Copyright (c) 2016 claybear39. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    override func didMoveToView(view: SKView) {
        addEllipse()
        //addCircle()
    }
    
    func addEllipse() {
        let node: SKShapeNode
        node = SKShapeNode(ellipseOfSize: size)
        node.fillColor = SKColor.blackColor()
        node.strokeColor = SKColor.blackColor()
        node.alpha = 0.2
        node.xScale = 0.2
        node.yScale = 0.2
        node.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        self.addChild(node)
    }
    
    func addCircle() {
            let circleNode: SKShapeNode
            circleNode = SKShapeNode(circleOfRadius: 100.0)
            circleNode.fillColor = SKColor.blackColor()
            circleNode.strokeColor = SKColor.blackColor()
            circleNode.alpha = 0.2
            circleNode.xScale = 0.5
            circleNode.yScale = 0.5
            circleNode.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
            self.addChild(circleNode)
    }
    
}
