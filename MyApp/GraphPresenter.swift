//
//  GraphPresenter.swift
//  MyApp
//
//  Created by Jorge  Figueroa on 06/12/21.
//  
//

import Foundation
import UIKit

class GraphPresenter  {
    
    // MARK: Properties
    weak var view: GraphViewProtocol?
    var interactor: GraphInteractorInputProtocol?
    var wireFrame: GraphWireFrameProtocol?
    
}

extension GraphPresenter: GraphPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        let color = UserDefaults.standard.object(forKey: "color")
        if  ((color as? String) != nil){
            let nColor = UIColor(hexString: color as! String)
            self.view?.changeColorResult(color: nColor)
        }
        self.interactor?.getData()
    }
}

extension GraphPresenter: GraphInteractorOutputProtocol {
    // TODO: implement interactor output methods
    
    func sendDataReceive(data: questionsDataModel) {
        var temporallyinfo = InfoModel()
        var finallyInfo = [InfoModel]()
        var temporallychartDataInfoModel = chartDataInfoModel()
        var chartDataInfoModelInfo = [chartDataInfoModel]()
        
        for myData in data.questions {
            temporallyinfo.text = myData.text
            temporallyinfo.total = myData.total
            
            for myData2 in myData.chartData {
                temporallychartDataInfoModel.percetnage = myData2.percetnage
                temporallychartDataInfoModel.text = myData2.text
                chartDataInfoModelInfo.append(temporallychartDataInfoModel)
            }
            temporallyinfo.charData = chartDataInfoModelInfo
            finallyInfo.append(temporallyinfo)
            
        }
        self.view?.receiveData(data: finallyInfo)
        
    }
}
