//
//  Article.swift
//  Pods
//
//  Created by Melvin MOUSTAID on 10/14/16.
//
//

import Foundation
import CoreData


public class Article: NSManagedObject {

    override public var description: String {
        return "(\(titre), \(content)), \(lang), \(creation_date), \(update_date)"
    }
    
}
