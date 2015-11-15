//
//  GPS_Table_Controller.swift
//  HSFlashBack
//
//  Created by Matthew King on 11/15/15.
//  Copyright © 2015 Matthew King. All rights reserved.
//

import Foundation
import UIKit

class GPS_Table_Controller: UITableViewController {
    
    @IBOutlet var table: UITableView!
    
    @IBOutlet weak var tablepiece1: UIView!
    @IBOutlet weak var tablepiece2: UIView!
    @IBOutlet weak var tablepiece3: UIView!
    @IBOutlet weak var tablepiece4: UIView!
    @IBOutlet weak var tablepiece5: UIView!
    @IBOutlet weak var tablepiece6: UIView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        table.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        tablepiece1.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        tablepiece2.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        tablepiece3.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        tablepiece4.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        tablepiece5.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        tablepiece6.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
    
    
    
    }
    
}