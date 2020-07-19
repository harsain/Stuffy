//
//  NewStuffView.swift
//  Stuffy
//
//  Created by Harsain Kapoor on 18/7/20.
//  Copyright © 2020 Harsain Kapoor. All rights reserved.
//

import SwiftUI

struct NewStuffView: View {
    @State var urgent: Bool = false
    @State var newStuff: String = ""
    var body: some View {
        
        GeometryReader { geometry in
            
            VStack(alignment: .leading) {
                HStack{
                    Text("Stuff: ").foregroundColor(.gray)
                    TextField("Add some stuff to work on!", text: self.$newStuff)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                HStack{
                    Text("Urgent: ").foregroundColor(.gray)
                    Toggle(isOn: self.$urgent) {
                        EmptyView()
                    }
                }
                
                HStack{
                    Text("Due: ").foregroundColor(.gray)
                    
                    DatePicker(selection: .constant(Date()), label: { Text("") })
                }
                
            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
            
            
        }
        .padding()
        .contrast(0.5)
        .cornerRadius(10)
        .shadow(radius: 5)
        .animation(.spring())

    }
}

struct NewStuffView_Previews: PreviewProvider {
    static var previews: some View {
        NewStuffView()
    }
}
