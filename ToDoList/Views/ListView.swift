//
//  ListView.swift
//  ToDoList
//
//  Created by Asma on 5/28/24.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel : ListViewModel
    
    var body: some View {
        ZStack{
            if listViewModel.items .isEmpty {
                NoItemView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }
            else {     
            List{
                ForEach(listViewModel.items){ item in
                ListRowView(item: item)
                        .onTapGesture {
                            withAnimation(.linear){
                                listViewModel.updateItem(item: item)
                            }
                        }
                }
                .onDelete(perform: listViewModel.deleteItem)
                .onMove(perform: listViewModel.moveItem)
     }
                
  }
}
    

        .listStyle(PlainListStyle())
        .navigationTitle("ToDo List 📝")
        .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: AddView())
        )
  
    }
}

#Preview {
    NavigationStack{
        ListView()
    }
    .environmentObject(ListViewModel())
}


