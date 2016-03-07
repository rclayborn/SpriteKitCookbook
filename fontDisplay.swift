//
//  GameScene.swift
//  fontDisplay
//
//  Created by Randall Clayborn on 3/1/16.
//  Copyright (c) 2016 claybear39. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var familyIdx: Int = 0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        showCurrentFamily()
    }
    
    func showCurrentFamily() {
        // 1
        removeAllChildren()
        
        // 2
        let familyName = UIFont.familyNames()[familyIdx]
        print("Family: \(familyName)")
        
        // 3
        let fontNames =
        UIFont.fontNamesForFamilyName(familyName)
        
        // 4
        for (idx, fontName) in fontNames.enumerate() {
            let label = SKLabelNode(fontNamed: fontName)
            label.text = fontName
            label.position = CGPoint(
                x: size.width / 2,
                y: (size.height * (CGFloat(idx+1))) /
                    (CGFloat(fontNames.count)+1))
            label.fontSize = 50
            label.verticalAlignmentMode = .Center
            addChild(label)
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>,
        withEvent event: UIEvent?) {
            familyIdx++
            if familyIdx >= UIFont.familyNames().count {
                familyIdx = 0
            }
            showCurrentFamily()
    } 
}

