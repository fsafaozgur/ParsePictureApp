//
//  UploadViewController.swift
//  ParsePictureApp
//
//  Created by Safa on 7.09.2023.
//

import UIKit
import ParseSwift

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var uploadButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Ekranin herhangi biryeri tiklaninca klavyeyi kapat
        let keyGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        view.addGestureRecognizer(keyGestureRecognizer)
        
        //Default resmin ustune basilinca resim secme islemine gec
        imageView.isUserInteractionEnabled = true
        let imageGEstureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageSelect))
        imageView.addGestureRecognizer(imageGEstureRecognizer)
        
        uploadButton.isEnabled = true
    }
    

    //Upload tusuna basilinca
    @IBAction func uploadClicked(_ sender: Any) {
        
        //Yukleneme yapilana kadar sayfa degismedigi icin kullanici tiklayamadigini sanip tekrar tekrar basmasin diye
        uploadButton.isEnabled = false
        
        //Uzak databaseye yuklenecek resmi Data formatina ceviriyoruz
        let data = imageView.image?.jpegData(compressionQuality: 0.5)
        
        if let data = data {
            
            if User.current != nil {
                if let comment = commentTextField.text as? String {
                    if let user = User.current?.username as? String {
                        
                        //Veritabanina yukleme yapacagimiz verileri, Post turunden objeye giriyoruz
                        let  post = Post(comment: comment, username: user, imageData: data)
                        

                            do {
                                //Objedeki verileri veritabanina yaziyoruz
                                try post.save()
                            }catch {
                                //Hata alirsak ekrana veriyoruz
                                let alert  = UIAlertController(title: "Error!", message: "Please try it again later", preferredStyle: UIAlertController.Style.alert)
                                let button = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                                    alert.addAction(button)
                                self.present(alert, animated: true)
                                
                            }
                        
                        
                        
                        //Upload ekranini baslangic durumuna donduruyoruz
                        commentTextField.text = ""
                        uploadButton.isEnabled = true
                        imageView.image = UIImage(named: "image-select")
                        tabBarController?.selectedIndex = 0
                        
                        //Veriyi kaydettigimizi NotificationCenter ile yayinliyoruz
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "posted"), object: nil)
                        
                        
                    }
                }
            }
        }
        
        
        
        
        
    }
    
    
    //Galeriden resim sec
    @objc func imageSelect(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
        
    }
    
    
    //Galeriden resim secilince devreye giren fonksiyon
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as! UIImage
        uploadButton.isEnabled = true
        self.dismiss(animated: true)
    }
    
    //Klavyeyi kapat
    @objc func closeKeyboard () {
        view.endEditing(true)
    }
    
}




