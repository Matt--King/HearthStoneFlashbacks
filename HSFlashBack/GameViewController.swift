//
//  GameController.swift
//  HSFlashBack
//
//  Created by Matthew King on 11/14/15.
//  Copyright © 2015 Matthew King. All rights reserved.
//



import UIKit
import SpriteKit
import AVFoundation


class GameViewController: UIViewController {  
    var audioPlayer:AVAudioPlayer!
    var alertsOn: Bool!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            let scene = GameScene(size: view.bounds.size)
            let skView = view as! SKView
            skView.ignoresSiblingOrder = true
            scene.scaleMode = .ResizeFill
            skView.presentScene(scene)
        
        self.audioPlayer = AVAudioPlayer()
        let sound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Garrosh_greetings", ofType: "mp3")!)
        do{
            self.audioPlayer = try AVAudioPlayer(contentsOfURL:sound)
            self.audioPlayer.prepareToPlay()
            self.audioPlayer.play()
        }catch {
            print("Error getting the audio file")
        }

        
    }
    
    @IBAction func concedePress(sender: UIButton) {
        
        self.audioPlayer = AVAudioPlayer()
        let sound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("garrosh_gg", ofType: "mp3")!)
        do{
            self.audioPlayer = try AVAudioPlayer(contentsOfURL:sound)
            self.audioPlayer.prepareToPlay()
            self.audioPlayer.play()
        }catch {
            print("Error getting the audio file")
        }

    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if AlertsOn {
            var alertController:UIAlertController?
            alertController = UIAlertController(title: "Tap the Screen",
            message: "Tap to truly experience saltiness", preferredStyle: .Alert)
        
            let firstAction = UIAlertAction(title: "Sounds Good", style: UIAlertActionStyle.Cancel, handler: nil)
            alertController!.addAction(firstAction)
            self.presentViewController(alertController!, animated: true, completion: nil)
        }
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return .Landscape
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
}

