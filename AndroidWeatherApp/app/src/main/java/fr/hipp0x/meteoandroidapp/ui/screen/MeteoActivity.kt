package fr.hipp0x.meteoandroidapp.ui.screen

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.text.KeyboardActions
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.material3.TextField
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import fr.hipp0x.meteoandroidapp.ui.theme.MeteoAndroidAppTheme

class MeteoActivity : ComponentActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            MeteoAndroidAppTheme {
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colorScheme.background
                ) {
                    val meteoViewModel = MeteoViewModel()
                    Meteo(meteoViewModel)
                }
            }
        }
    }

}

@Composable
fun Meteo(
    meteoViewModel: MeteoViewModel,
    modifier: Modifier = Modifier
) {
    var ville by remember { mutableStateOf("") }

    Column(
        horizontalAlignment = Alignment.CenterHorizontally,
        modifier = modifier
    ) {
        TextField(
            value = ville,
            onValueChange = { ville = it },
            placeholder = { Text("Ville") },
            leadingIcon = { Text("🌍") },
            maxLines = 1,
            keyboardActions = KeyboardActions(
                onSearch = {
                    meteoViewModel.getMeteo(ville)
                }
            ),
            keyboardOptions = KeyboardOptions(
                imeAction = androidx.compose.ui.text.input.ImeAction.Search
            ),
            modifier = Modifier.padding(50.dp)
        )
        Text(
            text = "Temperature pour ${meteoViewModel.meteoUiState.location.name}",
            style = MaterialTheme.typography.titleLarge,
            modifier = Modifier.padding(40.dp),
        )
        Text(
            text = "${meteoViewModel.meteoUiState.current.temp_c} °C",
            style = MaterialTheme.typography.titleLarge,
            fontSize = 50.sp,
            modifier = Modifier.padding(20.dp)
        )
    }
}