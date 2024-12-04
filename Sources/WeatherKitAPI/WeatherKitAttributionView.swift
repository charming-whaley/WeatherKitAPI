import SwiftUI
import WeatherKit

struct WeatherKitAttributionView : View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    let controller = WeatherKitAPI.shared
    
    @State private var attribution : WeatherAttribution?
    
    var mode : AttributionMode
    
    var body : some View {
        VStack(alignment: .center, spacing: 0.0) {
            if let attribution = attribution {
                AsyncImage(url: colorScheme == .dark ? attribution.combinedMarkDarkURL : attribution.combinedMarkLightURL) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(height: 20.0)
                } placeholder: {
                    ProgressView()
                }
                
                switch mode {
                case .informative:
                    Text(.init("[\(attribution.serviceName)](\(attribution.legalPageURL))"))
                case .noninformative:
                    EmptyView()
                @unknown default:
                    EmptyView()
                }
            }
        }
        .task {
            self.attribution = await controller.weatherAttribution()
        }
    }
    
}

#Preview {
    WeatherKitAttributionView(mode: .informative)
}
