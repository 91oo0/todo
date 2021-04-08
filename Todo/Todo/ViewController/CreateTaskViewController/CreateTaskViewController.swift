//
//  CreateTaskViewController.swift
//  Todo
//
//  Created by kotaro.oka on 2021/04/06.
//

import UIKit

class CreateTaskViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        setupKeyToolBar()
    }
    
    @IBAction func submitButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    
    @IBAction func didTapCloseButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    func setupKeyToolBar() {
        
        let keyToolbar = UIToolbar()
        keyToolbar.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40)
        keyToolbar.barStyle = .default

        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneButton = UIBarButtonItem(title: "完了", style: .done, target: self, action: #selector(closeKeyboard))

        keyToolbar.items = [spacer, doneButton]

        textField.inputAccessoryView = keyToolbar
    }
    
    @objc func closeKeyboard() {
        textField.endEditing(true)
    }
}
