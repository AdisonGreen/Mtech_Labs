//
//  ContentView.swift
//  Alarms
//
//  Created by Adison Green on 12/20/21.
//

import SwiftUI

struct AlarmsListView: View {
    
    @ObservedObject var model: AlarmsListViewModel
    
    var body: some View {
        NavigationView {
            List($model.alarms) { alarm in
                AlarmRowView(alarm: alarm)
                .swipeActions(content: {
                    Button("Delete") {
                        
                    }
                })
            }
            .toolbar {
                Button {
                    
                } label: {
                    Image(systemName: "plus")
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AlarmRowView: View {
    @Binding var alarm: Alarm
    
    var body: some View {
        NavigationLink {
            AlarmDetailView(model: AlarmDetailViewModel(ogAlarm: $alarm))
        } label: {
            Text("\(alarm.time)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmsListView(model: AlarmsListViewModel.fakeData)
    }
}
