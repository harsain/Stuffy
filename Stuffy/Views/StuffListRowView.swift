//
//  StuffListRowView.swift
//  Stuffy
//
//  Created by Harsain Kapoor on 19/7/20.
//  Copyright © 2020 Harsain Kapoor. All rights reserved.
//

import SwiftUI

struct StuffListRowView: View {
    @ObservedObject var stuff: Stuff
    @Binding var isComplete: Bool
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack(alignment: .center) {
                Toggle(isOn: $isComplete) {
                    Text("Urgent")
                }
                    .labelsHidden()
                    .padding()
                Text(String(stuff.title ?? "error"))
                    .onTapGesture {
                        print(self.$stuff.title )
                        print(self.stuff.id ?? "default")
                    }
                    .onHover { over in
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                Image(nsImage: NSImage(named: NSImage.touchBarDeleteTemplateName)!)
                    .onTapGesture {
                        print("Delete Stuff")
                        print(self.stuff.id as Any)
                        deleteStuff(stuff: self.stuff)
                    }
                .foregroundColor(Color.red)
                    .frame(alignment: .trailing)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onHover { over in
            //self.hoverStuff = eachStuff
//                        print(over)
//                        print(eachStuff.id ?? "no id")
//                        print(eachStuff.stuff ?? "no stuff")
        }
    }
}

struct StuffListRowView_Previews: PreviewProvider {
    static var previews: some View {
        StuffListRowView(stuff: Stuff(), isComplete: (.constant(true)))
    }
}
