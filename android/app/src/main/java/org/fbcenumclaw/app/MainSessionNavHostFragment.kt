package org.fbcenumclaw.app

import android.content.Context
import dev.hotwire.navigation.config.HotwireNavHostFragment
import dev.hotwire.navigation.destinations.HotwireDestination

class MainSessionNavHostFragment : HotwireNavHostFragment() {

    override val sessionName = "main"
    override val startLocation = Constants.URL_HOME

    override val registeredActivities: List<Class<*>>
        get() = emptyList()

    override val registeredFragments: List<Class<*>>
        get() = listOf(
            WebFragment::class.java,
            ModalWebFragment::class.java
        )
}
