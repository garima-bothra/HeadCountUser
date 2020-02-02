//
//  ChirpViewController.swift
//  HeadCountUser
//
//  Created by Garima Bothra on 01/02/20.
//  Copyright © 2020 Garima Bothra. All rights reserved.
//

import UIKit
import ChirpSDK
//
var roomref = ref
//let attendeeref = ref
class ChirpViewController: UIViewController {

   
    @IBOutlet weak var userLabel: UILabel!
    
    @IBOutlet weak var chirpStatusLabel: UILabel!
    
    let chirp: ChirpSDK = ChirpSDK(appKey: CHIRP_APP_KEY, andSecret: CHIRP_APP_SECRET)!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if let err = chirp.setConfig(CHIRP_APP_CONFIG) {
                      print("ChirpError (%@)", err.localizedDescription)
                    } else {
                      if let err = chirp.start() {
                        print("ChirpError (%@)", err.localizedDescription)
                      } else {
                        print("Started ChirpSDK")
                      }
        }
        
        chirp.stop()
        print(customer.name)
if (userLabel != nil)
{
    userLabel.text = customer.name
        }
        // Do any additional setup after loading the view.
    }
   
    @IBAction func chirpButtonPressed(_ sender: Any) {
        if(chirp.state != CHIRP_SDK_STATE_RUNNING){
            chirp.start()
            chirpStatusLabel.text = "Finding meetings around you..."
            chirp.receivedBlock = {
              (data : Data?, channel: UInt?) -> () in
              if data != nil {
                let identifier = String(data: data!, encoding: .ascii)
                print("Received \(identifier!)")
               
                ref.child("rooms").child(identifier!).observeSingleEvent(of: .value, with: { (snapshot) in
                    roomref = ref.child("rooms").child(identifier!)
                    self.performSegue(withIdentifier: "meetingPopover", sender:Any.self)
                }){ (error) in
                print(error.localizedDescription)
                }
            }
        }
        }
        else
        {
            chirp.stop()
            chirpStatusLabel.text = "Tap to begin"
        }
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
