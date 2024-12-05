@preconcurrency import WeatherKit
import CoreLocation

@MainActor
final class WeatherKitAPI {
    
    static let shared = WeatherKitAPI()
    
    private let service = WeatherService()
    
    /// Used for converting temperature to local standarts
    public var temperatureFormatter : MeasurementFormatter = {
        let formatter = MeasurementFormatter()
        formatter.locale = Locale(identifier: NSLocale.current.language.languageCode?.identifier ?? "en_US")
        formatter.numberFormatter.maximumFractionDigits = 0
        return formatter
    }()
    
    /// retrieveWeather(ByLocation:_) creates CurrentWeather object by the
    /// current location. It's useful in case when there's the LocationController
    /// in the project.
    /// - ByLocation: CLLocation is the CLLocation object of the current location
    public func retrieveWeather(ByLocation location : CLLocation) async -> CurrentWeather? {
        await Task.detached(priority: .userInitiated) {
            try? await self.service.weather(for: location, including: .current)
        }.value
    }
    
    /// retrieveMinuteWeather(ByLocation:_) creates Forecast object by the
    /// current location. It's useful in case when there's the LocationController
    /// in the project.
    /// - ByLocation: CLLocation is the CLLocation object of the current location
    public func retrieveMinuteWeather(ByLocation location : CLLocation) async -> Forecast<MinuteWeather>? {
        await Task.detached(priority: .userInitiated) {
            try? await self.service.weather(for: location, including: .minute)
        }.value
    }
    
    /// retrieveHourlyWeather(ByLocation:_) creates Forecast object by the
    /// current location. It's useful in case when there's the LocationController
    /// in the project.
    /// - ByLocation: CLLocation is the CLLocation object of the current location
    public func retrieveHourlyWeather(ByLocation location : CLLocation) async -> Forecast<HourWeather>? {
        await Task.detached(priority: .userInitiated) {
            return try? await self.service.weather(for: location, including: .hourly)
        }.value
    }
    
    /// retrieveHourlyWeatherBetweenDates(ByLocation:_) creates Forecast object by the
    /// WeatherPeriod object. It's useful in case when there's the LocationController
    /// in the project.
    /// - weatherPeriod: WeatherPeriod is the WeatherPeriod object of the current
    /// location and specific Date range
    public func retrieveHourlyWeatherBetweenDates(_ weatherPeriod: WeatherPeriod) async -> Forecast<HourWeather>? {
        await Task.detached(priority: .userInitiated) {
            try? await self.service.weather(for: weatherPeriod.location, including: .hourly(startDate: weatherPeriod.startDate, endDate: weatherPeriod.endDate))
        }.value
    }
    
    /// retrieveDailyWeather(ByLocation:_) creates Forecast object by the
    /// current location. It's useful in case when there's the LocationController
    /// in the project.
    /// - ByLocation: CLLocation is the CLLocation object of the current location
    public func retrieveDailyWeather(ByLocation location : CLLocation) async -> Forecast<DayWeather>? {
        await Task.detached(priority: .userInitiated) {
            try? await self.service.weather(for: location, including: .daily)
        }.value
    }
    
    /// retrieveDailyWeatherBetweenDates(ByLocation:_) creates Forecast object by the
    /// WeatherPeriod object. It's useful in case when there's the LocationController
    /// in the project.
    /// - weatherPeriod: WeatherPeriod is the WeatherPeriod object of the current
    /// location and specific Date range
    public func retrieveDailyWeatherBetweenDates(_ weatherPeriod: WeatherPeriod) async -> Forecast<DayWeather>? {
        await Task.detached(priority: .userInitiated) {
            try? await self.service.weather(for: weatherPeriod.location, including: .daily(startDate: weatherPeriod.startDate, endDate: weatherPeriod.endDate))
        }.value
    }
    
    /// retrieveWeatherChanges(ByLocation:_) gets back WeatherChanges object by the
    /// current location. It's useful in case when there's the LocationController
    /// in the project.
    /// - ByLocation: CLLocation is the CLLocation object of the current location
    public func retrieveWeatherChanges(ByLocation location : CLLocation) async -> WeatherChanges? {
        await Task.detached(priority: .userInitiated) {
            try? await self.service.weather(for: location, including: .changes)
        }.value
    }
    
    /// retrieveHistoricalWeatherTrends(ByLocation:_) gets back HistoricalComparisons object by the
    /// current location. It's useful in case when there's the LocationController
    /// in the project.
    /// - ByLocation: CLLocation is the CLLocation object of the current location
    public func retrieveHistoricalWeatherTrends(ByLocation location : CLLocation) async -> HistoricalComparisons? {
        await Task.detached(priority: .userInitiated) {
            try? await self.service.weather(for: location, including: .historicalComparisons)
        }.value
    }
    
    /// weatherAttribution() provides WeatherAttribution object
    /// which is useful for apps where it's a necessity to add
    /// Apple's WeatherKit logo
    public func weatherAttribution() async -> WeatherAttribution? {
        await Task(priority: .userInitiated) {
            try? await self.service.attribution
        }.value
    }
    
}
