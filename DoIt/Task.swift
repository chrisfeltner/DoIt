//
//  Task.swift
//  DoIt
//
//  Created by Christopher Feltner on 2/26/17.
//  Copyright © 2017 Christopher Feltner. All rights reserved.
//

import Foundation

class Task
{
    var name : String = ""
    var isImportant : Bool = false
    
    init(name: String, isImportant: Bool)
    {
        self.name = name
        self.isImportant = isImportant
    }
}
