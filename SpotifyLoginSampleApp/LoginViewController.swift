//
//  LoginViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by 강루비 on 2022/03/02.
//

import UIKit

class LoginViewController: UIViewController {

  @IBOutlet var emailLoginButton: UIButton!
  @IBOutlet var googleLoginButton: UIButton!
  @IBOutlet var appleLoginButton: UIButton!
  
  override func viewDidLoad() {
      super.viewDidLoad()
      
      [emailLoginButton, googleLoginButton, appleLoginButton].forEach {
        $0?.layer.borderWidth = 1
        $0?.layer.borderColor = UIColor.white.cgColor
        $0?.layer.cornerRadius = 30
      }
    }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    // navigationbar 숨기기
    navigationController?.navigationBar.isHidden = true
  }
    
  @IBAction func googleLoginButtonTap(_ sender: UIButton) {
  }
  
  @IBAction func appleLoginButtonTap(_ sender: UIButton) {
  }
}
