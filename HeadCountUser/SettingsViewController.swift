//
//  ViewController.swift
//  HeadCountUser
//
//  Created by Garima Bothra on 07/01/20.
//  Copyright © 2020 Garima Bothra. All rights reserved.
//

import UIKit
import  Firebase

class SettingsViewController: UIViewController {

  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func editDetails(_ sender: Any) {
        performSegue(withIdentifier: "editDetails", sender: Any.self)
    }
    
    @IBAction func logoutPressed(_ sender: Any) {
         let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
         }
//        do {
//            try Auth.auth().signOut()
//            self.dismiss(animated: true, completion: nil)
//            } catch let err {
//                print(err)
//        }
//
      //  try! Auth.auth().signOut()

       
                    let vc = SignUpViewController()
                    self.present(vc, animated: false, completion: nil)
                
    }
    

}


