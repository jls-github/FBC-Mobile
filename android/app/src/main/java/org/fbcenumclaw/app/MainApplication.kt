package org.fbcenumclaw.app

import android.app.Application
import dev.hotwire.core.config.Hotwire
import dev.hotwire.core.files.util.HotwireFileProvider

class MainApplication : Application() {

    override fun onCreate() {
        super.onCreate()
        configureHotwire()
    }

    private fun configureHotwire() {
        Hotwire.config.applicationRootUrl = Constants.SERVER_URL

        // Load path configuration from the server
        Hotwire.loadPathConfiguration(
            context = this,
            location = dev.hotwire.core.config.PathConfiguration.Location(
                remoteFileUrl = Constants.PATH_CONFIGURATION_URL
            )
        )
    }
}
