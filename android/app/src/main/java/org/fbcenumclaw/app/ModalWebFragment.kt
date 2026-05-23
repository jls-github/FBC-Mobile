package org.fbcenumclaw.app

import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import dev.hotwire.navigation.fragments.HotwireWebBottomSheetFragment
import dev.hotwire.navigation.navigator.NavigatorRule

/** Presented as a bottom sheet for paths with context: "modal" (e.g. prayer requests) */
@HotwireDestination(uri = "turbo://fragment/modal")
class ModalWebFragment : HotwireWebBottomSheetFragment()
