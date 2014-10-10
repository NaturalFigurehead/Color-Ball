//
//  GameScene.swift
//  Color Ball
//
//  Created by Oliver Reznik on 8/30/14.
//  Copyright (c) 2014 Oliver Reznik. All rights reserved.
//

import SpriteKit
import UIKit

class GameScene: SKScene {
    
    var background = SKShapeNode(circleOfRadius: 1500)
    var ball1 = SKShapeNode(circleOfRadius: 460)
    var color1 = SKLabelNode(fontNamed: "Futura-Medium")
    
    func randRange (lower: Int , upper: Int) -> CGFloat {
        return CGFloat(lower + Int(arc4random_uniform(UInt32(upper - lower + 1))))
    }
    
    func colorSettings(){
        color1.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        color1.fontSize = 200
        color1.fontColor = SKColor.whiteColor()
        addChild(color1)
        color1.zPosition = 2
    }

    override func didMoveToView(view: SKView) {
        
        self.addChild(background)
        self.background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        self.background.fillColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        self.addChild(ball1)
        self.ball1.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        self.ball1.zPosition = 1
        self.ball1.fillColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        colorSettings()
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        self.background.fillColor = UIColor(red: randRange(0, upper: 255) / 255, green: randRange(0, upper: 255) / 255, blue: randRange(0, upper: 255) / 255, alpha: 1)
        
        self.ball1.fillColor = UIColor(red: randRange(0, upper: 255) / 255, green: randRange(0, upper: 255) / 255, blue: randRange(0, upper: 255) / 255, alpha: 1)
        
        self.color1.text = "\(self.ball1.fillColor)"
        println(self.color1.text)
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        self.ball1.strokeColor = self.ball1.fillColor
    }
}
