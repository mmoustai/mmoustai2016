//
//  ViewController.swift
//  mmoustai2016
//
//  Created by Melvin Moustaid on 10/13/2016.
//  Copyright (c) 2016 Melvin Moustaid. All rights reserved.
//

import UIKit
import mmoustai2016

class ViewController: UIViewController {
    
    let articleManager = ArticleManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let article1 = articleManager.newArticle()
        
        
        article1.titre = "article 1"
        article1.content = "Je suis l'article 1"
        article1.creation_date = NSDate()
        article1.update_date = NSDate()
        article1.lang = "en"
        articleManager.save()

        
        
        let article2 = articleManager.newArticle()
        
        article2.titre = "article 2"
        article2.content = "Je suis l'article 2"
        article2.creation_date = NSDate()
        article2.update_date = NSDate()
        article2.lang = "fr"
        articleManager.save()
        
        
        print(articleManager.getArticles(containString: "article 2"))
        print(articleManager.getArticles(withLang: "en"))
        print(articleManager.getAllArticles())
        let articles = articleManager.getAllArticles()
        for article in articles {
            articleManager.removeArticle(article)
        }
        print(articleManager.getAllArticles())
    }
        
}