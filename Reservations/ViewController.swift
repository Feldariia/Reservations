//
//  ViewController.swift
//  Reservations
//
//  Created by Shannon Mong on 4/17/20.
//  Copyright © 2020 Shannon Mong. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController ,  MFMessageComposeViewControllerDelegate{
    
    

    //Declaring Actions
    
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var numberGuests: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var displayReservations: UITextView!
    //Send reservation to a readily available back up directory
    
    @IBAction func takeReservations(_ sender: Any) {
   let csvLine:String = "\(lastName.text!), \(numberGuests.text!), \(phoneNumber.text!),\n"
         let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
         let docDir:String=paths[0]
         
         //shannonmong_results.csv
         let resultsFile:String=(docDir as NSString).appendingPathComponent("results.csv")
         
     
         if !FileManager.default.fileExists(atPath: resultsFile){
             FileManager.default.createFile(atPath: resultsFile,contents: nil, attributes: nil)
         }
     
         let fileHandle:FileHandle = FileHandle(forUpdatingAtPath:resultsFile)!
             fileHandle.seekToEndOfFile()
         fileHandle.write(csvLine.data(using: String.Encoding.utf8)!)
         fileHandle.closeFile()
         
         //Clears fields for next user
         lastName.text = " "
         numberGuests.text = " "
         phoneNumber.text = " "
    
    }
    
    
    @IBAction func showReservations(_ sender: Any) {
    
    let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
    let docDir:String=paths[0] as String
    
    let resultsFile:String=(docDir as NSString).appendingPathComponent("results.csv")
    
    if FileManager.default.fileExists(atPath: resultsFile){
        let fileHandle:FileHandle = FileHandle(forReadingAtPath:resultsFile)!
        let resultsData:String!=NSString(data: fileHandle.availableData, encoding: String.Encoding.utf8.rawValue)! as String
        fileHandle.closeFile()
        displayReservations?.text=resultsData
        }
        else
    {
        //File does not exist
    }
    
    
    
    }
    
    
    
    
    //Sending Confirmation Text
    @IBAction func sendText(_ sender: Any) {
  
    let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = (self as MFMessageComposeViewControllerDelegate)
           
           //Telephone number
      
          
          composeVC.recipients = [phoneNumber.text!]
        //Generic name format, change the name in brackets to a company name
        composeVC.body = "Your reservation at [RESTAURANT NAME] is ready!"
           
           //Present the view controller modally.
           if MFMessageComposeViewController.canSendText(){
               self.present(composeVC, animated:true, completion: nil)
           } else {
               print("Can't send messages.")
           }

    
    }
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

