//
//  ViewController.swift
//  UiKit_withSwiftUI
//
//  Created by Amita Ghosh on 4/23/23.
//
// Agenda : How you can incorporate adding a SwiftUI view to an existing UIkit ViewController

import UIKit
import SwiftUI

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var data = ["Dave","Ann","Tom"] //sample data

    @IBOutlet weak var tableView: UITableView!
    
    let cell_reuse_identifier = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //register tableview
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cell_reuse_identifier)
        
        
        // add bar button items
        let add = UIBarButtonItem(image: UIImage(systemName:"plus" ), style:.plain, target: self, action:#selector(addMethod))
        let delete = UIBarButtonItem(image: UIImage(systemName:"trash" ), style:.plain, target: self, action:#selector(deleteMethod))
        navigationItem.rightBarButtonItems = [add,delete]
        
    }
//    MARK: BARBUTTON ITEM METHODS
    
    @objc func addMethod(sender:UIBarButtonItem){
        print("addMethod called")
        data.append("Shelley")
        tableView.reloadData()
    }
    @objc func deleteMethod(sender:UIBarButtonItem){
        print("deleteMethod called")
        if (data.count > 0){
            data.removeLast()
            tableView.reloadData()
        }
    }
    
//MARK: TABLE VIEW DATA SOURCE AND DELEGATES
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{

        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cell_reuse_identifier, for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = data[indexPath.row]
        content.secondaryText = "Person"
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // use UIHostingController to host a swiftUI view and continue as usual
        let newScreen = SwiftUIView()
        let hostingVC : UIHostingController = UIHostingController(rootView: newScreen)
        self.navigationController?.pushViewController(hostingVC, animated: true)
        
    }
}

