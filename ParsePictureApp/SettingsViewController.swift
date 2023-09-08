//
//  SettingsViewController.swift
//  ParsePictureApp
//
//  Created by Safa on 7.09.2023.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func logoutClicked(_ sender: Any) {
        User.logout { result in
            switch result {
                //Cikis islemi basarisiz ise kullaniciya hata mesaji yolla
                case .failure(let error):
                    let alert = UIAlertController(title: "Error!", message: error.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    let button = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                    alert.addAction(button)
                    self.present(alert, animated: true)
                //Cikis islemi basarili ise Giris ekranina don
                case .success():
                self.performSegue(withIdentifier: "toVC", sender: nil)
            }
        
        
        }
    }
}
