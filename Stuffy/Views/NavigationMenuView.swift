//
//  NavigationView.swift
//  Stuffy
//
//  Created by Harsain Kapoor on 18/7/20.
//  Copyright © 2020 Harsain Kapoor. All rights reserved.
//

import SwiftUI

struct NavigationMenuView: View {
    private let menuItems = ["All", "Important"]
    @Binding var menuSelection: String?
    
    var body: some View {
        List (selection: $menuSelection){
            Section(
                header: Text("Stuff to do!")
            ) {
                ForEach(menuItems, id: \.self) { menuItem in
                    Text(menuItem)
                }
            }
        }.listStyle(SidebarListStyle())
    }
}

struct NavigationMenuView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationMenuView(menuSelection: .constant("All"))
    }
}
