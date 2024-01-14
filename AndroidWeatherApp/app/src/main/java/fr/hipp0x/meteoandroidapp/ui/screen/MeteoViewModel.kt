package fr.hipp0x.meteoandroidapp.ui.screen

import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.setValue
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import fr.hipp0x.meteoandroidapp.network.CurrentWeather
import fr.hipp0x.meteoandroidapp.network.MeteoApi
import kotlinx.coroutines.launch

class MeteoViewModel : ViewModel() {

    var meteoUiState: CurrentWeather by mutableStateOf(CurrentWeather())
        private set

    fun getMeteo(query: String) {
        viewModelScope.launch {
            try {
                val meteo = MeteoApi.retrofitService.getCurrentMeteo(q = query)
                meteoUiState = meteo
            } catch (e: Exception) {
                e.printStackTrace()
            }
        }
    }
}