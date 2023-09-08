//
//  FeedViewController.swift
//  ParsePictureApp
//
//  Created by Safa on 7.09.2023.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
 
    
 
    

    @IBOutlet weak var tableView: UITableView!
    
    var postArray : [Post]?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        fetchDatas()

    }
    
    
    @objc func fetchDatas () {
        
        //Append islemi olmadigi icin buna gerek olmasa da yine de onlem olsun diye mukerrer veri gosterilmemesini garanti altina aliyoruz
        postArray?.removeAll(keepingCapacity: false)
        
        //Filtreleme yapacak olsak su sekil bir kod yazabilirdik;
        /*
        let constraint: QueryConstraint = "username" == "safa@hotmail.com"
        let query = Profile.query(constraint)
         */
        
        
        //Tarih siralamasina gore azalan sekilde tum verileri getir diyoruz,
        let query = Post.query().order([.descending("createdAt")])
     
        //Sonuclari aliyoruz
        try? query.find{ result in
            
            switch result {
            //Veriler geldiyse
            case .success(let array):
                
                //Veri dizisi bos mu
                if array.count > 0 {
                    
                    //Veritabanindan gelen [Post] dizisini bizim olusturdugumuz postArray e ata
                    self.postArray = array
                
                    //Veriler geldikten sonra asenkron olarak tablo listesini yenile
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }

            //Veriler gelirken bir sorun olustuysa
            case .failure(let error):
                self.errorMessage(title: "Error!", message: error.localizedDescription)
            }
            
        }
        
    }
    
    
    
    func errorMessage (title : String, message : String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let button = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(button)
        present(alert, animated: true)
        
    }
    
    
    

    override func viewWillAppear(_ animated: Bool) {
        
        //FeedViewController ekranda goruldugunde NotificationCenter a observer olarak katilarak. "posted" adinda bir mesajin yayinlanip yayinlanmadigina bak. yayinlandiysa fetchDatas() fonksiyonunu tetikleyerek tablo listesini yenile
        NotificationCenter.default.addObserver(self, selector: #selector(fetchDatas), name:  NSNotification.Name("posted"), object: nil)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray == nil ? 0 : postArray?.count as! Int
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Custom Cell olustur
        let cell  =
        tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedTableViewCell
        
        //Username ekrana bas
        cell.usernameLabel.text = postArray?[indexPath.row].username
        
        //Yorumu ekrana bas
        cell.commentLabel.text = postArray?[indexPath.row].comment
        
        //Databaseden Data formatinda gelen veriyi UIImage formatina cevir ve ekrana resim olarak bas
        if let data = postArray?[indexPath.row].imageData as? Data {
            cell.feedImageView.image = UIImage(data: data)
        }
        
        return cell
    }
}
