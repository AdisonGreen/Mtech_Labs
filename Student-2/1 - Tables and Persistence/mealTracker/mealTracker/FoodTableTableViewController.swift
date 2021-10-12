//
//  FoodTableTableViewController.swift
//  mealTracker
//
//  Created by Adison Green on 10/11/21.
//

import UIKit

class FoodTableTableViewController: UITableViewController {

    var meals: [Meal] {
        let hamburger = Food(name: "Hamburger", description: "Patty and a bun, there is nothing better.")
        let pizza = Food(name: "Pizza", description: "Cheezy and good.")
        let iceCream = Food(name: "Ice Cream", description: "So many options and supper good.")
        
        let water = Food(name: "Water", description: "Best thing on this planet.")
        let miniWheats = Food(name: "Mini Wheats", description: "It is a decent ceral.")
        let banana = Food(name: "Banana", description: "Really good if you can get it just right")
        
        let breadSticks = Food(name: "Bread Sticks", description: "Bread but better")
        let meatLoaf = Food(name: "Meat Loaf", description: "Some of the best meat on the planet")
        let milk = Food(name: "Milk", description: "Creamy and good")
        
        let breakfast = Meal(name: "Breakfast", food: [water, miniWheats, banana])
        let lunch = Meal(name: "Lunch", food: [hamburger, pizza, iceCream])
        let dinner = Meal(name: "Dinner", food: [breadSticks, meatLoaf, milk])
        
        return [breakfast, lunch, dinner]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let meal = meals[section]
        return meal.food.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)
        let section = indexPath.section
        let row = indexPath.row
        
        let meal = meals[section]
        let food = meal.food[row]
        cell.textLabel?.text = food.name
        cell.detailTextLabel?.text = food.description
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let meal = meals[section]
        return meal.name
    }
    
}
