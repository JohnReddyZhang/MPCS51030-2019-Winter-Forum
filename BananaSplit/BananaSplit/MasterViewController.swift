//
//  MasterViewController.swift
//  BananaSplit
//
//  Created by Susan Stevens on 2/12/19.
//  Copyright © 2019 Susan Stevens. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    let ingredients: [Ingredient] = [
        Ingredient(name: "Ice Cream", image: #imageLiteral(resourceName: "ice-cream")),
        Ingredient(name: "Banana", image: #imageLiteral(resourceName: "banana")),
        Ingredient(name: "Chocolate Syrup", image: #imageLiteral(resourceName: "chocolate-syrup")),
        Ingredient(name: "Sprinkles", image: #imageLiteral(resourceName: "sprinkles")),
        Ingredient(name: "Cherries", image: #imageLiteral(resourceName: "cherries"))
    ]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath) as? IngredientTableViewCell else { return UITableViewCell() }
        
        cell.ingredientLabel.text = ingredients[indexPath.row].name
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else { return }
        guard let detailViewController = segue.destination as? DetailViewController else { return }
        
        detailViewController.ingredient = ingredients[selectedIndexPath.row]
    }
}
