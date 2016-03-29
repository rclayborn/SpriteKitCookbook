//
//  GameScene.swift
//  ParticleEffects
//
//  Created by Randall Clayborn on 3/28/16.
//  Copyright (c) 2016 claybear39. All rights reserved.

/* To create a particle Emitter with particle editor. create a new file using IOS resources click on Spritekit Particle file. Make sure it is NOT sceneKit. Play with the editor and then put the code in green into the didMoveToView... */

//manually just drag the spark.png into the project.

import SpriteKit

class GameScene: SKScene {
    
    override func didMoveToView(view: SKView) {
        
        backgroundColor = SKColor.blackColor()
        
//    If you create a particle file with th3 editor:
/*      let rainEmitter = SKEmitterNode(fileNamed: "Rain.sks")!
        rainEmitter.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMaxY(self.frame))
        addChild(rainEmitter)   */
        
        createRain()
    }
    //create emitter manually:
    func createRain() -> SKEmitterNode {
        let rainTexture = SKTexture(imageNamed: "spark.png")
        let emitterNode = SKEmitterNode()
        emitterNode.particleTexture = rainTexture
        emitterNode.particleBirthRate = 80.0
        emitterNode.particleColor = SKColor.whiteColor()
        emitterNode.particleSpeed = -450
        emitterNode.particleSpeedRange = 150
        emitterNode.particleLifetime = 2.0
        emitterNode.particleScale = 0.2
        emitterNode.particleScaleRange = 0.5
        emitterNode.particleAlpha = 0.75
        emitterNode.particleAlphaRange = 0.5
        emitterNode.position = CGPoint(x: CGRectGetWidth(frame) / 2, y:
            CGRectGetHeight(frame) + 10)
        emitterNode.particlePositionRange = CGVector(dx: CGRectGetMaxX(frame), dy:0)
        addChild(emitterNode)
        return emitterNode
    }
    
}
