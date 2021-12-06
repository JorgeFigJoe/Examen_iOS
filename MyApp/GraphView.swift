//
//  GraphView.swift
//  MyApp
//
//  Created by Jorge  Figueroa on 06/12/21.
//  
//

import Foundation
import UIKit

class GraphView: UIViewController {

    // MARK: Properties
    var presenter: GraphPresenterProtocol?
    var info = [InfoModel]()
    @IBOutlet weak var graphTableView: UITableView!
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.navigationItem.title = "Supervición"
        let color = UserDefaults.standard.object(forKey: "color")
        if let nColor = color as? UIColor{
            self.view.backgroundColor = nColor
        }
        self.presenter?.viewDidLoad()
    }
    
    private func setupTableView(){
        self.graphTableView.register(InfoTableViewCell.nib(), forCellReuseIdentifier: InfoTableViewCell.id)
        self.graphTableView.dataSource = self
    }
}

extension GraphView: GraphViewProtocol {
    // TODO: implement view output methods
    
    func receiveData(data: [InfoModel]) {
        DispatchQueue.main.async {
            self.info = data
            self.graphTableView.reloadData()
        }
    }
    
    func changeColorResult(color: UIColor) {
        self.view.backgroundColor = color
    }
}

extension GraphView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.info.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.graphTableView.dequeueReusableCell(withIdentifier: InfoTableViewCell.id, for: indexPath) as! InfoTableViewCell
        cell.showInfo(data: self.info[indexPath.row])
        return cell
    }
    
    
}
