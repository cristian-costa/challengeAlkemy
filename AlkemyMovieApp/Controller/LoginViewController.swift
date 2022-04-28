
//
//  ViewController.swift
//  AlkemyMovieApp
//
//  Created by Cristian Costa on 16/03/2022.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    //IBOutlet
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    //Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //IBAction
    @IBAction func loginButtonPressed(_ sender: Any) {
        if let email = emailTextField.text, let pass = passTextField.text {
            Auth.auth().signIn(withEmail: email, password: pass) { [weak self] authResult, error in
                if let e = error {
                    print(e.localizedDescription)
                } else {
                    let vc = MainViewController()
                    vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
                    
                    let transition: CATransition = CATransition()
                    transition.duration = 0.4
                    transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
                    transition.type = CATransitionType.push
                    transition.subtype = CATransitionSubtype.fromRight
                    self!.view.window!.layer.add(transition, forKey: nil)
                    self!.present(vc, animated: false, completion: nil)
                }
            }
        }
    }

    @IBAction func registerButtonPressed(_ sender: Any) {
        let registerViewController = RegisterViewController()
        registerViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.present(registerViewController, animated: true, completion: nil)
    }
    
    
}
