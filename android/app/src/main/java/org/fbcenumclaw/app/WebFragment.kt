package org.fbcenumclaw.app

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import dev.hotwire.navigation.fragments.HotwireWebFragment
import dev.hotwire.navigation.navigator.NavigatorRule
import org.fbcenumclaw.app.databinding.FragmentWebBinding

@HotwireDestination
class WebFragment : HotwireWebFragment() {

    private var _binding: FragmentWebBinding? = null
    private val binding get() = _binding!!

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?
    ): View {
        _binding = FragmentWebBinding.inflate(inflater, container, false)
        return binding.root
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        setupToolbar()
    }

    private fun setupToolbar() {
        // Hide the toolbar for tab root screens; show it for detail screens
        val isTabRoot = listOf(
            Constants.URL_HOME, Constants.URL_SERMONS, Constants.URL_EVENTS,
            Constants.URL_CONNECT, Constants.URL_GIVE
        ).contains(location)
        binding.toolbar.visibility = if (isTabRoot) View.GONE else View.VISIBLE
    }

    fun navigate(url: String) {
        navigator.navigate(url)
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}
