//
//  Card_Search_Controller.swift
//  HSFlashBack
//
//  Created by Aakash Shah on 11/18/15.
//  Copyright © 2015 Matthew King. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class Card_Search: UIViewController {
    
    var arrRes = [[String:AnyObject]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        // Do any additional setup after loading the view, typically from a nib.

        
        // Alamofire SwiftyJSON Test
        /*
        Alamofire.request(.GET, "http://api.androidhive.info/contacts/").responseJSON { (responseData) -> Void in
            let swiftyJsonVar = JSON(responseData.result.value!)
            
            if let resData = swiftyJsonVar["contacts"].arrayObject {
                self.arrRes = resData as! [[String:AnyObject]]
            }
            if self.arrRes.count > 0 {
                print(self.arrRes)
            }
        }
        */
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
    