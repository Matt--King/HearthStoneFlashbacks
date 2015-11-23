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
import AlamofireImage
//import swiftyJSON

class Card_Search: UIViewController {
    
    @IBOutlet weak var CardImageView: UIImageView!
    @IBOutlet weak var SearchField: UITextField!
    @IBOutlet weak var ArtistLabel: UILabel!
    @IBOutlet weak var FlavorLabel: UILabel!
    
    let domain = "https://omgvamp-hearthstone-v1.p.mashape.com/cards/"
    let params = "?collectible=1&locale=enUS"
    var img:UIImage? = nil
    var imgGold:UIImage? = nil
    var artist:String = ""
    var flavor:String = ""
    var imgURL:String = ""
    var imgGoldURL:String = ""
    
    let headers = [
        "X-Mashape-Key": "CRoLBfeR9UmshwZTcCyMTcwohJv6p1kZPEWjsnws6uslpg1S7S",
        "Accept": "application/json"
    ]
    
    @IBAction func search(sender: UITextField) {
        var cardStr:String = SearchField.text!
        cardStr = cardStr.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        cardStr = cardStr.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!            //stringByReplacingOccurrencesOfString(" ", withString: "%20", options: NSStringCompareOptions.LiteralSearch, range: nil)
        /*
        Alamofire.request( .GET, domain+cardStr+params, headers: headers).responseJSON {
            (responseData) -> Void in
            let swiftyResp = JSON(responseData.result.value!)
            let numObjs = swiftyResp.count
            if numObjs == 2{ // bad call
                self.SearchField.endEditing(true)
                self.SearchField.text = ""
                
                var alertController:UIAlertController?
                alertController = UIAlertController(title: "Oops.",
                    message: "That card could not be found :(", preferredStyle: .Alert)
                let firstAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Cancel, handler: nil)
                alertController!.addAction(firstAction)
                self.presentViewController(alertController!, animated: true, completion: nil)
                
            } else {
                self.artist = swiftyResp[0]["artist"].stringValue
                self.flavor = swiftyResp[0]["flavor"].stringValue
                self.imgGoldURL = swiftyResp[0]["imgGold"].stringValue
                self.imgGoldURL = self.imgGoldURL.stringByReplacingOccurrencesOfString("http", withString: "https")
                self.SearchField.endEditing(true)
                self.SearchField.text = ""
                self.displayResults()
            }
        }
*/
    }
    /*
    func displayResults(){
        self.ArtistLabel.text = self.artist
        self.FlavorLabel.text = self.flavor
        let URL = NSURL(string: "https://wow.zamimg.com/images/hearthstone/cards/enus/animated/EX1_572_premium.gif")!
        let placeholderImage = UIImage(named: "blank")!
        let image = CardImageView.image
        Alamofire.request(.GET, URL).responseImage() {
            (resp) in
                print(resp)
        }
        
        
    }
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        
        // Do any additional setup after loading the view, typically from a nib.
        
        // Setting Headers for API session
        
        /*
        // This is the *correct* way to set permanent headers, but it doesn't work for us
        // https://github.com/Alamofire/Alamofire/issues/545
        let manager = Alamofire.Manager.sharedInstance
        manager.session.configuration.HTTPAdditionalHeaders = [
        "X-Mashape-Key": "CRoLBfeR9UmshwZTcCyMTcwohJv6p1kZPEWjsnws6uslpg1S7S",
        "Accept": "application/json"
        ]
        */
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
    