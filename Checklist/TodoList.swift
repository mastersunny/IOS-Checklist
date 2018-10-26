//
//  TodoList.swift
//  Checklist
//
//  Created by Sunny Chowdhury on 10/26/18.
//  Copyright © 2018 mastersunny. All rights reserved.
//

import Foundation

class TodoList {
    var todos: [ChecklistItem] = []
    
    init() {
        todos.append(ChecklistItem(text: "Take a jog", checked: false))
        todos.append(ChecklistItem(text: "Watch a movie", checked: false))
        todos.append(ChecklistItem(text: "Code an app", checked: false))
        todos.append(ChecklistItem(text: "Walk the dog", checked: false))
        todos.append(ChecklistItem(text: "Study design pattern", checked: false))
    }
    
    func addItem(){
        todos.append(ChecklistItem(text: "New todo item", checked: true))
    }
}
