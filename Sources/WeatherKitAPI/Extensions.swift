@preconcurrency import WeatherKit
import CoreLocation

extension CurrentWeather {
    
    private var numberFormatter : MeasurementFormatter {
        let formatter = MeasurementFormatter()
        formatter.numberFormatter.maximumFractionDigits = 0
        return formatter
    }
    
    /// Gets back wind speed in the current location
    public var windSpeed : String {
        numberFormatter.string(from: self.wind.speed)
    }
    
    /// Gets back humidity in the current location
    public var humidityPercentage : String {
        "\((self.humidity * 100).formatted(.number.precision(.fractionLength(0))))%"
    }
    
    /// Gets back value of UV Index in the current location
    public var uvIndexValue : String {
        "\(self.uvIndex.value)"
    }
    
    /// Gets back value of UV Category in the current location
    public var uvIndexCategory : String {
        "\(self.uvIndex.category)"
    }
    
    /// Gets back value of dew point in the current location
    public var dewPointValue : String {
        numberFormatter.string(from: self.dewPoint)
    }
    
}

extension WeatherKitAPI {
    
    /// WeatherPeriod object is used to simplify the WeatherKitAPI methods'
    /// signatures.
    /// - startDate: Date - the start date of the specific period of time
    /// - endDate: Date - the start date of the specific period of time
    /// - location: CLLocation - the current user's location
    struct WeatherPeriod {
        
        let startDate, endDate : Date
        let location : CLLocation
        
    }
    
}
