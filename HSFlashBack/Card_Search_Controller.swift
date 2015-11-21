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
    
    @IBOutlet weak var CardImageView: UIImageView!
    @IBOutlet weak var SearchButton: UIButton!
    @IBOutlet weak var SearchField: UITextField!
    @IBOutlet weak var ArtistLabel: UILabel!
    @IBOutlet weak var FlavorLabel: UILabel!
    
    let mashape = "\"cardId\":\"EX1_572\",\"name\":\"Ysera\",\"cardSet\":\"Classic\",\"type\":\"Minion\",\"faction\":\"Neutral\",\"rarity\":\"Legendary\",\"cost\":9,\"attack\":4,\"health\":12,\"text\":\"At the end of your turn, add a Dream Card to your hand.\",\"flavor\":\"Ysera rules the Emerald Dream.  Which is some kind of green-mirror-version of the real world, or something?\",\"artist\":\"Gabor Szikszai\",\"collectible\":true,\"elite\":true,\"race\":\"Dragon\",\"img\":\"http://wow.zamimg.com/images/hearthstone/cards/enus/original/EX1_572.png\",\"imgGold\":\"http://wow.zamimg.com/images/hearthstone/cards/enus/animated/EX1_572_premium.gif\",\"locale\":\"enUS\"}"    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        // Do any additional setup after loading the view, typically from a nib.

        
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
    