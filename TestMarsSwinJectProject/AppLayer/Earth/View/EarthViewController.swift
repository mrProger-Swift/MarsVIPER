//
//  EarthViewController.swift
//  TestMarsSwinJectProject
//
//  Created by Mishel on 07/03/2021.
//  Copyright © 2021 Misha. All rights reserved.
//

import UIKit

final class EarthViewController: UIViewController, EarthViewProtocol {
    
    // MARK: - Public Properties
    
    @IBOutlet weak var tableView: UITableView!
    var presenter: EarthPresenterFromViewProtocol!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel,
                                                                target: self,
                                                                action: #selector(barbuttonAction(sender:)))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                                 target: self,
                                                                 action: #selector(rightBarbuttonAction(sender:)))
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reusableId)
        presenter.viewDidLoad()
        getCordinates()
    }
    
    func getCordinates() {
        tableView.separatorStyle = .none
        let alert = AlertManager().getAlert(title: L10n.coordinateMessage,
                                            message: L10n.cordinatesWarnings,
                                            alertTextField: true,
                                            secondAlertTextField: true) {[weak self] latit, lan  in
            let lat = latit
            let lan = lan
            self?.presenter.loadData(lat: lat, lon: lan)
        } complessionLat: { (lan) in
        } complession: {}
        present(alert, animated: true, completion: nil)
        
    }
    func present(alert: UIAlertController){
        present(alert, animated: true, completion: nil)
    }
    
    func reloadData(){
        tableView.reloadData()
    }
    
    @objc func barbuttonAction(sender: UIBarButtonItem){
        Coordinator.shared.display(confViews: MainModuleConfigurator())
    }
    @objc func rightBarbuttonAction(sender: UIBarButtonItem){
        getCordinates()
    }
    
}

// MARK: - TableView Delegate
extension EarthViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.photoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reusableId,
                                                 for: indexPath) as! TableViewCell
        cell.cellConfigure(urlString: presenter.photoArray[indexPath.row].url)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(Constants.heightForRow)
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! TableViewCell
        let imageVC = SimpleImageViewer().showImage(cell: cell)
        present(imageVC, animated: true, completion: nil)
    }
    
}
