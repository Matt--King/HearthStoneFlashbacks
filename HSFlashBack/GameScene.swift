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
    
  
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            let RNGesus = Int(arc4random_uniform(6) + 1)
            
            if RNGesus == 1 {
                
                let sprite = SKSpriteNode(imageNamed:"goldenpatron")
                
                sprite.xScale = 0.5
                sprite.yScale = 0.5
                sprite.position = location
                self.addChild(sprite)
                let sound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("pile_on", ofType: "mp3")!)
                do{
                    self.audioPlayer = try AVAudioPlayer(contentsOfURL:sound)
                    audioPlayer.prepareToPlay()
                    audioPlayer.play()
                    
                }catch {
                    print("Error getting the audio file")
                }

            } else {
            let sprite = SKSpriteNode(imageNamed:"patron")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            self.addChild(sprite)
            let sound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("GET_IN_HERE", ofType: "mp3")!)
            do{
                self.audioPlayer = try AVAudioPlayer(contentsOfURL:sound)
                audioPlayer.prepareToPlay()
                audioPlayer.play()
                
            }catch {
                print("Error getting the audio file")
            }
            
            }
            
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
}
