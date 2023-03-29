//
//  SecondViewController.swift
//  Coava
//
//  Created by Junyoung_Hong on 2023/03/13.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var login_email: UITextField!
    @IBOutlet var login_password: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.login_email.delegate = self
        self.login_password.delegate = self
        self.loginButtonLayout(isOn: false)
    }
    
    @IBAction func backLoginPage(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    @IBAction func moveMainPage(_ sender: Any) {
        guard let nextVC3 = self.storyboard?.instantiateViewController(withIdentifier: "CustomTabBarController") as? CustomTabBarController else {
            return
        }
        nextVC3.modalTransitionStyle = .crossDissolve
        nextVC3.modalPresentationStyle = .fullScreen
        self.present(nextVC3, animated: true)
    }
    
    @IBAction func writeEmail(_ sender: UITextField) {
        if sender.text?.isEmpty == true {
            self.loginButtonLayout(isOn: false)
        } else {
            self.loginButtonLayout(isOn: true)
        }
    }
    
    @IBAction func writePassword(_ sender: UITextField) {
        if sender.text?.isEmpty == true {
            self.loginButtonLayout(isOn: false)
        } else {
            self.loginButtonLayout(isOn: true)
        }
    }
    
    func loginButtonLayout(isOn: Bool) {
        switch isOn {
        case true:
            loginButton.isUserInteractionEnabled = true
            loginButton.setImage(UIImage(named: "logInButton_active"), for: .normal)
        case false:
            loginButton.isUserInteractionEnabled = false
            loginButton.setImage(UIImage(named: "logInButton_inactive"), for: .normal)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        login_email.resignFirstResponder()
        login_password.resignFirstResponder()
        return true
    }
    
}
