//
//  GraphProtocols.swift
//  MyApp
//
//  Created by Jorge  Figueroa on 06/12/21.
//  
//

import Foundation
import UIKit

protocol GraphViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: GraphPresenterProtocol? { get set }
    func receiveData(data: [InfoModel])
    func changeColorResult(color: UIColor)
}

protocol GraphWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createGraphModule() -> UIViewController
}

protocol GraphPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: GraphViewProtocol? { get set }
    var interactor: GraphInteractorInputProtocol? { get set }
    var wireFrame: GraphWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol GraphInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func sendDataReceive(data: questionsDataModel)
}

protocol GraphInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: GraphInteractorOutputProtocol? { get set }
    var localDatamanager: GraphLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: GraphRemoteDataManagerInputProtocol? { get set }
    func getData()
}

protocol GraphDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol GraphRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: GraphRemoteDataManagerOutputProtocol? { get set }
    func getData()
}

protocol GraphRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    func sendDataReceive(data: questionsDataModel)
}

protocol GraphLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
