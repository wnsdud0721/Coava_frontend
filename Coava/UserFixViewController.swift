//
//  UserFixViewController.swift
//  Coava
//
//  Created by Junyoung_Hong on 2023/04/18.
//

import UIKit

class UserFixViewController: UIViewController {

    let picker = UIImagePickerController()
    
    @IBOutlet var userImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
        
        userImage.layer.cornerRadius = userImage.frame.height/2
        userImage.clipsToBounds = true
    }
    
    @IBAction func changeProfile(_ sender: Any) {
        
        let alert = UIAlertController(title: "원하는 타이틀", message: "원하는 메시지", preferredStyle: .actionSheet)
        
        let library = UIAlertAction(title: "사진앨범", style: .default) { (action) in self.openLibrary() }
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(library)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    func openLibrary() {
        picker.sourceType = .photoLibrary
        present(picker, animated: false, completion: nil)
    }
    
    @IBAction func backUser(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    

}

extension UserFixViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            userImage.image = image
            print(info)
        }
        dismiss(animated: true, completion: nil)
    }
}
