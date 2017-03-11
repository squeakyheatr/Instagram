//
//  SignInViewController.swift
//  Instagram
//
//  Created by Robert Mitchell on 3/5/17.
//  Copyright © 2017 Robert Mitchell. All rights reserved.
//

import UIKit
import Parse
class SignInViewController: UIViewController {

    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextFField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func onSignIn(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: userNameTextField.text!, password: passwordTextFField.text!) { (user: PFUser?, error: Error?) in
            if user != nil{
                self.performSegue(withIdentifier: "LogInSegue", sender: nil)
            print("Logged In")
            } else {
                print(error?.localizedDescription)
            }
        }
    }

        
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


