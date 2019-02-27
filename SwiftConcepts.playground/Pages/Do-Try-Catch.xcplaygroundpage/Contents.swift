import Foundation

struct Book {
    let title: String
    var isAvailable: Bool
}

enum CheckoutError: Error {
    case titleNotFound
    case titleUnavailable
}

class Library {
    
    var books = [Book(title: "The Hobbit", isAvailable: true),
                 Book(title: "The DaVinci Code", isAvailable: false),
                 Book(title: "To Kill a Mockingbird", isAvailable: true)]
    
    func checkout(title: String) throws -> Book {
        var requestedBook: Book?
        for book in books {
            if book.title == title {
                requestedBook = book
            }
        }
        
        guard let book = requestedBook else {
            throw CheckoutError.titleNotFound
        }
        
        guard book.isAvailable else {
            throw CheckoutError.titleUnavailable
        }
        
        return book
    }
}

let library = Library()

do {
    let book1 = try library.checkout(title: "The DaVinci Code")
    print(book1.title)
} catch (let error) {
    print(error)
}

let book2 = try? library.checkout(title: "Where the Wild Things Are")
let book3 = try! library.checkout(title: "The Hobbit")
