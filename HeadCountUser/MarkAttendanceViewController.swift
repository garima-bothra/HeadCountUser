//
//  MarkAttendanceViewController.swift
//  HeadCountUser
//
//  Created by Garima Bothra on 01/02/20.
//  Copyright © 2020 Garima Bothra. All rights reserved.
//

import UIKit

class MarkAttendanceViewController: UIViewController {

    @IBOutlet weak var agendaLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var venueLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roomref.observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            self.agendaLabel.text = value?["agenda"] as? String ?? ""
            self.venueLabel.text = value?["location"] as? String ?? ""
            let tstamp = value?["startingUnixTime"] as? String ?? ""
            let estamp = value?["endingUnixTime"] as? String ?? ""
            self.dateLabel.text = String((self.createDateTime(timestamp: tstamp)).prefix(10))
            let stTime = String(self.createDateTime(timestamp: tstamp).suffix(5))
            let endTime = String(self.createDateTime(timestamp: estamp).suffix(5))
            self.timeLabel.text = stTime + " to " + endTime
        })
        // Do any additional setup after loading the view.
    }
    
    func createDateTime(timestamp: String) -> String {
        var strDate = "undefined"
            
        if let unixTime = Double(timestamp) {
            let date = Date(timeIntervalSince1970: unixTime)
            let dateFormatter = DateFormatter()
            let timezone = TimeZone.current.abbreviation() ?? "CET"  // get current TimeZone abbreviation or set to CET
            dateFormatter.timeZone = TimeZone(abbreviation: timezone) //Set timezone that you want
            dateFormatter.locale = NSLocale.current
            dateFormatter.dateFormat = "dd.MM.yyyy HH:mm" //Specify your format that you want
            strDate = dateFormatter.string(from: date)
        }
            
        return strDate
    }
    
     @IBAction func markButtonPressed(_ sender: Any) {
            roomref.child("attendees").child(UIDevice.current.identifierForVendor!.uuidString).observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
                let suid = value?["uid"] as? String ?? ""
                let userid =  value?["user_id"] as? String ?? ""
                if (suid == ""){
                    roomref.child("attendees").child(UIDevice.current.identifierForVendor!.uuidString).child("user_id").setValue(customer.userid)
                    ProgressHUD.showSuccess("Attendance Marked")
                   
                }
                else{
                    if(uid == suid){
                        ProgressHUD.showError("Already marked present")
                    }
                    else{
                        ProgressHUD.showError("This device has already been used to mark attendance")
                    }
                }
        })
         dismiss(animated: true, completion: nil)
       
     }
    
    @IBAction func retryButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    /*
     // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
