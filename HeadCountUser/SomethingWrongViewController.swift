//
//  SomethingWrongViewController.swift
//  HeadCountUser
//
//  Created by Garima Bothra on 01/02/20.
//  Copyright © 2020 Garima Bothra. All rights reserved.
//

import UIKit
import Firebase

class SomethingWrongViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   
    @IBOutlet weak var bypassKey: UITextField!
    @IBAction func submitButton(_ sender: Any) {
        let roomname = bypassKey.text!
        ref.child("rooms").child(roomname).observeSingleEvent(of: .value, with: { (snapshot) in
            roomref = ref.child("rooms").child(roomname)
            self.performSegue(withIdentifier: "meetingFound", sender:Any.self)
        }){ (error) in
        print(error.localizedDescription)
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
