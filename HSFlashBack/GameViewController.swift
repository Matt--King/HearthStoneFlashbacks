//
//  GameController.swift
//  HSFlashBack
//
//  Created by Matthew King on 11/14/15.
//  Copyright © 2015 Matthew King. All rights reserved.
//



import UIKit
import SpriteKit

class GameViewController: UIViewController {  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            let scene = GameScene(size: view.bounds.size)
            let skView = view as! SKView
            skView.ignoresSiblingOrder = true
            scene.scaleMode = .ResizeFill
            skView.presentScene(scene)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        var alertController:UIAlertController?
        alertController = UIAlertController(title: "Tap the Screen",
            message: "Tap to truly experience saltiness", preferredStyle: .Alert)
        
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

