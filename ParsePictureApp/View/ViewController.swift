//
//  ViewController.swift
//  ParsePictureApp
//
//  Created by Safa on 7.09.2023.
//

import UIKit
import ParseSwift

class ViewController: UIViewController {
    
    

    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //Kullanici girisi
    @IBAction func loginClicked(_ sender: Any) {
        
        //TextField lar bos degil ise
        if usernameTextField.text != "" && passwordTextField.text != "" {
            
            //Giris yapmayi dene
            User.login(username: usernameTextField.text!, password: passwordTextField.text!) { result in
                switch result{
                //Giris basarili ise
                case .success(let loginUser):
                    //TabBar a haliyle ilk item olan Feed sayfasina git
                    self.performSegue(withIdentifier: "toTabBar", sender: nil)
                //Giris basatisiz ise kullanicia hata mesaji gonder
                case .failure(let error):
                    self.errorMessage(title: "Error!", message: error.localizedDescription)
                }
            }
            
        }else {
            //TextField lar bos ise kullaniciya hata mesaji goster
            errorMessage(title: "Error!", message:  "Please enter email and password")
        }
        

    }
    
    //Kullanici kaydi
    @IBAction func signupClicked(_ sender: Any) {
        
        //TextField lar bos degil ise
        if usernameTextField.text != "" && passwordTextField.text != "" {
            
            //Veritabanina yukleme yapmak uzere User turunde bir obje uret ve TextFieldlarda yer alan verilerle doldur
            let user = User(username: usernameTextField.text!, password: passwordTextField.text!)
            
            do{
                //Kayit yapmayi dene
                try user.signup()
            }catch{
                //Kayit basarisiz ise kullaniciya hata mesaji goster
                errorMessage(title: "Error!", message:  error.localizedDescription)
            }
            
            //Kayit islemi basarili ise TabBar a haliyle ilk item olan Feed sayfasina git
            performSegue(withIdentifier: "toTabBar", sender: nil)
            
        }else {
            //TextField lar bos ise kullaniciya hata mesaji goster
            errorMessage(title: "Error!", message:  "Please enter email and password")
        }
        
    }
    
    
    
    func errorMessage(title : String, message : String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let button = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(button)
        self.present(alert, animated: true)
        
        
    }
    
    
}







