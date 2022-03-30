//
//  Bill+Extras.swift
//  BillManager
//

import Foundation
import UserNotifications

extension Bill {
    static let notificationCategoryID = "notificationIdentifier"
    
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
    
    var hasReminder: Bool {
        return (remindDate != nil)
    }
    
    var isPaid: Bool {
        return (paidDate != nil)
    }
    
    var formattedDueDate: String {
        let dateString: String
        
        if let dueDate = self.dueDate {
            dateString = Bill.dateFormatter.string(from: dueDate)
        } else {
            dateString = ""
        }
        
        return dateString
    }
    
    mutating func removeReminders() {
        if let id = notificationID {
            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [id])
            notificationID = nil
            remindDate = nil
        }
    }
    
    mutating func scheduleReminders(dateOfReminder: Date, completion: @escaping (Bill) -> ()) {
        var updatedBill = self
        
        updatedBill.removeReminders()
        authorizeIfNeeded { (granted) in
            guard granted else {
                DispatchQueue.main.async {
                    completion(updatedBill)
                }
                
                return
            }
            
            let content = UNMutableNotificationContent()
            content.title = "Bill Reminder"
            content.body = "\(String(describing: updatedBill.amount)) due to \(String(describing: updatedBill.payee)) on \(updatedBill.formattedDueDate)"
            content.categoryIdentifier = Bill.notificationCategoryID
            
            let triggerDateComonents = Calendar.current.dateComponents([.second, .minute, .hour, .day, .month, .year], from: dateOfReminder)
            let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDateComonents, repeats: false)
            
            let notificationID = UUID().uuidString
            
            let request = UNNotificationRequest(identifier: notificationID, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) { (error: Error?) in
                DispatchQueue.main.async {
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        updatedBill.notificationID = notificationID
                        updatedBill.remindDate = dateOfReminder
                    }
                    
                    DispatchQueue.main.async {
                        completion(updatedBill)
                    }
                }
            }
        }
    }
    
    private func authorizeIfNeeded(completion: @escaping (Bool) -> ()) {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings { (settings) in
            switch settings.authorizationStatus {
            case .authorized:
                completion(true)
    
            case .notDetermined:
                notificationCenter.requestAuthorization(options:
                   [.alert, .sound], completionHandler: { (granted, _) in
                   completion(granted)
                })
    
            case .denied, .provisional:
                completion(false)
            case .ephemeral: break
                
            }
        }
    }
    
}
