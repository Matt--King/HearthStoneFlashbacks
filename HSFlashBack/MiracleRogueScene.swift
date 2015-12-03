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
    var counter: Int = 1
    var previous:SKSpriteNode!
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        for touch in touches {
            var location = CGPoint()
            var sprite = SKSpriteNode()
            if counter%3 == 1 {
                location = CGPointMake(size.width/2, size.height/2)
                sprite = SKSpriteNode(imageNamed:"Leeroy_Jenkins")
                
                sprite.xScale = 0.5
                sprite.yScale = 0.5
                
                let moves: [SKAction] = [
                    SKAction.rotateToAngle(CGFloat(M_PI_4), duration: 0.5),
                    SKAction.rotateToAngle(CGFloat(-(M_PI_4)), duration: 0.5)
                ]
                sprite.runAction(SKAction.repeatActionForever(SKAction.sequence(moves)))
                
                
                let sound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Leeroy_Jenkins", ofType: "mp3")!)
                do{
                    self.audioPlayer = try AVAudioPlayer(contentsOfURL:sound)
                    audioPlayer.prepareToPlay()
                    audioPlayer.play()
                }catch {
                    print("Error getting the audio file")
                }
                self.previous = sprite
            } else if counter%3 == 2 {
                let sound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Leeroy_Attack", ofType: "mp3")!)
                do{
                    self.audioPlayer = try AVAudioPlayer(contentsOfURL:sound)
                    audioPlayer.prepareToPlay()
                    audioPlayer.play()
                    
                    Int(arc4random_uniform(8) + 1)
                    var points:[CGPoint] = [
                        CGPoint(x: 0, y: 0),
                        CGPoint(x: 0, y: 0),
                        CGPoint(x: 0, y: 0),
                        CGPoint(x: 0, y: 0),
                        CGPoint(x: 0, y: 0),
                        CGPoint(x: 0, y: 0),
                        CGPoint(x: 0, y: 0)
                    ]
                    
                    let wid:UInt32 = (UInt32)(size.width)
                    let len:UInt32 = (UInt32)(size.height)
                    
                    for var i:Int = 0; i < 7; i++ {
                        let RNGesusX = Int(arc4random_uniform(wid) + 1)
                        let RNGesusY = Int(arc4random_uniform(len) + 1)
                        
                        points[i] = CGPoint(x: RNGesusX, y: RNGesusY)

                    }
                    //Leeroy runs around
                    let moves: [SKAction] = [
                        SKAction.moveTo(points[0], duration: 0.5),
                        SKAction.moveTo(points[1], duration: 0.5),
                        SKAction.moveTo(points[2], duration: 0.5),
                        SKAction.moveTo(points[3], duration: 0.5),
                        SKAction.moveTo(points[4], duration: 0.5),
                        SKAction.moveTo(points[5], duration: 0.5),
                        SKAction.moveTo(points[6], duration: 0.5),
                        SKAction.moveTo(CGPoint(x: size.width/2, y: size.height/2), duration: 0.5)
                        
                    ]
                    
                    self.previous.runAction(SKAction.sequence(moves))
                    
                    
                } catch {
                    print("Error getting the audio file")
                }
                
            } else {
                location = touch.locationInNode(self)
                sprite = SKSpriteNode(imageNamed:"shadowstep")
                sprite.xScale = 0.35
                sprite.yScale = 0.35
                

                previous.removeFromParent()
                
            }
            
            sprite.position = location
            self.addChild(sprite)
            if counter%3 == 0 {
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(NSEC_PER_SEC)), dispatch_get_main_queue()) {
                    sprite.removeFromParent()
                }
            }
            counter++
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
