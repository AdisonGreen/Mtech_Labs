//
//  AppDelegate.swift
//  BillManager
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let center = UNUserNotificationCenter.current()
        
        let reminder = UNNotificationAction(identifier: "RemindMe", title: "Remind me later", options: [])
        let billPaid = UNNotificationAction(identifier: "BillPaid", title: "Mark as paid", options: [.authenticationRequired])
        let category = UNNotificationCategory(identifier: Bill.notificationCategoryID, actions: [reminder, billPaid], intentIdentifiers: [], options: [])
        
        center.setNotificationCategories([category])
        center.delegate = self
        
        return true
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let notificationID = response.notification.request.identifier
        
        guard var bill = Database.shared.getBill(forNotificationID: notificationID) else {
            completionHandler()
            return
        }
        
        switch response.actionIdentifier {
        case "RemindMe":
            let newTime = Date().addingTimeInterval(60 * 60)
            bill.scheduleReminders(dateOfReminder: newTime, completion: { (newBill) in
                Database.shared.updateAndSave(newBill)
            })
            
        case "BillPaid":
            bill.paidDate = Date()
            Database.shared.updateAndSave(bill)
            
        default:
            break
        }
        completionHandler()
    }
}

