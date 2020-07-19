//
//  Stuff+CoreDataProperties.swift
//  Stuffy
//
//  Created by Harsain Kapoor on 19/7/20.
//  Copyright © 2020 Harsain Kapoor. All rights reserved.
//
//

import Foundation
import Combine
import CoreData
import SwiftUI


extension Stuff: Identifiable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Stuff> {
        return NSFetchRequest<Stuff>(entityName: "Stuff")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var note: String?
    @NSManaged public var urgent: Bool
    @NSManaged public var complete: Bool
    @NSManaged public var createdAt: Date?
    @NSManaged public var updatedAt: Date?

    // MARK: - Stuff Urgency
    static func updateUrgent(of stuff: Stuff) -> Binding<Bool> {
        let binding = Binding<Bool>(
            get: { () -> Bool in
                return stuff.urgent
            },
            set: {
                stuff.urgent = $0
                updateStuff(stuff: stuff)
            }
        )
        
        return binding
    }
}
