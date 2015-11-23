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
import SystemConfiguration


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
    
    var placeholderImage:UIImage? = nil
    
    let headers = [
        "X-Mashape-Key": "CRoLBfeR9UmshwZTcCyMTcwohJv6p1kZPEWjsnws6uslpg1S7S",
        "Accept": "application/json"
    ]
    
    @IBAction func search(sender: UITextField) {
        if (connectedToNetwork()) {
            var cardStr:String = SearchField.text!
            cardStr = cardStr.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
            cardStr = cardStr.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!            //stringByReplacingOccurrencesOfString(" ", withString: "%20", options: NSStringCompareOptions.LiteralSearch, range: nil)
        
            Alamofire.request( .GET, domain+cardStr+params, headers: headers).responseJSON {
                (responseData) -> Void in
                let swiftyResp = JSON(responseData.result.value!)
            
                let numObjs = swiftyResp.count
                if numObjs != 1{ // bad call
                    self.SearchField.endEditing(true)
                
                    var alertController:UIAlertController?
                    alertController = UIAlertController(title: "Oops.",
                    message: "That card could not be found or is not collectible", preferredStyle: .Alert)
                    let firstAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Cancel, handler: nil)
                    alertController!.addAction(firstAction)
                    self.presentViewController(alertController!, animated: true, completion: nil)
                
                } else {
                    self.artist = swiftyResp[0]["artist"].stringValue
                    self.flavor = swiftyResp[0]["flavor"].stringValue
                    self.imgGoldURL = swiftyResp[0]["imgGold"].stringValue
                    self.imgGoldURL = self.imgGoldURL.stringByReplacingOccurrencesOfString("http", withString: "https")
                    self.SearchField.endEditing(true)
                    self.displayResults()
                }
            }
        } else {
            var alertController:UIAlertController?
            alertController = UIAlertController(title: "We can't access the Internet.",
                message: "Make sure your device is connected to the Internet", preferredStyle: .Alert)
            let firstAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Cancel, handler: nil)
            alertController!.addAction(firstAction)
            self.presentViewController(alertController!, animated: true, completion: nil)

        }
    }
    
    func displayResults(){
        self.ArtistLabel.text = "Artist: " + self.artist
        self.FlavorLabel.text = self.flavor
        let URL = NSURL(string: self.imgGoldURL)!
        
        self.CardImageView.af_setImageWithURL(URL, placeholderImage: self.placeholderImage)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        placeholderImage = UIImage(named: "blank")!

        
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
    
    
    func connectedToNetwork() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(sizeofValue(zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(&zeroAddress, {
            SCNetworkReachabilityCreateWithAddress(nil, UnsafePointer($0))
        }) else {
            return false
        }
        
        var flags : SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.Reachable)
        let needsConnection = flags.contains(.ConnectionRequired)
        return (isReachable && !needsConnection)
    }
}
    