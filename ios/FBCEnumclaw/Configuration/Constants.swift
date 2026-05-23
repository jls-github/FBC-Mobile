import Foundation

enum Constants {
    /// The root URL of the deployed Rails server.
    /// Change this to http://localhost:3000 for local development.
    static let serverURL = URL(string: "https://fbcenumclaw.org")!

    static let pathConfigurationURL =
        serverURL.appendingPathComponent("hotwire-native-configuration.json")
}
