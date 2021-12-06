//
//  HomePresenter.swift
//  MyApp
//
//  Created by Jorge  Figueroa on 06/12/21.
//  
//

import Foundation
import FirebaseDatabase

class HomePresenter  {
    
    // MARK: Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var wireFrame: HomeWireFrameProtocol?
    var ref: DatabaseReference!
    
}

extension HomePresenter: HomePresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        ref = Database.database().reference()
        let color = UserDefaults.standard.object(forKey: "color")
        if  ((color as? String) != nil){
            let nColor = UIColor(hexString: color as! String)
            self.view?.changeColorResult(color: nColor)
        }
    }
    
    func showGraphModule() {
        self.wireFrame?.showGraphModule(from: view!)
    }
    
    func changeColorView(color: String) {
        ref.child("Colors").getData(completion:  { error, snapshot in
          guard error == nil else {
            print(error!.localizedDescription)
            return;
          }
           guard let colorDictionary = snapshot.value as? NSDictionary else {return }
            guard let newColor = colorDictionary[color] as? String else {return}
            print(newColor)
            let nColor = UIColor(hexString: newColor)
            UserDefaults.standard.set(newColor, forKey: "color")
            self.view?.changeColorResult(color: nColor)
            
        });
    }
    
    func uploadImage(image: UIImage) {
        self.interactor?.uploadImage(image: image)
    }
    
}

extension HomePresenter: HomeInteractorOutputProtocol {
    // TODO: implement interactor output methods
    
    func getImageResult(imageData: Data) {
        guard let image = UIImage(data: imageData) else {return}
        self.view?.getImageResult(image: image)
    }
}
