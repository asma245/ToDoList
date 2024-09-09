//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Asma on 6/6/24.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []{
        didSet{
            saveItem()
        }
    }
    let itemsKey: String = "items_list"
    
    init() {
        getItems()
    }
    func getItems(){
        
        guard let data = UserDefaults.standard.data(forKey: itemsKey) else { return }
        guard let savedItems = try? JSONDecoder() .decode([ItemModel].self, from: data) else { return }
        self.items = savedItems
    }
    func deleteItem (indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    func moveItem (from: IndexSet , to: Int ){
        items.move(fromOffsets: from, toOffset: to)
        
    }
    func saveItem (title: String){
        let newItem = ItemModel(title: title, isCompeleted: false)
        items.append(newItem)
    }
    func updateItem (item: ItemModel){
        if let index = items.firstIndex(where: { $0.id == item.id}){
            items[index] = item.updateCompletion()
        }
    }
    func saveItem() {
        if let encodedDate = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedDate, forKey: itemsKey)
        }
    }
    
}
