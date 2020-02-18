//
//  WelcomeViewController.swift
//  TeqniaApp
//
//  Created by Nurudeen Ajayi on 09/11/2019.
//  Copyright © 2019 Nurudeen Ajayi. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var firstNameFieldPassOver : String?
    
    var emailFieldPasswordOver : String?
    
    @IBOutlet weak var welcomeField: UILabel!
    
    @IBOutlet weak var emailField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //when the view is loading, display the text passed from the signup page here
        
//        welcomeField.text = firstNameFieldPassOver
//        emailField.text = emailFieldPasswordOver
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
