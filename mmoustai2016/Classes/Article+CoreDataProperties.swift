//
//  Article+CoreDataProperties.swift
//  Pods
//
//  Created by Melvin MOUSTAID on 10/14/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Article {

    @NSManaged public var titre: String?
    @NSManaged public var content: String?
    @NSManaged public var lang: String?
    @NSManaged public var image: NSData?
    @NSManaged public var creation_date: NSDate?
    @NSManaged public var update_date: NSDate?

}
