//
//  Copyright (c) 2014-2016 Actor LLC. <https://actor.im>
//

import Foundation

public class ActorApplicationDelegate: ActorSDKDelegateDefault, UIApplicationDelegate {
    
    public override init() {
        super.init()
        
        ActorSDK.sharedActor().delegate = self
    }
    
    public func applicationDidFinishLaunching(application: UIApplication) {
        ActorSDK.sharedActor().applicationDidFinishLaunching(application)
    }
    
    public func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        ActorSDK.sharedActor().applicationDidFinishLaunching(application)
        return true
    }
    
    public func applicationDidBecomeActive(application: UIApplication) {
        ActorSDK.sharedActor().applicationDidBecomeActive(application)
    }
    
    public func applicationWillEnterForeground(application: UIApplication) {
        ActorSDK.sharedActor().applicationWillEnterForeground(application)
    }
    
    public func applicationDidEnterBackground(application: UIApplication) {
        ActorSDK.sharedActor().applicationDidEnterBackground(application)
    }
    
    public func applicationWillResignActive(application: UIApplication) {
        ActorSDK.sharedActor().applicationWillResignActive(application)
    }
    
    public func application(application: UIApplication, didRegisterUserNotificationSettings notificationSettings: UIUserNotificationSettings) {
        ActorSDK.sharedActor().application(application, didRegisterUserNotificationSettings: notificationSettings)
    }
    
    public func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        return ActorSDK.sharedActor().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
    }
    
    public func application(application: UIApplication, handleOpenURL url: NSURL) -> Bool {
        return ActorSDK.sharedActor().application(application, handleOpenURL: url)
    }
}