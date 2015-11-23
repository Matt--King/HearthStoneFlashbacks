//
//  GameScene.swift
//  HSFlashBack
//
//  Created by Matthew King on 11/14/15.
//  Copyright © 2015 Matthew King. All rights reserved.
//

import SpriteKit
import AVFoundation
class GameScene: SKScene {
    
    var audioPlayer: AVAudioPlayer!
    var Zcounter: Int = 1
  
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            let RNGesus = Int(arc4random_uniform(6) + 1)
            var sprite = SKSpriteNode()
            if RNGesus == 1 {
                
                sprite = SKSpriteNode(imageNamed:"goldenpatron")
                let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
                sprite.runAction(SKAction.repeatActionForever(action))
                sprite.xScale = 0.45
                sprite.yScale = 0.45
                let sound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("pile_on", ofType: "mp3")!)
                do{
                    self.audioPlayer = try AVAudioPlayer(contentsOfURL:sound)
                    audioPlayer.prepareToPlay()
                    audioPlayer.play()
                }catch {
                    print("Error getting the audio file")
                }

            } else {
                sprite = SKSpriteNode(imageNamed:"patron")
                sprite.xScale = 0.5
                sprite.yScale = 0.5
                let sound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("GET_IN_HERE", ofType: "mp3")!)
                do{
                    self.audioPlayer = try AVAudioPlayer(contentsOfURL:sound)
                    audioPlayer.prepareToPlay()
                    audioPlayer.play()
                }catch {
                    print("Error getting the audio file")
                }
            
            }
            
            sprite.position = location
            sprite.zPosition = CGFloat(self.Zcounter)
            self.addChild(sprite)
            Zcounter++
        }
    }
    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        //	backgroundColor = SKColor.whiteColor()
        self.scaleMode = SKSceneScaleMode.AspectFill
        let bgImage = SKSpriteNode(imageNamed: "garrosh_bg")
        bgImage.xScale = 1.2
        bgImage.yScale = 1.2
        bgImage.position = CGPointMake(self.size.width/2, self.size.height/2)
        bgImage.zPosition = -1
        self.addChild(bgImage)
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    override func didChangeSize(oldSize: CGSize) {
        for node in children {
            let x = node.position.x / oldSize.width * self.frame.width;
            let y = node.position.y / oldSize.height * self.frame.height;
            
            let newPosition = CGPoint(x: x, y: y);
            node.position = newPosition;
            
        }
    }
}
