//
//  EmterEmailViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by 강루비 on 2022/03/02.
//

import UIKit

class EnterEmailViewController: UIViewController {
  
  @IBOutlet var emailTextField: UITextField!
  @IBOutlet var passwordTextField: UITextField!
  @IBOutlet var errorMessageLabel: UILabel!
  @IBOutlet var nextButton: UIButton!
  

    override func viewDidLoad() {
      super.viewDidLoad()
      
      nextButton.layer.cornerRadius = 30
      nextButton.isEnabled = false
      
      emailTextField.delegate = self
      passwordTextField.delegate = self
      
      // 새로 화면을 켰을 때 처음 커서가 가도록
      emailTextField.becomeFirstResponder()
    }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    // navigationbar 보이기
    navigationController?.navigationBar.isHidden = false
    navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
  }
    
  @IBAction func nextButtonTap(_ sender: UIButton) {
    
  }
  
}

extension EnterEmailViewController:UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    view.endEditing(true)
    
    return false
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    let isEmailEmpty = emailTextField.text == ""
    let isPasswordEmpty = passwordTextField.text == ""
    
    nextButton.isEnabled = !isEmailEmpty && !isPasswordEmpty
  }
}

