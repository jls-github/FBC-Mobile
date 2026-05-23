import UIKit
import HotwireNative

/// Root tab bar. Each tab owns its own Navigator (session + navigation stack)
/// so the user can navigate deep inside Sermons while Events stays at its root.
class MainTabBarController: UITabBarController {

    private var tabNavigators: [Navigator] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
    }

    // MARK: - Tab Setup

    private func setupTabs() {
        let tabs: [(title: String, image: String, url: URL)] = [
            ("Home",    "house",      Constants.serverURL),
            ("Sermons", "play.circle", Constants.serverURL.appendingPathComponent("sermons")),
            ("Events",  "calendar",    Constants.serverURL.appendingPathComponent("events")),
            ("Connect", "person.2",    Constants.serverURL.appendingPathComponent("groups")),
            ("Give",    "heart",       Constants.serverURL.appendingPathComponent("give")),
        ]

        viewControllers = tabs.map { tab in
            let navigator = Navigator(delegate: self)
            tabNavigators.append(navigator)

            // Route to the tab's root URL
            navigator.route(tab.url)

            let nav = navigator.rootViewController
            nav.tabBarItem = UITabBarItem(
                title: tab.title,
                image: UIImage(systemName: tab.image),
                selectedImage: UIImage(systemName: tab.image + ".fill")
            )
            return nav
        }
    }
}

// MARK: - NavigatorDelegate

extension MainTabBarController: NavigatorDelegate {
    func handle(proposal: VisitProposal) -> ProposalResult {
        // Prayer requests open as a modal sheet
        if proposal.presentation == .replace &&
           proposal.url.path.hasPrefix("/prayer_requests") {
            return .acceptCustom(ModalWebViewController(url: proposal.url))
        }
        return .accept
    }

    func visitableDidFailRequest(_ visitable: Visitable, error: Error, retryHandler: RetryBlock?) {
        // Show an offline/error screen
        if let controller = visitable as? UIViewController {
            let alert = UIAlertController(
                title: "Connection Error",
                message: "Unable to connect to FBC Enumclaw. Please check your internet connection.",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "Retry", style: .default) { _ in retryHandler?() })
            controller.present(alert, animated: true)
        }
    }
}
