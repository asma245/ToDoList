//
//  AddView.swift
//  ToDoList
//
//  Created by Asma on 5/28/24.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentaionMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText : String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    var body: some View {
        ScrollView{
            
            VStack {
                TextField("Type something here ....", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height:55)
                    .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
                   .cornerRadius(15.0)
                
                Button(action: saveButtonPressed, label: {
                    Text("save".uppercased())
                        .frame(height:55)
                        .frame(maxWidth:.infinity)
                        .background(Color.accentColor)
                        .foregroundStyle(.white)
                        .cornerRadius(15.0)
                        .font(.headline)
                    
                })
            }
            .padding(13)
        }
        .navigationTitle("Add an Item 🖊️ ")
    }
    func saveButtonPressed (){
        if textIsAppropriate() {
            listViewModel.saveItem(title: textFieldText)
            presentaionMode.wrappedValue.dismiss()
        }
   
    }
    
    func textIsAppropriate () -> Bool{
        if textFieldText.count < 3 {
            return false
        }
        return true
    }
}

#Preview {
    NavigationStack{
        AddView()
    }
    .environmentObject(ListViewModel())
}
