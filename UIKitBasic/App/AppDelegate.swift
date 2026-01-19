//
//  AppDelegate.swift
//  UIKitBasic
//
//  Created by Macbook on 08/01/2026.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("✅ 2. application(_:didFinishLaunchingWithOptions:) -> App đã khởi động xong (Ready).")
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    // 3. App trở thành Active (User tương tác được)
    func applicationDidBecomeActive(_ application: UIApplication) {
        print("🟢 3. applicationDidBecomeActive -> App đã Active (Tương đương onResume).")
    }

    // 4. App sắp mất Active (Có cuộc gọi đến, vuốt Control Center, hoặc sắp về Home)
    func applicationWillResignActive(_ application: UIApplication) {
        print("⚠️ 4. applicationWillResignActive -> App sắp mất focus (Tương đương onPause).")
    }

    // 5. App đã vào Background (Ẩn dưới nền)
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("🌙 5. applicationDidEnterBackground -> App đã vào nền (Tương đương onStop).")
    }

    // 6. App sắp quay lại từ Background
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("☀️ 6. applicationWillEnterForeground -> App sắp quay lại màn hình (Tương đương onRestart/onStart).")
    }

    // 7. App bị kill hẳn (User vuốt tắt app)
    func applicationWillTerminate(_ application: UIApplication) {
        print("💀 7. applicationWillTerminate -> App sắp bị hủy hoàn toàn.")
    }

    // 8. Cảnh báo hết RAM hệ thống
    func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        print("🚨 8. applicationDidReceiveMemoryWarning -> Hệ thống báo hết RAM, hãy giải phóng biến không cần thiết!")
    }

}

