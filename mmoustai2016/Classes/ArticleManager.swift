//
//  Article.swift
//  Pods
//
//  Created by Melvin MOUSTAID on 10/13/16.
//
//

import Foundation
import CoreData

public class ArticleManager {
    
    private let context: NSManagedObjectContext = CoreDataManager.sharedManager.managedObjectContext
    
    public init() {}
    
    public func newArticle() -> Article {
        
        var article : Article!
        
        self.context.performBlockAndWait
            {
                let ent = NSEntityDescription.entityForName("Article", inManagedObjectContext: self.context)
                article = Article(entity: ent!, insertIntoManagedObjectContext: self.context)
        }
        
        return article
    }
    
    public func getAllArticles() -> [Article] {
        
        let articleFetch = NSFetchRequest(entityName: "Article")
        
        do {
            let fetchedArticles = try self.context.executeFetchRequest(articleFetch) as! [Article]
            return fetchedArticles
        } catch {
            fatalError("Failed to fetch articles: \(error)")
        }
        
        return []
    }
    
    public func getArticles(withLang lang: String) -> [Article] {
        
        let articleFetch = NSFetchRequest(entityName: "Article")
        
        do {
            articleFetch.predicate = NSPredicate(format: "lang == %@", lang)
            let fetchedArticles = try self.context.executeFetchRequest(articleFetch) as! [Article]
            return fetchedArticles
        } catch {
            fatalError("Failed to fetch articles: \(error)")
        }
        
        return []
    }
    
    public func getArticles(containString str: String) -> [Article] {
        
        let articleFetch = NSFetchRequest(entityName: "Article")
        
        do {
            articleFetch.predicate = NSPredicate(format: "titre == %@ || content == %@ || lang == %@", str)
            let fetchedArticles = try self.context.executeFetchRequest(articleFetch) as! [Article]
            return fetchedArticles
        } catch {
            fatalError("Failed to fetch articles: \(error)")
        }
        
        return []
    }
    
    public func removeArticle(article : Article) {
        
        do {
            context.deleteObject(article)
        } catch {
            fatalError("Failed to delete article: \(error)")
        }

    }
    
    
    public func save() {
        do {
            try context.save()
        } catch {
            
        }
    }
}
