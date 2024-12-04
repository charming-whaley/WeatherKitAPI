@preconcurrency import WeatherKit
import CoreLocation

@MainActor
final class WeatherKitAPI {
    
    static let shared = WeatherKitAPI()
    
    let service = WeatherService()
    
    public var temperatureFormatter : MeasurementFormatter = {
        let formatter = MeasurementFormatter()
        formatter.locale = Locale(identifier: NSLocale.current.language.languageCode?.identifier ?? "en_US")
        formatter.numberFormatter.maximumFractionDigits = 0
        return formatter
    }()
    
    public func retrieveWeather(ByLocation location : CLLocation) async -> CurrentWeather? {
        await Task.detached(priority: .userInitiated) {
            try? await self.service.weather(for: location, including: .current)
        }.value
    }
    
    public func retrieveMinuteWeather(ByLocation location : CLLocation) async -> Forecast<MinuteWeather>? {
        await Task.detached(priority: .userInitiated) {
            try? await self.service.weather(for: location, including: .minute)
        }.value
    }
    
    public func retrieveHourlyWeather(ByLocation location : CLLocation) async -> Forecast<HourWeather>? {
        await Task.detached(priority: .userInitiated) {
            return try? await self.service.weather(for: location, including: .hourly)
        }.value
    }
    
    public func retrieveHourlyWeatherBetweenDates(_ weatherPeriod: WeatherPeriod) async -> Forecast<HourWeather>? {
        await Task.detached(priority: .userInitiated) {
            try? await self.service.weather(for: weatherPeriod.location, including: .hourly(startDate: weatherPeriod.startDate, endDate: weatherPeriod.endDate))
        }.value
    }
    
    public func retrieveDailyWeather(ByLocation location : CLLocation) async -> Forecast<DayWeather>? {
        await Task.detached(priority: .userInitiated) {
            try? await self.service.weather(for: location, including: .daily)
        }.value
    }
    
    public func retrieveDailyWeatherBetweenDates(_ weatherPeriod: WeatherPeriod) async -> Forecast<DayWeather>? {
        await Task.detached(priority: .userInitiated) {
            try? await self.service.weather(for: weatherPeriod.location, including: .daily(startDate: weatherPeriod.startDate, endDate: weatherPeriod.endDate))
        }.value
    }
    
    public func retrieveWeatherChanges(ByLocation location : CLLocation) async -> WeatherChanges? {
        await Task.detached(priority: .userInitiated) {
            try? await self.service.weather(for: location, including: .changes)
        }.value
    }
    
    public func retrieveHistoricalWeatherTrends(ByLocation location : CLLocation) async -> HistoricalComparisons? {
        await Task.detached(priority: .userInitiated) {
            try? await self.service.weather(for: location, including: .historicalComparisons)
        }.value
    }
    
    public func weatherAttribution() async -> WeatherAttribution? {
        await Task(priority: .userInitiated) {
            try? await self.service.attribution
        }.value
    }
    
}
