//
//  LoginViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by 강루비 on 2022/03/02.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
      super.viewDidLoad()
    }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    // navigationbar 숨기기
    navigationController?.navigationBar.isHidden = true
  }
    

}
