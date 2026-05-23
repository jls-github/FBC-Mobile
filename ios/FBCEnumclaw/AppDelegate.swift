import UIKit
import HotwireNative

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        configureHotwire()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    // MARK: - Hotwire Setup

    private func configureHotwire() {
        Hotwire.config.applicationRootURL = Constants.serverURL

        // Load path configuration from the server so rules can be updated
        // without a new app release.
        Hotwire.loadPathConfiguration(from: [
            .server(Constants.pathConfigurationURL)
        ])

        // Match the church brand in native UI elements
        configureAppearance()
    }

    private func configureAppearance() {
        let navy   = UIColor(named: "ChurchNavy")   ?? UIColor(red: 0.118, green: 0.227, blue: 0.373, alpha: 1)
        let gold   = UIColor(named: "ChurchGold")   ?? UIColor(red: 0.788, green: 0.659, blue: 0.298, alpha: 1)
        let white  = UIColor.white

        // Tab bar
        let tabAppearance = UITabBarAppearance()
        tabAppearance.configureWithOpaqueBackground()
        tabAppearance.backgroundColor = white
        tabAppearance.selectionIndicatorTintColor = navy

        let tabItemAppearance = UITabBarItemAppearance()
        tabItemAppearance.normal.iconColor     = .systemGray
        tabItemAppearance.normal.titleTextAttributes   = [.foregroundColor: UIColor.systemGray]
        tabItemAppearance.selected.iconColor   = navy
        tabItemAppearance.selected.titleTextAttributes = [.foregroundColor: navy]
        tabAppearance.stackedLayoutAppearance = tabItemAppearance

        UITabBar.appearance().standardAppearance = tabAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabAppearance

        // Navigation bar
        let navAppearance = UINavigationBarAppearance()
        navAppearance.configureWithOpaqueBackground()
        navAppearance.backgroundColor = navy
        navAppearance.titleTextAttributes    = [.foregroundColor: white]
        navAppearance.largeTitleTextAttributes = [.foregroundColor: white]

        let backImage = UIImage(systemName: "chevron.left")?.withTintColor(gold, renderingMode: .alwaysOriginal)
        navAppearance.setBackIndicatorImage(backImage, transitionMaskImage: backImage)

        UINavigationBar.appearance().standardAppearance   = navAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navAppearance
        UINavigationBar.appearance().compactAppearance    = navAppearance
        UINavigationBar.appearance().tintColor = gold
    }
}
