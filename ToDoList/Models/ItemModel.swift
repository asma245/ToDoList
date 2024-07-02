//
//  ItemModel.swift
//  ToDoList
//
//  Created by Asma on 5/28/24.
//

import Foundation

struct ItemModel : Identifiable {
    let id: String = UUID().uuidString
    let title :String
    let isCompeleted : Bool
}
