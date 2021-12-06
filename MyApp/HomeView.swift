//
//  HomeView.swift
//  MyApp
//
//  Created by Jorge  Figueroa on 06/12/21.
//  
//

import Foundation
import UIKit

class HomeView: UIViewController, UINavigationControllerDelegate {

    // MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    var presenter: HomePresenterProtocol?
    var changeColorButton : UIBarButtonItem!
    var image: UIImage?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.presenter?.viewDidLoad()
        self.changeColorButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(changeColor))
        navigationItem.rightBarButtonItem = self.changeColorButton
    }
    
    @objc private func changeColor(){
        let alert = AlertBuilder(style: .actionSheet)
            .setTitle("Cambiar el color del fondo")
            .addAction(title: "Verde") { _ in
                self.presenter?.changeColorView(color: "green")
            }
            .addAction(title: "Naranja") { _ in
                self.presenter?.changeColorView(color: "orange")
            }
            .addAction(title: "Rojo") { _ in
                self.presenter?.changeColorView(color: "red")
            }
            .addAction(title: "Cancelar", handler: nil)
            .build()
        self.present(alert, animated: true, completion: nil)
    }
    
    private func setupTableView(){
        self.tableView.register(FirstTableViewCell.nib(), forCellReuseIdentifier: FirstTableViewCell.id)
        self.tableView.register(SecondTableViewCell.nib(), forCellReuseIdentifier: SecondTableViewCell.id)
        self.tableView.register(ThirdTableViewCell.nib(), forCellReuseIdentifier: ThirdTableViewCell.id)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}

extension HomeView: HomeViewProtocol {
    // TODO: implement view output methods
    
    func changeColorResult(color: UIColor) {
        self.view.backgroundColor = color
    }
    
    func getImageResult(image: UIImage) {
        DispatchQueue.main.async {
            self.image = image
            self.tableView.reloadData()
        }
    }
}

extension HomeView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = self.tableView.dequeueReusableCell(withIdentifier: FirstTableViewCell.id, for: indexPath) as! FirstTableViewCell
            return cell
        }else if indexPath.row == 1{
            let cell = self.tableView.dequeueReusableCell(withIdentifier: SecondTableViewCell.id, for: indexPath) as! SecondTableViewCell
            if let myImage = self.image{
                cell.showImage(image: myImage)
            }
            return cell
        }
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: ThirdTableViewCell.id, for: indexPath) as! ThirdTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            let alert = AlertBuilder(style: .actionSheet)
                .setTitle("Cargar una imagen")
                .addAction(title: "Abrir Camara") { _ in
                    if UIImagePickerController.isSourceTypeAvailable(.camera){
                        let imagePicker = UIImagePickerController()
                        imagePicker.delegate = self
                        imagePicker.sourceType = .camera
                        imagePicker.allowsEditing = true
                        self.present(imagePicker, animated: true, completion: nil)
                    }
                }
                
                .addAction(title: "Abrir galeria") { _ in
                    if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                      let imagePicker = UIImagePickerController()
                      imagePicker.delegate = self
                      imagePicker.sourceType = .photoLibrary
                      imagePicker.allowsEditing = true
                      self.present(imagePicker, animated: true, completion: nil)
                    }
                }
                .addAction(title: "Cancelar", handler: nil)
                .build()
            self.present(alert, animated: true, completion: nil)
            
        }else if indexPath.row == 2{
            self.presenter?.showGraphModule()
        }
    }
    
    
}

extension HomeView: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      if let image = info[.editedImage] as? UIImage {
        self.dismiss(animated: true, completion: { () -> Void in
            let alert = AlertBuilder(style: .alert)
                .setTitle("Subir imagen a storage")
                .addAction(title: "Aceptar") { _ in
                    self.presenter?.uploadImage(image: image)
                }
                .addAction(title: "Cancelar") { _ in
                    //
                }
                .build()
            self.present(alert, animated: true, completion: nil)
        })
        
      }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
      print("Cancelar")
      self.dismiss(animated: true, completion: nil)
    }
    
}
