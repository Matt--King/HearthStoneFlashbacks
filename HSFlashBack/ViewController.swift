//
//  ViewController.swift
//  HSFlashBack
//
//  Created by Matthew King on 10/27/15.
//  Copyright © 2015 Matthew King. All rights reserved.
//

import UIKit
import AVFoundation
import MobileCoreServices

var AlertsOn : Bool = true

class Home_Page: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


class Simulators_Page: UIViewController {
    
    @IBOutlet var garroshTap: UITapGestureRecognizer!
    @IBOutlet var saltTap: UITapGestureRecognizer!
    @IBOutlet var rogueTap: UITapGestureRecognizer!
    @IBOutlet weak var garroshButton: UIButton!
    @IBOutlet weak var rogueButton: UIButton!
    @IBOutlet weak var saltButton: UIButton!
    
    @IBOutlet weak var alertToggle: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        alertToggle.setOn(AlertsOn, animated: false)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        // navigationItem.title = "One"
        navigationItem.title = "Test"
    }
    
    
    @IBAction func SwitcherHit(sender: UISwitch) {
        AlertsOn = alertToggle.on
    }
    

}


