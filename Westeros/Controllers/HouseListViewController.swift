//
//  HouseListViewController.swift
//  Westeros
//
//  Created by Diego Gay Saez on 15/02/2018.
//  Copyright © 2018 Diego Gay Saez. All rights reserved.
//

import UIKit

let HOUSE_DID_CHANGE_NOTIFICATION_NAME = "HouseDidChange"
let HOUSE_KEY = "HouseKey"
let LAST_HOUSE = "LAST_HOUSE"

// Por convención, el delegado se llama como la clase-Delegate
// Solo se implementará para clases. Se puede poner AnyObject en lugar de class
protocol HouseListViewControllerDelegate: class {
    // should, will, did
    func houseListViewController(_ vc: HouseListViewController, didSelectHouse house: House)
}

class HouseListViewController: UITableViewController {
    
    // MARK: - Properties
    let model: [House]
    weak var delegate: HouseListViewControllerDelegate?
    
    
    // Mark: - Initialization
    init(model: [House]) {
        self.model = model
        super.init(style: .plain)
        title = "Westeros"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lastRow = UserDefaults.standard.integer(forKey: LAST_HOUSE)
        let indexPath = IndexPath(row: lastRow, section: 0)
        
        tableView.selectRow(at: indexPath,
                            animated: true,
                            scrollPosition: .top)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.count
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "HouseCell"
        
        // Descubrir cuál es la casa que tenemos que mostrar
        let house = model[indexPath.row]
        
        // Crear una celda.
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
        }
        
        // Sincronizar modelo (house) con la vista (celda)
        cell?.imageView?.image = house.sigil.image
        cell?.textLabel?.text = house.name
        
        return cell!
    }
    
    // MARK: - Table view delegate
    // En orden: should, will, did
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        // Averiguar qué casa han pulsado
        let house = model[indexPath.row]
        
        // Avisamos al delegado
        delegate?.houseListViewController(self, didSelectHouse: house)
        
        // Mando la misma info a través de notificaciones
        let notificationCenter = NotificationCenter.default
        
        // Creamos la notificación
        let notificacion = Notification(name: Notification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME),
                                        object: self,
                                        userInfo: [HOUSE_KEY: house])
        notificationCenter.post(notificacion)
        
        // Guardar las coordenadas (section, row) de la última casa seleccionada para cargarla la próxima vez que se abra.
        // No se deben guardar objetos del modelo ya que esto está hecho para datos ligeros.
        saveLastSelectedHouse(at: indexPath.row)
    }
}

extension HouseListViewController {
    func saveLastSelectedHouse(at row: Int) {
        let defaults = UserDefaults.standard
        defaults.set(row, forKey: LAST_HOUSE)
        
        // Por si las moscas, hay una manera de guardar la información
        defaults.synchronize()
    }
    
    func lastSelectedHouse() -> House {
        // Extraer la row del User Defaults
        let row = UserDefaults.standard.integer(forKey: LAST_HOUSE)
        
        // Averiguar la casa de ese row
        let house = model[row]
        
        return house
        
    }
}
