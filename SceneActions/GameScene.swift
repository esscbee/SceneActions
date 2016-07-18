//
//  GameScene.swift
//  SceneActions
//
//  Created by Stephen Brennan on 7/18/16.
//  Copyright (c) 2016 Stephen Brennan. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var floofRef : SKReferenceNode!
    override func didMoveToView(view: SKView) {
        physicsWorld.gravity = CGVector(dx: 0, dy: -1)
    }
    func p2(c : CGFloat) -> String {
        return String(format: "%.0f", c)
    }
    func formatPoint(p : CGPoint) -> String {
        return p2(p.x) + ", " + p2(p.y)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        var toRemove = [ SKNode ]()
        
//        for c in children {
//            if let l = c as? SKLabelNode {
//                toRemove.append(l)
//            }
//        }
//        for l in toRemove {
//            l.removeFromParent()
//        }
        print(frame)
        for touch in touches {
            let location = touch.locationInNode(self)
            
            var label = SKLabelNode(text: formatPoint(location))
            self.addChild(label)
            label.position = location
            label.fontColor = UIColor.orangeColor()
            let boldFont = label.fontName! + "-Bold"
            label.fontName = boldFont
            
            if location.x > frame.width / 2 {
                label.horizontalAlignmentMode = .Right
            } else {
                label.horizontalAlignmentMode = .Left
            }
            
            if location.y > frame.height / 2 {
                label.verticalAlignmentMode = .Top
            } else {
                label.verticalAlignmentMode = .Bottom
            }
            
            label.physicsBody = SKPhysicsBody()
            
//            let path = NSBundle.mainBundle().pathForResource("Control", ofType: "sks")
//            let node = SKReferenceNode (URL: NSURL (fileURLWithPath: path!))
//            self.addChild(node)
//            node.runAction(SKAction.moveTo(location, duration: 2))
//            
//            let hiScore = node.childNodeWithName("//HiScoreValue") as! SKLabelNode
//            hiScore.text = "2500"
        }
    }
    
    func getWordFromFirstLetter(letter : Character) -> String? {
        for c in children {
            if let l = c as? SKLabelNode {
                l.text = formatPoint(l.position)
            }
        }
        return nil
    }
   
    override func update(currentTime: CFTimeInterval) {
        var toRemove = [ SKNode ]()

        for c in children {
            if let l = c as? SKLabelNode {
                l.text = formatPoint(l.position)
                if l.position.y < 0 {
                    toRemove.append(l)
                }
            }
        }
        for l in toRemove {
            l.removeFromParent()
        }
    }
}
