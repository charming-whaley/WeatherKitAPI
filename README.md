# WeatherKitAPI
<p>A simple API that makes it easier to work with WeatherKit from Apple.</p>

# Description
<p>If you always stuck while working with WeatherKit or you want to just do your project rather than focusing on how it works then WeatherKitAPI is a great solution for that</p>

# Getting started
<p>
1. Make sure your project version is: iOS17+, macOS15+, watchOS10+, visionOS1+<br>
2. Download WeatherKitAPI files from the repository using Swift Package Manager<br>
3. Enable WeatherKit in your project (for Apple Developer Program users only)<br>
4. Use necessary function from WeatherKitAPI<br>
</p>

# Usage
<p>Package is followed by WeatherKitAPI class that contains all methods for getting current forecast from Apple.<br>
You may also add WeatherKitAttributionView to your porject in order to show that you are working with WeatherKit. <br>
It is very important to enable WeatherKit in your project, otherwise nothing will happen and your code will throw an error!
</p>

<p>You just need to make a reference to WeatherKitAPI shared in your code:</p>

```
struct ContentView : View {
    
    let controller = WeatherKitAPI.shared

    var body : some View {
        Text("I use WeatherKit!")
    }
    
}
```
