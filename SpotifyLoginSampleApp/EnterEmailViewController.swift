//
//  EmterEmailViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by 강루비 on 2022/03/02.
//

import UIKit
import FirebaseAuth

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
    // Firebase 이메일/비밀번호 인증
    let email = emailTextField.text ?? ""
    let password = passwordTextField.text ?? ""
    
    // 신규 사용자 생성
    Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
      guard let self = self else { return }
      
      if let error = error {
        let code = (error as NSError).code
        switch code {
        case 17007: // 이미 가입한 계정일 때
          self.loginUser(withEmail: email, password: password)
        default:
          self.errorMessageLabel.text = error.localizedDescription
        }
      } else {
        self.showMainViewController()
      }
    }
  }
  
  private func showMainViewController() {
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    let mainViewController = storyboard.instantiateViewController(withIdentifier: "MainViewController")
    mainViewController.modalPresentationStyle = .fullScreen
    navigationController?.show(mainViewController, sender: nil)
  }
  
  private func loginUser(withEmail email: String, password: String) {
    Auth.auth().signIn(withEmail: email, password: password) { [weak self] _, error in
      guard let self = self else { return }
      
      if let error = error {
        self.errorMessageLabel.text = error.localizedDescription
      } else {
        self.showMainViewController()
      }
    }
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

