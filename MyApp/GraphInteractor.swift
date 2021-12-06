//
//  GraphInteractor.swift
//  MyApp
//
//  Created by Jorge  Figueroa on 06/12/21.
//  
//

import Foundation

class GraphInteractor: GraphInteractorInputProtocol {
    // MARK: Properties
    weak var presenter: GraphInteractorOutputProtocol?
    var localDatamanager: GraphLocalDataManagerInputProtocol?
    var remoteDatamanager: GraphRemoteDataManagerInputProtocol?
    
    func getData() {
        self.remoteDatamanager?.getData()
    }

}

extension GraphInteractor: GraphRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
    
    func sendDataReceive(data: questionsDataModel) {
        self.presenter?.sendDataReceive(data: data)
    }
}
