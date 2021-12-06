//
//  HomeRemoteDataManager.swift
//  MyApp
//
//  Created by Jorge  Figueroa on 06/12/21.
//  
//

import Foundation
import UIKit
import FirebaseStorage

class HomeRemoteDataManager:HomeRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol?
    private let storage = Storage.storage().reference()
    
    func uploadImage(image: UIImage) {
        guard let myImage = image.jpegData(compressionQuality: 0.8) else {return}
        
        storage.child("images/File.jpeg").putData(myImage, metadata: nil) { _, error in
            guard error == nil else {return}
            
            self.storage.child("images/File.jpeg").downloadURL { url, error in
                guard let url = url, error == nil else {return}
                self.getImageFromURL(url: url)
            }
        }
        
    }
    
    private func getImageFromURL(url: URL){
        let session = URLSession.shared
        
        session.dataTask(with: url) { data, urlResponse, error in
            guard let data = data, error == nil else { return }
            print(urlResponse?.suggestedFilename ?? url.lastPathComponent)
            DispatchQueue.main.async() { [weak self] in
                self?.remoteRequestHandler?.getImageResult(imageData: data)
            }
        }.resume()
        }
        
    

    }
