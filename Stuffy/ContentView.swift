//
//  ContentView.swift
//  Stuffy
//
//  Created by Harsain Kapoor on 19/7/20.
//  Copyright © 2020 Harsain Kapoor. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    private let menuItems = ["All", "Important"]
    @State var menuSelection: String? = "All"
    
    var body: some View {
        NavigationView {
            NavigationMenuView(menuSelection: $menuSelection)
            StuffDetailView(filter: menuSelection ?? "All")
        }
            .navigationViewStyle(DoubleColumnNavigationViewStyle())
            .frame(minWidth: 600.0, maxWidth: .infinity, minHeight: 400.0, maxHeight: .infinity)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .frame(width: 600.0, height: 600.0)
    }
}
