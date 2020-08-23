import UIKit
import Flutter
import GoogleMaps
  
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    //Add your Google Maps API Key here
    GMSServices.provideAPIKey("AIzaSyDZj_MBt_xAjodonzxv-awa9Vk0d55ZRMI")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}