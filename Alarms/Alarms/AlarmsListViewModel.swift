//
//  AlarmsListViewModel.swift
//  Alarms
//
//  Created by Adison Green on 12/20/21.
//

import Foundation



class Alarm: Identifiable, ObservableObject {
    var id: Date { time }
    
    @Published var time: Date
    
    init(time: Date) {
        self.time = time
    }
}

class AlarmsListViewModel: ObservableObject {
    @Published var alarms = [Alarm]()
    
    static var fakeData: AlarmsListViewModel {
        let model = AlarmsListViewModel()
        model.alarms = [
            Alarm(time: Date())
        ]
        return model
    }
}
