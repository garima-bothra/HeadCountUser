//
//  LoginViewController.swift
//  HeadCountUser
//
//  Created by Garima Bothra on 02/02/20.
//  Copyright © 2020 Garima Bothra. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginName: UITextField!
    @IBOutlet weak var loginUID: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        customer.name = loginName.text!
        customer.userid = loginUID.text!
       referuser.child("name").setValue(customer.name)
        referuser.child("user_id").setValue(customer.userid)
        performSegue(withIdentifier: "gotoChirp", sender: Any.self)
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
