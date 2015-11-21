//
//  MiracleRogue View.swift
//  HSFlashBack
//
//  Created by Matthew King on 11/20/15.
//  Copyright © 2015 Matthew King. All rights reserved.
//



import SpriteKit
import AVFoundation
class MiracleRogueScene: SKScene {
    
    var audioPlayer: AVAudioPlayer!
    var Zcounter: Int = 1
    var previous:SKSpriteNode!
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            var location = CGPoint()
            var sprite = SKSpriteNode()
            if Zcounter%2 == 1 {
                location = CGPointMake(size.width/2, size.height/2)
                sprite = SKSpriteNode(imageNamed:"Leeroy_Jenkins")
                sprite.xScale = 0.50
                sprite.yScale = 0.50
                let sound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Leeroy_Jenkins", ofType: "mp3")!)
                do{
                    self.audioPlayer = try AVAudioPlayer(contentsOfURL:sound)
                    audioPlayer.prepareToPlay()
                    audioPlayer.play()
                }catch {
                    print("Error getting the audio file")
                }
                self.previous = sprite
            } else {
                location = touch.locationInNode(self)
                sprite = SKSpriteNode(imageNamed:"shadowstep")
                sprite.xScale = 0.35
                sprite.yScale = 0.35
                previous.removeFromParent()
                
            }
            
            sprite.position = location
            self.addChild(sprite)
            if Zcounter%2 == 0 {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1 * NSEC_PER_SEC)), dispatch_get_main_queue()) {
                    sprite.removeFromParent()
                }
            }
            Zcounter++
        }
    }
    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        //	backgroundColor = SKColor.whiteColor()
        self.scaleMode = SKSceneScaleMode.AspectFill
        let bgImage = SKSpriteNode(imageNamed: "background")
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
