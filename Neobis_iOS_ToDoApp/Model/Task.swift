//
//  Task.swift
//  Neobis_iOS_ToDoApp
//
//  Created by user on 28/4/23.
//

import Foundation
import RealmSwift

class Task : Object {
  
    @objc dynamic var name : String = ""
    @objc dynamic  var desription : String = ""
    
    override init() {
        super.init()
    }
    
    init(name : String , desription : String) {
        self.desription = desription
        self.name = name
    }
}
