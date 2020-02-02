//
//  SignUpViewController.swift
//  HeadCountUser
//
//  Created by Garima Bothra on 07/01/20.
//  Copyright © 2020 Garima Bothra. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

var ref = Database.database().reference();
let customer : Users = Users()
let customer1 : Users = Users()
class SignUpViewController: UIViewController{
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var customIdText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = self
//        GIDSignIn.sharedInstance().signIn()
   //     GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()


       Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil {
                 if UserDefaults.standard.string(forKey: "uid") != nil && Auth.auth().currentUser != nil {
                  //User was already logged in
                    self.performSegue(withIdentifier: "login", sender: Any.self)
                   }

                 UserDefaults.standard.setValue(user?.uid, forKeyPath: "uid")
                
                self.performSegue(withIdentifier: "goToChirpUser", sender: nil)

            }
        }
        // Do any additional setup after loading the view.
    }
    

    @IBAction func signInButtonPressed(_ sender: Any) {
        
        customer1.name = nameText.text!
        customer1.userid = customIdText.text!
       
       
        GIDSignIn.sharedInstance().signIn()
//        GIDSignIn.sharedInstance()?.presentingViewController = self
//               //GIDSignIn.sharedInstance()?.restorePreviousSignIn()
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
