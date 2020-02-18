//
//  ViewController.swift
//  TeqniaApp
//
//  Created by Nurudeen Ajayi on 06/11/2019.
//  Copyright © 2019 Nurudeen Ajayi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fnameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func alreadyHaveAnAccountPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToLoginScreen", sender: self)
    }
    
    @IBAction func submitButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToWelcomeScreen", sender: self)
    }
    
    //call the prepare for segue method
    //this default method gets executed before the next action happens
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToWelcomeScreen" {
            //more or less like creting an instance of the WelcomeViewController because segue.destination datatype is a UIViewController and remember, our WelcomeViewController extended the base class of UIViewController which means we can tap into the WelcomeViewController directly by telling the compiler we want to tap into the WelcomeViewController
            let welcomeVC = segue.destination as! WelcomeViewController
            
            welcomeVC.firstNameFieldPassOver = fnameTextField.text!
                
            welcomeVC.emailFieldPasswordOver = emailTextField.text!
            
            
            
        }
    }
}

