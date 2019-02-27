//
//  BookService.swift
//  BookList
//
//  Created by Susan Stevens on 2/25/19.
//  Copyright © 2019 Susan Stevens. All rights reserved.
//

import Foundation

class BookService {
    
    func fetchBooksFromUserDefaults() -> [Book] {
        guard let data = UserDefaults.standard.data(forKey: "books") else { return [] }
        
        var books: [Book]?
        do {
            books = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Book]
        } catch (let error) {
            print("Error fetching books from user defaults: \(error)")
        }
        return books ?? []
    }
    
    func saveToUserDefaults(books: [Book]) {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: books, requiringSecureCoding: true)
            UserDefaults.standard.set(data, forKey: "books")
        } catch (let error) {
            print("Error saving books to user defaults: \(error)")
        }
    }
    
    func fetchBooksFromFile() -> [Book] {
        var books: [Book]?
        do {
            let documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
            let url = documentsDirectory.appendingPathComponent("books")
            let data = try Data(contentsOf: url)
            books = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Book]
        } catch (let error) {
            print("Error fetching books from file: \(error)")
        }
        return books ?? []
    }
    
    func saveToFile(books: [Book]) {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: books, requiringSecureCoding: true)
            let documentDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
            print("Path to document directory: \(documentDirectory)")
            let url = documentDirectory.appendingPathComponent("books")
            try data.write(to: url)
        } catch (let error) {
            print(error)
        }
    }
}
