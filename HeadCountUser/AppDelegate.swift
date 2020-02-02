//
//  AppDelegate.swift
//  HeadCountUser
//
//  Created by Garima Bothra on 07/01/20.
//  Copyright © 2020 Garima Bothra. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn


var uid : String = ""
var mail : String = ""
var referuser = ref
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

        

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        // Override point for customization after application launch.
        return true
    }
    // MARK: GIDSignInProtocolFunctions
    @available(iOS 9.0, *)
    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any])
      -> Bool {
      return GIDSignIn.sharedInstance().handle(url)
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return GIDSignIn.sharedInstance().handle(url)
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
      // ...
      if let error = error {
        if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
             print("The user has not signed in before or they have since signed out.")
           } else {
             print("\(error.localizedDescription)")
           }
        return
      }

      guard let authentication = user.authentication else { return }
      let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                        accessToken: authentication.accessToken)
         mail = user.profile.email
      Auth.auth().signIn(with: credential) { (authResult, error) in
        if let error = error {
          // ...
          return
        }
        // User is signed in
        // ...
        let c=0
        uid = Auth.auth().currentUser!.uid
        referuser = ref.child("users").child(uid)
        print(referuser)
        print("123")
        referuser.observeSingleEvent(of: .value, with: { (snapshot) in
                                 let value = snapshot.value as? NSDictionary
                                 customer.name = value?["name"] as? String ?? ""
                                 customer.mail = value?["email"] as? String ?? ""
                                 customer.userid = value?["user_id"] as? String ?? ""
            
            print("!")
                         }) { (error) in
                             print(error.localizedDescription)
                         }
        
      }
    }

    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
  

}



