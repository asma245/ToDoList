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
                    .background(Color(UIColor.secondarySystemBackground))
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
        .alert(isPresented: $showAlert, content: getAlert)
    }
    func saveButtonPressed (){
        if textIsAppropriate() {
            listViewModel.saveItem(title: textFieldText)
            presentaionMode.wrappedValue.dismiss()
        }
   
    }
    
    func textIsAppropriate () -> Bool{
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 character long!! 😨😰😱 "
            showAlert.toggle()
            return false
        }
        return true
    }
    func getAlert () -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationStack{
        AddView()
    }
    .environmentObject(ListViewModel())
}
