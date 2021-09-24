//
//  ViewController.swift
//  MyFirstProject
//
//  Created by apple on 23/09/21.
//  Copyright © 2021 apple. All rights reserved.
//

import UIKit
import FBSDKLoginKit


class ViewController: UIViewController {

    var userEmail : [String] = []
    var userPassword : [String] = []
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var emailId: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var bottonView1: UIView!
    
    @IBOutlet weak var bottonView2: UIView!
    
    @IBOutlet weak var bottonView3: UIView!
    
    
    
    
    
    @IBAction func loginTapped(_ sender: UIButton) {
       
        
                for mailId in userEmail  {
            
                for paSS in userPassword {
                
                if emailId.text == "" && password.text == ""  {
                  
                    alermsg(msg: "Please provide emailID and Password")
                }
                else if emailId.text != mailId && password.text != paSS  {
                    alermsg(msg: "Invalid User")
                }
                    
                else if emailId.text == mailId  && password.text == paSS {
                          
                let viewcontroller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "HomePage") as? HomeViewController
                       //view self.present(viewcontroller, animated: true, completion: nil)
                self.navigationController?.pushViewController(viewcontroller!, animated: true)
                    
                }
                }
           
            
                }
       
        
        
    }
    func alermsg(msg: String) {
        let alert = UIAlertController(title: "ALERT", message: msg, preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        let ok1 = UIAlertAction(title: "OK", style: .default) { (action) in
            self.emailId.text = ""
            self.password.text = ""
        }
        alert.addAction(ok1)
   
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        //making view1 as rounded
        self.bottonView1.layer.cornerRadius =  bottonView1.frame.size.height/2
        self.bottonView1.layer.masksToBounds = true
        
        
        //setting view2 as rounded
        self.bottonView2.layer.cornerRadius =  bottonView2.frame.size.height/2
        self.bottonView2.layer.masksToBounds = true
        
        //making view3 as rounded
        self.bottonView3.layer.cornerRadius =  bottonView3.frame.size.height/2
        self.bottonView3.layer.masksToBounds = true
        
        
        //adding image/icon to the left view of the 1st textfield
        let mail = UIImageView(image: UIImage(named: "mail"))
        if let size = mail.image?.size {
           mail.frame = CGRect(x: 0.0, y: 0.0, width: 3 , height: 3)
        }
        mail.contentMode = UIView.ContentMode.center
         //adding mail created to the left view of the email id text field
        self.emailId.leftView = mail
          //setting this view mode of text field as unless editing the leftview mode vanishes when user start to add text
        self.emailId.leftViewMode = UITextField.ViewMode.unlessEditing
        
        
        
          //adding image/icon to the left view of the 2nd textfield
        let imgpassword = UIImageView(image: UIImage(named: "password"))
        //assigning optional size value to the new constant using if let
        if let size = imgpassword.image?.size {
            imgpassword.frame = CGRect(x: 0.0, y: 0.0, width: 3 , height: 3)
        }
        // setting password contentmode to center
        imgpassword.contentMode = UIView.ContentMode.center
        //adding imgpassword created to the left view of the password text field
        self.password.leftView = imgpassword
        //setting this view mode of text field as unless editing the leftview mode vanishes when user start to add text
        self.password.leftViewMode = UITextField.ViewMode.always
        
        
        //adding image/icon to the right view of the 2nd textfield
        let securedpass = UIImageView(image: UIImage(named: "securedtext"))
        if let size = securedpass.image?.size {
                securedpass.frame = CGRect(x: 0.0, y: 0.0, width: 3 , height: 3)
        }
        securedpass.contentMode = UIView.ContentMode.center
        self.password.rightView = securedpass
        //the overlaying image will always display in the textfield's right view
        self.password.rightViewMode = UITextField.ViewMode.always
        
        
        
        
        let emailArray = ["varshini041994@gmail.com", "charmee013@gmail.com", "amrutha041994@gmail.com", "lishika22@gmail.com"]
      
        defaults.set(emailArray, forKey:"SavedEArray")
        let newEarray = defaults.object(forKey:"SavedEArray") as? [String] ?? [String]()
        print(newEarray)
         userEmail = newEarray
       // let newarray = defaults.array(forKey:"SavedEArray”)

        
        let passwordArray = ["varshini@123", "charmee@123", "amrutha@123", "lishika@123"]
        defaults.set(passwordArray, forKey: "SavedPArray")
        let newParray = defaults.object(forKey:"SavedPArray") as? [String] ?? [String]()
        print(newParray)
        userPassword = newParray
        
        //facebook login custom button
        let loginButton = FBLoginButton()
        loginButton.frame = CGRect(x: 20, y: 580, width: 374, height: 35)
        view.addSubview(loginButton)
        loginButton.permissions = ["public_profile", "email"]

        // Observe access token changes
        // This will trigger after successfully login / logout
        NotificationCenter.default.addObserver(forName: .AccessTokenDidChange, object: nil, queue: OperationQueue.main) { (notification) in
            
            // Print out access token
        print("FB Access Token: \(String(describing: AccessToken.current?.tokenString))")
        
        
    }
    }

    override func viewDidDisappear(_ animated: Bool) {
                navigationController?.navigationBar.isHidden = false

    }


}


