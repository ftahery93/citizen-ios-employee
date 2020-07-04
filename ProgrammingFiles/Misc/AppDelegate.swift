//store = 1, services = 5

import UIKit
import Foundation
import CoreData
import IQKeyboardManagerSwift
import Localize_Swift
import GoogleMaps
import GooglePlaces
import Alamofire

let googleApiKey = "AIzaSyCLq3t3FH9jfCRdgUEbBiLx030Ysi4UqJU"

let screenSize: CGRect = UIScreen.main.bounds
let screenWidth = screenSize.width
let screenHeight = screenSize.height
var globalCartCount = 0
var globalCartType : cartTypeEnum!
var isloggedin = false
var globalImageurl = ""
var globalImageFrame : CGRect = .zero
var globalDestImageFrame : CGRect = .zero
var globalAnimationDuration = 0.4
var defaultAddress : Addresses?
enum cartTypeEnum {
    case store
    case service
    case empty
}
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
 

        IQKeyboardManager.shared.enable = true
        UITableView.appearance().backgroundColor = .clear
        UITableView.appearance().separatorStyle = .none
        
        if( UserDefaults.standard.bool(forKey: "isloggedin") == nil ){
            UserDefaults.standard.set(false, forKey: "isloggedin")
            UserDefaults.standard.synchronize()
            isloggedin = false
        } else {
            isloggedin = UserDefaults.standard.bool(forKey: "isloggedin") 
        }
         
        
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
        
    }
    
    
    // MARK: UISceneSession Lifecycle
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "T3ALm")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}

