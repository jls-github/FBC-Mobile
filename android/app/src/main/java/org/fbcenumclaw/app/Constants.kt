package org.fbcenumclaw.app

object Constants {
    /** Change to "http://10.0.2.2:3000" for Android emulator local dev */
    const val SERVER_URL = "https://fbcenumclaw.org"

    const val PATH_CONFIGURATION_URL = "$SERVER_URL/hotwire-native-configuration.json"

    // Tab root URLs
    const val URL_HOME    = SERVER_URL
    const val URL_SERMONS = "$SERVER_URL/sermons"
    const val URL_EVENTS  = "$SERVER_URL/events"
    const val URL_CONNECT = "$SERVER_URL/groups"
    const val URL_GIVE    = "$SERVER_URL/give"
}
