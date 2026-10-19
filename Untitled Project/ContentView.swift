import SwiftUI
import Playgrounds


struct HourForecast: Identifiable {
    var id = UUID()
    var time: String
    var icon: String
    var temp: Int
}

struct DayForecast: Identifiable {
    var id = UUID()
    var day: String
    var icon: String
    var low: Int
    var high: Int
}

struct ContentView: View {
    let hours = [
        HourForecast(time: "Now", icon: "sun.max.fill", temp: 54),
        HourForecast(time: "1PM", icon: "sun.max.fill", temp: 55),
        HourForecast(time: "2PM", icon: "sun.max.fill", temp: 57),
        HourForecast(time: "3PM", icon: "cloud.sun.fill", temp: 53),
        HourForecast(time: "4PM", icon: "sun.max.fill", temp: 51),
        HourForecast(time: "4:49", icon: "sunset.fill", temp: 50),
        HourForecast(time: "5PM", icon: "moon.fill", temp: 48),
        HourForecast(time: "6PM", icon: "moon.fill", temp: 46)
    ]

    let days = [
        DayForecast(day: "Today", icon: "cloud.fill", low: 45, high: 57),
        DayForecast(day: "Mon", icon: "sun.max.fill", low: 54, high: 70),
        DayForecast(day: "Tue", icon: "cloud.rain.fill", low: 43, high: 52),
        DayForecast(day: "Wed", icon: "cloud.heavyrain.fill", low: 33, high: 45),
        DayForecast(day: "Thu", icon: "sun.max.fill", low: 28, high: 32),
        DayForecast(day: "Fri", icon: "cloud.fill", low: 25, high: 33),
        DayForecast(day: "Sat", icon: "snowflake", low: 23, high: 30),
        DayForecast(day: "Sun", icon: "snowflake", low: 21, high: 29),
        DayForecast(day: "Mon", icon: "sun.max.fill", low: 30, high: 43),
        DayForecast(day: "Tue", icon: "cloud.sun.fill", low: 40, high: 53)
    ]

    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, Color(red: 0.7, green: 0.85, blue: 1.0)],
                           startPoint: .top,
                           endPoint: .bottom)
            .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 20) {

                    // Top section
                    VStack {
                        Text("Chapel Hill")
                            .font(.largeTitle)
                        Text("55°")
                            .font(.system(size: 96, weight: .thin))
                        Text("Sunny")
                            .font(.title3)
                            .opacity(0.8)
                        Text("H:57°  L:45°")
                            .font(.title3)
                    }
                    .foregroundStyle(.white)
                    .padding(.vertical, 30)

                    // Hourly forecast card
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "clock")
                            Text("HOURLY FORECAST")
                        }
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.7))

                        ScrollView(.horizontal) {
                            HStack(spacing: 25) {
                                // FOREACH: one HourView per hour
                                ForEach(hours) { hour in
                                    HourView(hour: hour)
                                }
                            }
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white.opacity(0.15)))

                    // 10-day forecast card
                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            Image(systemName: "calendar")
                            Text("10-DAY FORECAST")
                        }
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.7))

                        // FOREACH: one DayRowView per day
                        ForEach(days) { day in
                            DayRowView(day: day)
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white.opacity(0.15)))
                }
                .padding(.horizontal)
            }
        }
    }
}

// SUBVIEW: one column in the hourly forecast
struct HourView: View {
    var hour: HourForecast

    var body: some View {
        VStack(spacing: 12) {
            Text(hour.time)
            Image(systemName: hour.icon)
                .symbolRenderingMode(.multicolor)
                .font(.title2)
            Text("\(hour.temp)°")
        }
        .foregroundStyle(.white)
        .fontWeight(.medium)
    }
}

// SUBVIEW: one row in the 10-day forecast
struct DayRowView: View {
    var day: DayForecast

    var body: some View {
        HStack {
            Text(day.day)
                .frame(width: 60, alignment: .leading)

            Spacer()

            Image(systemName: day.icon)
                .symbolRenderingMode(.multicolor)
                .frame(width: 30)

            Spacer()

            Text("\(day.low)°")
                .opacity(0.6)

            // Temperature bar
            ZStack(alignment: .leading) {
                Capsule()
                    .fill(.white.opacity(0.3))
                    .frame(width: 100, height: 4)
                Capsule()
                    .fill(.cyan)
                    .frame(width: 40, height: 4)
            }

            Text("\(day.high)°")
        }
        .font(.title3)
        .foregroundStyle(.white)
    }
}

#Preview {
    ContentView()
}

#Playground {
    _ = 1 + 2
}
