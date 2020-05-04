//
//  WebsiteTab.swift
//  Reservations
//
//  Created by Shannon Mong on 4/23/20.
//  Copyright © 2020 Shannon Mong. All rights reserved.
//

import UIKit
import WebKit

class WebsiteTab: UIViewController {

    //Declare webview variable
    @IBOutlet weak var webView: WKWebView!

    //Displays a disclaimer due to no menu
    @IBAction func displayDisclaimer(_ sender: Any) {
   
    //Setup the alert
           let alert = UIAlertController(title: "DISCLAIMER" ,message: "Due to copyright laws, there is no menu present at this time. All photos are not by the owner of this application.", preferredStyle:.alert)
           
       //Add the action
           alert.addAction(UIAlertAction(title: NSLocalizedString("Okay", comment: "Default action"), style: .`default`))
       
           //Display rhe alert
           self.present(alert,animated: true, completion: nil)
       }
    
    
    
    
    
    
    
    
    
    
    

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    //Overrides URL string at load request
        let myURL = URL(string: "setonhill.edu")
               let myRequest = URLRequest(url: myURL!)
               webView.load(myRequest)
       
        

        
    }
    
        
        
        
        // Do any additional setup after loading the view.

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

