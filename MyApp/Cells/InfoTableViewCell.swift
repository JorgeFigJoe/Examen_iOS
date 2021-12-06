//
//  InfoTableViewCell.swift
//  MyApp
//
//  Created by Jorge  Figueroa on 06/12/21.
//

import UIKit
import Charts

class InfoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var graphPieChart: PieChartView!
    static let id = "InfoTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "InfoTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupPieChart(){
        self.graphPieChart.chartDescription?.enabled = false
        self.graphPieChart.drawHoleEnabled = false
        self.graphPieChart.rotationAngle = 0
    }
    
    func showInfo(data: InfoModel){
        self.infoLabel.text = data.text
        
        var entries: [PieChartDataEntry] = Array()
        
        if data.charData != nil {
            for myData in data.charData!{
                entries.append(PieChartDataEntry(value: Double(myData.percetnage!),label: myData.text!))
            }
        }
        
        let dataSet = PieChartDataSet(entries: entries, label: "")
        dataSet.drawValuesEnabled = false
        self.graphPieChart.data = PieChartData(dataSet: dataSet)
    }
    
    
}
