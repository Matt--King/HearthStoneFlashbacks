//
//  ViewController.swift
//  HSFlashBack
//
//  Created by Matthew King on 10/27/15.
//  Copyright © 2015 Matthew King. All rights reserved.
//

import UIKit
import MobileCoreServices

class Home_Page: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let bgimage = UIImage(named: "background")!
        self.view.backgroundColor = UIColor(patternImage: bgimage)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


class Simulators_Page: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let bgimage = UIImage(named: "background")!
        self.view.backgroundColor = UIColor(patternImage: bgimage)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        // navigationItem.title = "One"
        // navigationItem.title = "Test"
    }
    
    
  

}


