//
//  ListRowView.swift
//  ToDoList
//
//  Created by Asma on 5/28/24.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompeleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompeleted ? .green : .red)
            Text(item.title)
        }
        .font(.title2)
        .padding(.vertical , 8) //space
    }
}

#Preview {
    Group {
        let item = ItemModel(title: "First Item", isCompeleted: false)
        ListRowView(item: item)
        ListRowView(item: ItemModel(title: "Second Item", isCompeleted: true))
    }
  //  .previewLayout(.sizeThatFits)
}
