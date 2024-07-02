//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Asma on 6/6/24.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var item: [ItemModel] = []
    
    init() {
        getItems()
    }
    func getItems(){
       let newItem = [
        ItemModel(title: "This is first item", isCompeleted: false),
        ItemModel(title: "This is second item", isCompeleted: true),
        ItemModel(title: "Third", isCompeleted: false),
         ]
        item.append(contentsOf: newItem)
    }
    func deleteItem (indexSet:IndexSet){
        item.remove(atOffsets: indexSet)
    }
    func moveItem (from: IndexSet , to: Int ){
        item.move(fromOffsets: from, toOffset: to)
        
    }
    func saveItem (title:String){
        let newItem = ItemModel(title: title, isCompeleted: false)
        item.append(newItem)
    }
    
}
