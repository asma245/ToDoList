//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Asma on 5/28/24.
//

import SwiftUI

@main
struct ToDoListApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
