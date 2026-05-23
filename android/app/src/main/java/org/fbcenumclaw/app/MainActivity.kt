package org.fbcenumclaw.app

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import androidx.navigation.fragment.NavHostFragment
import androidx.navigation.ui.setupWithNavController
import org.fbcenumclaw.app.databinding.ActivityMainBinding

class MainActivity : AppCompatActivity() {

    private lateinit var binding: ActivityMainBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
        setupBottomNavigation()
    }

    private fun setupBottomNavigation() {
        val navHostFragment = supportFragmentManager
            .findFragmentById(R.id.nav_host_fragment) as NavHostFragment
        val navController = navHostFragment.navController
        binding.bottomNav.setupWithNavController(navController)

        // Re-load the tab root when re-selecting an already-selected tab
        binding.bottomNav.setOnItemReselectedListener { item ->
            val fragment = supportFragmentManager
                .findFragmentById(R.id.nav_host_fragment)
                ?.childFragmentManager
                ?.fragments
                ?.firstOrNull()
            if (fragment is WebFragment) {
                fragment.navigate(tabUrlForMenuId(item.itemId))
            }
        }
    }

    private fun tabUrlForMenuId(itemId: Int): String = when (itemId) {
        R.id.nav_home    -> Constants.URL_HOME
        R.id.nav_sermons -> Constants.URL_SERMONS
        R.id.nav_events  -> Constants.URL_EVENTS
        R.id.nav_connect -> Constants.URL_CONNECT
        R.id.nav_give    -> Constants.URL_GIVE
        else             -> Constants.URL_HOME
    }
}
