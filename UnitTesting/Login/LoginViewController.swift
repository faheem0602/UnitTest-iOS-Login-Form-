//
//  LoginViewController.swift
//  UnitTesting
//
//  Created by ahmad on 28/10/2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginFormStackView: UIStackView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var loginViewModel: LoginViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginViewModel = LoginViewModel(model: LoginModel(email: "", password: ""))
    }
    
    static func getVC(with loginViewModel: LoginViewModel) -> LoginViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        vc.loginViewModel = loginViewModel
        return vc
    }

    @IBAction func loginAction(_ sender: UIButton) {
        //if let viewModel = loginViewModel {
            
            if loginViewModel.isValidEntries {
                let handler = WebServiceHandler.sharedInstance
                handler.login()
                if handler.isLoadingData {
                    // UI Test Pass move to Sucess vc
                }
            } else {
                print("Please enter valid Email & password")
            }
        //}
        
    }
    
    @IBAction func loginAction1(_ sender: UIButton) {
        
    }
}

