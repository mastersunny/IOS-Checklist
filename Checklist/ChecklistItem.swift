//
//  ChecklistItem.swift
//  Checklist
//
//  Created by Sunny Chowdhury on 10/26/18.
//  Copyright © 2018 mastersunny. All rights reserved.
//

import Foundation

class ChecklistItem {
    
    var text = ""
    var checked =  false
    
    init(text: String, checked: Bool) {
        self.text = text
        self.checked = checked
    }
}
