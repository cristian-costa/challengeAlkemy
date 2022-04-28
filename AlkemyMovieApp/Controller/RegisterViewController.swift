//
//  RegisterViewController.swift
//  AlkemyMovieApp
//
//  Created by Cristian Costa on 26/03/2022.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    //IBOulet
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    //Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //IBAction
    @IBAction func loginButtonPressed(_ sender: Any) {
        let loginViewController = LoginViewController()
        loginViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.present(loginViewController, animated: true, completion: nil)
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        if let email = emailTextField.text, let pass = passTextField.text {
            Auth.auth().createUser(withEmail: email, password: pass) { authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    let loginViewController = LoginViewController()
                    loginViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
                    self.present(loginViewController, animated: true, completion: nil)
                }
            }
        }
    }
}
