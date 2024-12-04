@preconcurrency import WeatherKit
import CoreLocation

extension CurrentWeather {
    
    private var numberFormatter : MeasurementFormatter {
        let formatter = MeasurementFormatter()
        formatter.numberFormatter.maximumFractionDigits = 0
        return formatter
    }
    
    public var windSpeed : String {
        numberFormatter.string(from: self.wind.speed)
    }
    
    public var humidityPercentage : String {
        "\((self.humidity * 100).formatted(.number.precision(.fractionLength(0))))%"
    }
    
    public var uvIndexValue : String {
        "\(self.uvIndex.value)"
    }
    
    public var uvIndexCategory : String {
        "\(self.uvIndex.category)"
    }
    
    public var dewPointValue : String {
        numberFormatter.string(from: self.dewPoint)
    }
    
}

extension WeatherKitAPI {
    
    struct WeatherPeriod {
        
        let startDate, endDate : Date
        let location : CLLocation
        
    }
    
}
