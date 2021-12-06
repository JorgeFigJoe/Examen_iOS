//
//  ServiceModel.swift
//  MyApp
//
//  Created by Jorge  Figueroa on 06/12/21.
//

import Foundation

struct questionsBasicDataModel: Decodable{
    let total: Int
    let text: String
    let chartData: [chartDataModel]
}

struct chartDataModel: Decodable{
    let text: String
    let percetnage: Int
}

struct questionsDataModel: Decodable{
    let questions: [questionsBasicDataModel]
        
        enum CodingKeys: String, CodingKey {
            case questions
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.questions = try container.decode([questionsBasicDataModel].self, forKey: .questions)
        }
}
