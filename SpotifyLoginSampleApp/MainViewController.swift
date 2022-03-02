//
//  MainViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by 강루비 on 2022/03/02.
//

import UIKit

class MainViewController: UIViewController {

  @IBOutlet var welcomeLabel: UILabel!
  
  override func viewDidLoad() {
      super.viewDidLoad()
      
      navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    navigationController?.navigationBar.isHidden = true
  }

  @IBAction func logoutButtonTap(_ sender: UIButton) {
    self.navigationController?.popToRootViewController(animated: true)
  }
}