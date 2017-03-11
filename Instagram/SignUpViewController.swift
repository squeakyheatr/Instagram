//
//  SignUpViewController.swift
//  Instagram
//
//  Created by Robert Mitchell on 3/11/17.
//  Copyright © 2017 Robert Mitchell. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {

    @IBOutlet var passwordTextFField: UITextField!
    @IBOutlet var userNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    @IBAction func haveAccount(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
        dismiss(animated: true, completion: nil)
    }
    

    @IBAction func onSignUp(_ sender: Any) {
        let newUser = PFUser()
        newUser.username = userNameTextField.text
        newUser.password = passwordTextFField.text
        
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if success {
                print("Created User")
                self.performSegue(withIdentifier: "SignUpSegue", sender: nil)
                
            } else {
                let nsError = error as? NSError
                print(error?.localizedDescription)
                if nsError?.code == 202 {
                    print("UserName already taken")
                }
            }
        }
    }


}
