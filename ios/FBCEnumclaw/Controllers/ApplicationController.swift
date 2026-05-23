import UIKit
import HotwireNative

/// Base web view controller. Subclass this to add screen-specific native behavior.
class ApplicationController: HotwireWebViewController {

    private let navy = UIColor(red: 0.118, green: 0.227, blue: 0.373, alpha: 1)
    private let gold = UIColor(red: 0.788, green: 0.659, blue: 0.298, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }

    // Pull-to-refresh is enabled per-path via the path configuration.
}
