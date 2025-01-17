//
//  NoItemView.swift
//  ToDoList
//
//  Created by Asma on 9/8/24.
//

import SwiftUI

struct NoItemView: View {
    
    @State var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    var body: some View {
        ScrollView{
            VStack (spacing: 10){
                Text("There is no items !!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you productive person? I think you should click the add button and add a bunch of items to your todo list! ")
                    .padding(.bottom , 20)
                NavigationLink(destination: AddView(), label: {
                    Text ("Add Something 🥳")})
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height:55)
                    .frame(maxWidth:.infinity)
                    .background(animate ? secondaryAccentColor : Color.accentColor)
                    .cornerRadius(10)
                    .padding(.horizontal, animate ? 30 : 50)
                    .shadow(
                        color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                        radius: animate ? 30 : 10,
                        x: 0.0,
                        y: animate ? 50 : 30
                    )
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset(y: animate ? -7 : 0)
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: didAnimation)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    func didAnimation(){
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ){
                animate.toggle()
            }
        }
        
    }
}

#Preview {
    NavigationView{
        NoItemView()
            .navigationTitle("Title")
    }
}
