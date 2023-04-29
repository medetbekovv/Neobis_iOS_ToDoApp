//
//  EditTaskViewController.swift
//  Neobis_iOS_ToDoApp
//
//  Created by user on 28/4/23.
//

import UIKit

class EditTaskViewController: UIViewController {
    
    @IBOutlet weak var nameEditTF: UITextField!
    @IBOutlet weak var dscrptEditTF: UITextField!

    var index : Int!
    var task : Task?
    let vm = TodoViewModel.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let myTask = self.task {
            nameEditTF.text = myTask.name
            dscrptEditTF.text = myTask.desription
        }
    }
    
    @IBAction func saveButton(_ sender: Any) {
        print("SAVingf")
        let newTask = Task(name: nameEditTF.text ?? "", desription: dscrptEditTF.text ?? "")
        vm.editTask(task: self.task!, updatedTask: newTask) {
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        vm.deleteTask(task: self.task!, taskIndex: self.index) {
            print("DElete")
            navigationController?.popViewController(animated: true)
        }
    }
}

    
    
    
   


