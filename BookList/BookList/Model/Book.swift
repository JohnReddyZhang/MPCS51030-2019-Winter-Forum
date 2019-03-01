//
//  Book.swift
//  BookList
//
//  Created by Susan Stevens on 2/24/19.
//  Copyright © 2019 Susan Stevens. All rights reserved.
//

import Foundation

class Book: NSObject, NSSecureCoding {
    
    enum Keys: String {
        case title = "title"
        case author = "author"
        case category = "category"
    }
    
    static var supportsSecureCoding: Bool = true

    let title: String
    let author: String
    let category: BookCategory
    
    init?(title: String?, author: String?, category: BookCategory?) {
        guard let title = title, let author = author, let category = category else { return nil }
        self.title = title
        self.author = author
        self.category = category
    }

    required convenience init?(coder aDecoder: NSCoder) {
        let title = aDecoder.decodeObject(of: NSString.self, forKey: Keys.title.rawValue)
        let author = aDecoder.decodeObject(of: NSString.self, forKey: Keys.author.rawValue)
        let categoryRawValue = aDecoder.decodeInteger(forKey: Keys.category.rawValue)
        let category = BookCategory(rawValue: categoryRawValue)
        
        self.init(title: title as String?, author: author as String?, category: category)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: Keys.title.rawValue)
        aCoder.encode(author, forKey: Keys.author.rawValue)
        aCoder.encode(category.rawValue, forKey: Keys.category.rawValue)
    }
}
