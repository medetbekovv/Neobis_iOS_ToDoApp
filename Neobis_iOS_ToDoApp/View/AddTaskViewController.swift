//
//  AddTaskViewController.swift
//  Neobis_iOS_ToDoApp
//
//  Created by user on 28/4/23.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var dscrpTf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func saveButton(_ sender: Any) {
        let task = Task(name: nameTF.text ?? "", desription: dscrpTf.text ?? "")
        let vm = TodoViewModel.sharedInstance
        vm.addTask(task: task) {
            self.navigationController?.popViewController(animated: true)
        }
        print("Save name and dscrpt")
    }
}
