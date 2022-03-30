//
//  AlarmDetailView.swift
//  Alarms
//
//  Created by Adison Green on 12/20/21.
//

import SwiftUI

class AlarmDetailViewModel: ObservableObject {
    var ogAlarm: Binding<Alarm>
    @Published var currentAlarm: Alarm
    
    init(ogAlarm: Binding<Alarm>) {
        self.ogAlarm = ogAlarm
        currentAlarm = ogAlarm.wrappedValue
    }
}

struct AlarmDetailView: View {
    @ObservedObject var model: AlarmDetailViewModel
    
    var body: some View {
        NavigationView {
            Form {
                Section("Alarm Time") {
                    DatePicker(selection: $model.currentAlarm.time, displayedComponents: .hourAndMinute) { }
                    .labelsHidden()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        model.ogAlarm = $model.currentAlarm
                    }
                }
            }
        }
    }
}

//struct AlarmDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        AlarmDetailView(model: AlarmDetailViewModel(ogAlarm: .constant(Alarm(time: Date()))))
//    }
//}
