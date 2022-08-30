//
//  ViewController.swift
//  testSwiftyForms
//
//  Created by Charles Oxendine on 8/23/22.
//

import UIKit
import EasyFormsPackage

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        showFormViewControllerTest()
    }
    
    func showFormViewControllerTest() {
        let usernameFormField = FormField(fieldTitle: "Username", fieldID: "0", fieldType: .textEntry)
        let passwordFormField = FormField(fieldTitle: "Password", fieldID: "1", fieldType: .textEntry)
        let rememberMeFormField = FormField(fieldTitle: "Remember Me", fieldID: "2", fieldType: .toggleButton)
            
        EasyFormsPackage.presentFormViewController(parentViewController: self, fields: [usernameFormField, passwordFormField, rememberMeFormField])
    }
}

extension ViewController: FormViewControllerDelegate {
    
    func didSubmit(fields: [FormField], validateFieldEntries: (Bool, String?) -> ()) {
        let usernameResponse = fields[0].textResponse
        let passwordResponse = fields[1].textResponse
        let rememberMeResponse = fields[2].toggleReponse
        
        guard usernameResponse != nil &&
                passwordResponse != nil else {
            validateFieldEntries(false, "Please fill in both fields.")
            return
        }
        
        if rememberMeResponse == true {
            // Do something with this
        }
        
        validateFieldEntries(true, nil)
    }
    
    func didCancel() {
        print("FORM CANCELED")
    }

}
