//
//  ItemModel.swift
//  ToDoList
//
//  Created by Asma on 5/28/24.
//

import Foundation

struct ItemModel : Identifiable, Codable {
    let id: String
    let title :String
    let isCompeleted : Bool
    
    init(id: String = UUID().uuidString, title: String, isCompeleted: Bool) {
        self.id = id
        self.title = title
        self.isCompeleted = isCompeleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompeleted: !isCompeleted)
    }
}
