//
//  GameScene.swift
//  Collisions
//
//  Created by Randall Clayborn on 3/21/16.
//  Copyright (c) 2016 claybear39. All rights reserved.

//

import SpriteKit

// BEGIN contact_bitmask
let myObjectBitMask : UInt32 = 0x00001
// END contact_bitmask

class PhysicsScene: SKScene, SKPhysicsContactDelegate {
    
    override func didMoveToView(view: SKView) {
        createPhysicsSprite()
        createStaticPhysicsSprite()
        
        // BEGIN contact_delegate
        self.physicsWorld.contactDelegate = self
        // END contact_delegate

    }
    
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        
//    }
    
    // BEGIN physics_contact
    func didBeginContact(contact: SKPhysicsContact) {
        print("Contact started between \(contact.bodyA) and \(contact.bodyB)")
        //put code here to react to contact
        
    }
    
    func didEndContact(contact: SKPhysicsContact) {
        print("Contact ended between \(contact.bodyA) and \(contact.bodyB)")
        //put code here to react to contact
        
    }
    // END physics_contact
    
    
    func createPhysicsSprite() {
        let physicsSprite = SKSpriteNode(color:SKColor.whiteColor(), size:CGSize(width: 100, height: 100))
    
        physicsSprite.position = CGPointMake(self.frame.midX, self.frame.midY + 300)
        physicsSprite.physicsBody = SKPhysicsBody(rectangleOfSize:physicsSprite.size)
    
        // BEGIN apply_bitmask
        physicsSprite.physicsBody?.contactTestBitMask = myObjectBitMask;
        // END apply_bitmask
    
        self.addChild(physicsSprite)
    }
    
    func createStaticPhysicsSprite() {
        let staticSprite = SKSpriteNode(color:SKColor.yellowColor(), size:CGSize(width: 200, height: 25))
    
        staticSprite.position = CGPointMake(self.frame.midX, self.frame.midY - 50)
        staticSprite.physicsBody = SKPhysicsBody(rectangleOfSize:staticSprite.size)
        staticSprite.physicsBody?.dynamic = false
    
        staticSprite.physicsBody?.contactTestBitMask = myObjectBitMask
    
        self.addChild(staticSprite)
    }

}
