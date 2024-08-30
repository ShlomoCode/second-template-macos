import Foundation
import SecondTempleTimer

class TempleTimeViewModel: ObservableObject {
    @Published var totalDays: Int32 = 0
    @Published var years: Int32 = 0
    @Published var months: Int32 = 0
    @Published var days: Int32 = 0
    @Published var hours: Int32 = 0
    @Published var minutes: Int32 = 0
    @Published var seconds: Int32 = 0

    private let provider = TimeIntervalProviderImpl()
    private var timer: Timer?

    init() {
        updateTime()
        startTimer()
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.updateTime()
        }
    }

    private func updateTime() {
        let interval = provider.calculateTimeIntervalSinceTempleDestruction()
        totalDays = interval.totalNumberOfDays
        years = interval.years
        months = interval.months
        days = interval.days
        hours = interval.hours
        minutes = interval.minutes
        seconds = interval.secondes
    }

    deinit {
        timer?.invalidate()
    }
}
