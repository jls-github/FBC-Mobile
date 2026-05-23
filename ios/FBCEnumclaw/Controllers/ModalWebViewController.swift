import UIKit
import HotwireNative

/// Presented as a sheet for paths configured with context: "modal" (e.g. prayer requests).
class ModalWebViewController: HotwireWebViewController {

    private let url: URL

    init(url: URL) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { fatalError() }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .close,
            target: self,
            action: #selector(dismissModal)
        )
    }

    @objc private func dismissModal() {
        dismiss(animated: true)
    }
}
