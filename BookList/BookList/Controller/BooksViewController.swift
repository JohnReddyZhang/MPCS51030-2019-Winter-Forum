//
//  BooksViewController.swift
//  BookList
//
//  Created by Susan Stevens on 2/24/19.
//  Copyright © 2019 Susan Stevens. All rights reserved.
//

import UIKit

class BooksViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let bookService = BookService()
    private var books: [Book] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    @IBAction func unwindToBookList(_ sender: UIStoryboardSegue) {
        guard let addBookViewController = sender.source as? AddBookViewController else { return }
        guard let book = addBookViewController.book else { return }
        books.append(book)
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension BooksViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell") as! BookTableViewCell
        
        let book = books[indexPath.row]
        cell.titleLabel.text = book.title
        cell.authorLabel.text = book.author
    
        switch book.category {
        case .fiction:
            cell.categoryLabel.text = "Fiction"
        case .nonfiction:
            cell.categoryLabel.text = "Nonfiction"
        }
        
        return cell
    }
}
