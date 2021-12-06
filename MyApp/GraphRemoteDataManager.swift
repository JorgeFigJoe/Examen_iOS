//
//  GraphRemoteDataManager.swift
//  MyApp
//
//  Created by Jorge  Figueroa on 06/12/21.
//  
//

import Foundation

class GraphRemoteDataManager:GraphRemoteDataManagerInputProtocol {

    var remoteRequestHandler: GraphRemoteDataManagerOutputProtocol?
    
    func getData() {
        self.getDataInfo()
    }
    
   private func getDataInfo() {
        let urlSearch = URL(string: "https://us-central1-bibliotecadecontenido.cloudfunctions.net/helloWorld")!
        let session = URLSession.shared
        var request = URLRequest(url: urlSearch)
        request.httpMethod = "GET"
        session.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil, let respuesta = response as? HTTPURLResponse else {return}
            if respuesta.statusCode == 200 {
                do{
                    let decoder = JSONDecoder()
                    let dataInfo = try decoder.decode(questionsDataModel.self, from: data)
                    print(dataInfo)
                    self.remoteRequestHandler?.sendDataReceive(data: dataInfo)
                }catch{
                    print(error.localizedDescription)
                }
            }else{
                
            }
        }.resume()
    }
    
}
