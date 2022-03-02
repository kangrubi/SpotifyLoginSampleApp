//
//  EmterEmailViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by 강루비 on 2022/03/02.
//

import UIKit

class EmterEmailViewController: UIViewController {
  
  @IBOutlet var emailTextField: UITextField!
  @IBOutlet var passwordTextField: UITextField!
  @IBOutlet var errorMessageLabel: UILabel!
  @IBOutlet var nextButton: UIButton!
  

    override func viewDidLoad() {
      super.viewDidLoad()
      
      nextButton.layer.cornerRadius = 30
      nextButton.isEnabled = false
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
