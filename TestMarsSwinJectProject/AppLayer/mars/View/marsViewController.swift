//
//  marsViewController.swift
//  TestMarsSwinJectProject
//
//  Created by Mishel on 05/03/2021.
//  Copyright © 2021 Misha. All rights reserved.
//

import UIKit
import SDWebImage
import SimpleImageViewer
final class marsViewController: UIViewController, marsViewProtocol{
    
    // MARK: - Public Properties
    var presenter: marsPresenterFromViewProtocol!
    @IBOutlet weak var tableView: UITableView!
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        presenter.viewDidLoad()
        tableView.delegate = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reusableId)
        self.view.addGestureRecognizer(longPressRecognizer())
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(barbuttonAction(sender:)))
        
    }
    func presentMarsAlert(alert: UIAlertController) {
        present(alert, animated: true, completion: nil)
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    @objc func barbuttonAction(sender: UIBarButtonItem){
        Coordinator.shared.display(confViews: MainModuleConfigurator())
    }
    
    //MARK: - TableView
}
extension marsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  presenter.photo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reusableId,
                                                 for: indexPath) as! TableViewCell
        cell.cellConfigure(urlString: presenter.photo[indexPath.row].imgSrc)
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
    
    func longPressRecognizer()-> UILongPressGestureRecognizer{
        UILongPressGestureRecognizer(target: self, action: #selector(handleLongTap))
    }
    
    @objc func handleLongTap(gesture : UILongPressGestureRecognizer!) {
        if gesture.state != .ended { return }
        let lock = gesture.location(in: self.tableView )
        if let indexPath = self.tableView.indexPathForRow(at: lock) {
            let id = presenter.photo[indexPath.row].id
            let alert = AlertManager().getAlert(title: L10n.deletedWarning,
                                                message: L10n.deletedMessage,
                                                alertTextField: false,
                                                secondAlertTextField: false) { _,_  in }
                complessionLat: { _ in}
                complession: {
                    self.presenter.ignoredPhotos(id: id)
                }
            present(alert, animated: true, completion: nil)
        }
        
    }
    
}


