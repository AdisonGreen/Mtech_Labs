//
//  ToDo.swift
//  ToDoList
//
//  Created by Adison Green on 11/2/21.
//

import Foundation

struct ToDo: Equatable {
    let id = UUID()
    let title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    static func ==(lhs: ToDo, rhs: ToDo) -> Bool {
        return lhs.id == rhs.id
    }
}
