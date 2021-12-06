//
//  GraphWireFrame.swift
//  MyApp
//
//  Created by Jorge  Figueroa on 06/12/21.
//  
//

import Foundation
import UIKit

class GraphWireFrame: GraphWireFrameProtocol {
    
    class func createGraphModule() -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "GraphView")
        if let view = viewController as? GraphView {
            let presenter: GraphPresenterProtocol & GraphInteractorOutputProtocol = GraphPresenter()
            let interactor: GraphInteractorInputProtocol & GraphRemoteDataManagerOutputProtocol = GraphInteractor()
            let localDataManager: GraphLocalDataManagerInputProtocol = GraphLocalDataManager()
            let remoteDataManager: GraphRemoteDataManagerInputProtocol = GraphRemoteDataManager()
            let wireFrame: GraphWireFrameProtocol = GraphWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "GraphView", bundle: Bundle.main)
    }
    
    
    
}
