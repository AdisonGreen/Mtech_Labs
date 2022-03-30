//
//  AlarmsApp.swift
//  Alarms
//
//  Created by Adison Green on 12/20/21.
//

import SwiftUI

@main
struct AlarmsApp: App {
    var body: some Scene {
        WindowGroup {
            AlarmsListView(model: AlarmsListViewModel())
        }
    }
}
