//
//  CustomerSignupViewController.swift
//  TeqniaApp
//
//  Created by Nurudeen Ajayi on 18/02/2020.
//  Copyright © 2020 Nurudeen Ajayi. All rights reserved.
//

import UIKit
//make sure u include var window: UIWindow? to app.delegate
import SVProgressHUD

class CustomerSignupViewController: UIViewController {
    
    @IBOutlet var fullname: UITextField!
    @IBOutlet var email: UITextField!
    
    @IBOutlet var phone: UITextField!
    
    @IBOutlet var delivery_address: UITextField!
    
    @IBOutlet var password: UITextField!
    
    @IBOutlet var confirm_password: UITextField!
    var customer: ApiResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        password.isSecureTextEntry = true
        confirm_password.isSecureTextEntry = true
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        //instantiate the api service class
        
    }

    @IBAction func signupButtonPressed(_ sender: UIButton) {
        
        SVProgressHUD.show()
        let service = Service(baseUrl: "http://localhost:8040/")
        let random_str = service.randomString(length: 5)
        
        service.newCustomer(
                    endPoint: "customer/create",
                    parameters: [
                        "name" : fullname.text!, "email" : email.text!, "password": password.text!, "phone_number": phone.text!, "gender": "Male", "alt_address" : delivery_address.text!, "address" : delivery_address.text!, "package_id" : 3, "amount" : 40000, "payment_status" : "success", "mode_of_payment" : "Online", "payment_reference" : 2093293
                    ]
        )
        service.customerCompletionHandler { [weak self] (customer, status, message) in
            if status {
                guard let self = self else{return}
                guard let _customer = customer else{return}
                
                self.customer = _customer
                
                
                self.customerCreated()
                SVProgressHUD.dismiss()
            }
        }
     }
    
    func customerCreated(){
        let message = self.customer?.message ?? "Oops! Something went wrong from the server."
        print(self.customer?.code ?? "sdjsd")
        checkCustomerExist(status_code: self.customer?.code ?? 0)
        print("left the validation scope")
        if self.customer?.status == true {
            Toast.show(message: message, controller: self)
        } else {
            Toast.show(message: message, controller: self)
        }
    }
    
    func checkCustomerExist(status_code : Int)
    {
        if status_code == 403 {
          //suggest user to login
            let alert = UIAlertController(title: "Already have an account?", message: "Would you like to login to your account ?", preferredStyle: .alert)
            
            let loginAction = UIAlertAction(title: "Yes", style: .default) { (UIAlertAction) in
                //perform next step
                print("Already have an account. User clicked yes!")
                
            }
            
            alert.addAction(UIAlertAction(title : "No", style: .cancel) { (UIAlertAction) in
                print("No account yet.")
            })
            
            alert.addAction(loginAction)
            //display the pop up
            self.present(alert, animated: true)
        }
    }
    
    func setupAlertAction(display_message : String, title : String)
    {
        let alert = UIAlertController(title: title, message: display_message, preferredStyle: .alert)
    }
    
//    func displayLoginScreenWithUserEmail() -> UIViewController {
//        print("jsd")
//    }
}
