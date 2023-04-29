//
//  ViewController.swift
//  Neobis_iOS_ToDoApp
//
//  Created by user on 28/4/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!
    
    let vm = TodoViewModel.sharedInstance
    
    var data : [Task] = [Task(name: "Sultan", desription: "asd"),
                         Task(name: "Eldar", desription: "dsa")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.data.removeAll()
        vm.loadTasks {
            tableView.reloadData()
        }
    }
    
    @IBAction func addButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddTaskViewController") as! AddTaskViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func edtingButton(_ sender: Any) {
        
        self.tableView.isEditing = !self.tableView.isEditing
        
        
    }
    
}

extension ViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.tasks.count  //data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = vm.tasks[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data.name
        cell.detailTextLabel?.text  = data.desription
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "EditTaskViewController") as! EditTaskViewController
        vc.task = vm.tasks[indexPath.row]
        vc.index = indexPath.row
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            vm.tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let cell = vm.tasks[sourceIndexPath.item]
        vm.tasks.remove(at: sourceIndexPath.item)
        vm.tasks.insert(cell, at: destinationIndexPath.item)
        
    }
    
}


