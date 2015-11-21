//
//  MiracleRogueController.swift
//  HSFlashBack
//
//  Created by Matthew King on 11/20/15.
//  Copyright © 2015 Matthew King. All rights reserved.
//




import UIKit
import SpriteKit
import AVFoundation


class MiracleRogueController: UIViewController {
    var audioPlayer:AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = MiracleRogueScene(size: view.bounds.size)
        let skView = view as! SKView
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .ResizeFill
        skView.presentScene(scene)
        
        self.audioPlayer = AVAudioPlayer()
        let sound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Valeera_Sanguinar", ofType: "mp3")!)
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
        let sound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Valeera_Sanguinar", ofType: "mp3")!)
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
        var alertController:UIAlertController?
        alertController = UIAlertController(title: "Tap the Screen",
            message: "Tap once to let the salt flow through you", preferredStyle: .Alert)
        
        let firstAction = UIAlertAction(title: "Sounds Good", style: UIAlertActionStyle.Cancel, handler: nil)
        alertController!.addAction(firstAction)
        self.presentViewController(alertController!, animated: true, completion: nil)
        
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
