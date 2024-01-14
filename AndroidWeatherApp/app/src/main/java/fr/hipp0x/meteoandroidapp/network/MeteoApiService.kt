package fr.hipp0x.meteoandroidapp.network

import retrofit2.Call
import retrofit2.Response
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.converter.scalars.ScalarsConverterFactory
import retrofit2.http.GET
import retrofit2.http.Query

private const val BASE_URL = "https://api.weatherapi.com/v1/"

private val retrofit = Retrofit.Builder()
    .addConverterFactory(GsonConverterFactory.create())
    .baseUrl(BASE_URL)
    .build()

object MeteoApi {
    val retrofitService : MeteoApiService by lazy {
        retrofit.create(MeteoApiService::class.java)
    }
}

interface MeteoApiService {

    @GET("current.json")
    suspend fun getCurrentMeteo(@Query("key") key: String = "2f123af51ccb4ffe9b6233431241201",
                                @Query("q") q: String): CurrentWeather

}