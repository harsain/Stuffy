//
//  StuffDetailView.swift
//  Stuffy
//
//  Created by Harsain Kapoor on 16/7/20.
//  Copyright © 2020 Harsain Kapoor. All rights reserved.
//

import SwiftUI

struct StuffDetailView: View {
    
    var filter: String = ""
    @State var newItem: String = ""
    @FetchRequest(entity: Stuff.entity(), sortDescriptors: []) var stuffListTest: FetchedResults<Stuff>
    
    var body: some View {
        
        VStack(alignment: .leading) {
            // MARK: Move to NewStuffView
//            HStack(alignment: .top) {
//                Text("Stuff:")
//                    .bold()
//                TextField("Add a new Item", text: $newItem)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                Button(action: {
//                    print(self.newItem)
//                    addStuff(stuff: self.newItem)
//                    self.newItem = ""
//                }){
//                    Text("+")
//                }
//            }
//                .padding()
//                .frame(alignment: .top)
//                .alignmentGuide(.leading, computeValue: {d in d[.top]})
            NewStuffView()
            Text("Stuff: \(filter)").font(.headline)
            List {
                ForEach(stuffListTest, id: \.self) { (eachStuff: Stuff) in
                    StuffListRowView(stuff: eachStuff, isComplete: Stuff.updateUrgent(of: eachStuff))
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .animation(.spring())
    }
}



func getCurrentStuff() -> [Stuff] {
    var toReturn: [Stuff] = []
    // get the current stuff from coredata
    if let context = (NSApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
        do {
            // set them to the class property
            toReturn = try context.fetch(Stuff.fetchRequest())
        } catch {}
    }
    return toReturn
}

func addStuff(stuff: String) {
    
    if let context = (NSApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let newStuff = Stuff(context: context)
        newStuff.id = UUID()
        newStuff.createdAt = Date()
        newStuff.updatedAt = Date()
        newStuff.title = stuff
        newStuff.complete = false
    }
    (NSApplication.shared.delegate as? AppDelegate)?.saveAction(nil)
}

func updateStuff(stuff: Stuff) {
    
    if let context = (NSApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
        do {
            try context.save()
        } catch {
            print("Error updating stuff: \(error)")
        }
    }
}

func deleteStuff(stuff: Stuff) {
    if let context = (NSApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
        do {
            context.delete(stuff)
            try context.save()
        } catch {print("Error deleting stuff: \(error)")}
    }
}

struct StuffDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StuffDetailView(filter: "All")
    }
}
