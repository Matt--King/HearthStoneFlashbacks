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
    
    let manager = Alamofire.Manager.sharedInstance
    
    @IBOutlet weak var CardImageView: UIImageView!
    @IBOutlet weak var SearchButton: UIButton!
    @IBOutlet weak var SearchField: UITextField!
    @IBOutlet weak var ArtistLabel: UILabel!
    @IBOutlet weak var FlavorLabel: UILabel!

    let domain = "https://omgvamp-hearthstone-v1.p.mashape.com/cards/"
    let params = "?collectible=1&locale=enUS"
    var img:UIImage? = nil
    var imgGold:UIImage? = nil
    var artist:AnyObject? = nil
    var flavor:AnyObject? = nil
    var imgURL:AnyObject? = nil
    var imgGoldURL:AnyObject? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        // Do any additional setup after loading the view, typically from a nib.

        // Setting Headers for API session
        //manager.session.configuration.HTTPAdditionalHeaders =
        let headers = ["X-Mashape-Key": "CRoLBfeR9UmshwZTcCyMTcwohJv6p1kZPEWjsnws6uslpg1S7S"
            ,"Accept": "application/json"]
        
        manager.request(.GET,domain+"ysera"+params, headers:headers).responseJSON {
            (responseData) -> Void in
            let swiftyResp = JSON(responseData.result.value!)
            print(swiftyResp)
            //artist = swiftyResp[0]["artist"].dictionaryValue
            //flavor = swiftyResp[0]["flavor"].dictionaryValue

        }

        // Alamofire SwiftyJSON Test
        
        Alamofire.request(.GET, "http://api.androidhive.info/contacts/").responseJSON { (responseData) -> Void in
            let swiftyJsonVar = JSON(responseData.result.value!)
            
            if let resData = swiftyJsonVar["contacts"].arrayObject {
                self.arrRes = resData as! [[String:AnyObject]]
            }
            if self.arrRes.count > 0 {
                print(self.arrRes)
            }
        }


        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
    