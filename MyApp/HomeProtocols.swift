//
//  HomeProtocols.swift
//  MyApp
//
//  Created by Jorge  Figueroa on 06/12/21.
//  
//

import Foundation
import UIKit

protocol HomeViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: HomePresenterProtocol? { get set }
    func changeColorResult(color: UIColor)
    func getImageResult(image: UIImage)
}

protocol HomeWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createHomeModule() -> UIViewController
    func showGraphModule(from view: HomeViewProtocol)
}

protocol HomePresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var wireFrame: HomeWireFrameProtocol? { get set }
    func showGraphModule()
    func changeColorView(color: String)
    func viewDidLoad()
    func uploadImage(image: UIImage)
}

protocol HomeInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func getImageResult(imageData: Data)
}

protocol HomeInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: HomeInteractorOutputProtocol? { get set }
    var localDatamanager: HomeLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: HomeRemoteDataManagerInputProtocol? { get set }
    func uploadImage(image: UIImage)
}

protocol HomeDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol HomeRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: HomeRemoteDataManagerOutputProtocol? { get set }
    func uploadImage(image: UIImage)
}

protocol HomeRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    func getImageResult(imageData: Data)
}

protocol HomeLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
