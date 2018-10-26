//
//  ViewController.swift
//  Checklist
//
//  Created by Sunny Chowdhury on 10/26/18.
//  Copyright © 2018 mastersunny. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var todoList: TodoList
    
    @IBAction func addItem(_ sender: Any) {
        let newRowIndex = todoList.todos.count
        todoList.addItem()
        let indexPath = IndexPath(row:  newRowIndex, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    required init?(coder aDecoder: NSCoder) {
        todoList = TodoList()
        super.init(coder: aDecoder)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
       navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.todos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let item = todoList.todos[indexPath.row]
        configureText(for: cell, with: item)
        configureCheckMark(for: cell, with: item)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = todoList.todos[indexPath.row]
        if let cell = tableView.cellForRow(at: indexPath){
            configureCheckMark(for: cell, with: item)
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        todoList.todos.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
    func configureText(for cell: UITableViewCell, with item: ChecklistItem){
        if let label = cell.viewWithTag(1000) as? UILabel {
            label.text = item .text
        }
    }
    
    func configureCheckMark(for cell: UITableViewCell, with item: ChecklistItem){
        if item.checked {
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
       item.checked = !item.checked
    }


}

