//
//  HomeInteractor.swift
//  MyApp
//
//  Created by Jorge  Figueroa on 06/12/21.
//  
//

import Foundation
import UIKit

class HomeInteractor: HomeInteractorInputProtocol {
    // MARK: Properties
    weak var presenter: HomeInteractorOutputProtocol?
    var localDatamanager: HomeLocalDataManagerInputProtocol?
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol?
    
    func uploadImage(image: UIImage) {
        self.remoteDatamanager?.uploadImage(image: image)
    }

}

extension HomeInteractor: HomeRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
    
    func getImageResult(imageData: Data) {
        self.presenter?.getImageResult(imageData: imageData)
    }
}
