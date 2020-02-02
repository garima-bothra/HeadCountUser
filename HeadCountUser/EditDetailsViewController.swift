//
//  EditDetailsViewController.swift
//  HeadCountUser
//
//  Created by Garima Bothra on 02/02/20.
//  Copyright © 2020 Garima Bothra. All rights reserved.
//

import UIKit

class EditDetailsViewController: UIViewController {
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var nameConfirmText: UITextField!
    @IBOutlet weak var uniqueIDtext: UITextField!
    @IBOutlet weak var confirmIDtext: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func changeDetailsButtonPressed(_ sender: Any) {
        var n=0,id=0
        if(nameText.text! == nameConfirmText.text!)&&(nameText.text != ""){
            referuser.child("name").setValue(nameText.text)
            customer.name = nameText.text!
            n=1
        }
        if (uniqueIDtext.text != "") && (uniqueIDtext.text! == confirmIDtext.text!){
            referuser.child("user_id").setValue(uniqueIDtext.text!)
            customer.userid = uniqueIDtext.text!
            id = 1
        }
        if(n==1){
            if(id == 1){
                ProgressHUD.showSuccess("Name and Id updated!")
            }
            else{
                ProgressHUD.showSuccess("Name is updated!")
            }
        }
        else{
            if(id == 1){
                ProgressHUD.showSuccess("Id is updated!")
            }
            else{
                ProgressHUD.showError("No updates!")
            }
        }
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
