import SwiftUI

struct TempleTimeIntervalRow: View {
    let label: String
    let value: String

    var body: some View {
        HStack {
            Text(label)
                .bold()
            Text(value)
        }
    }
}

struct ContentView: View {
    @StateObject private var viewModel = TempleTimeViewModel()

    var body: some View {
        VStack(spacing: 20) {
            Text("זמן מאז חורבן בית המקדש השני")
                .font(.largeTitle)
                .multilineTextAlignment(.center)

            VStack(alignment: .leading, spacing: 10) {
                TempleTimeIntervalRow(label: "שניות", value: "\(viewModel.seconds)")
                TempleTimeIntervalRow(label: "דקות", value: "\(viewModel.minutes)")
                TempleTimeIntervalRow(label: "שעות", value: "\(viewModel.hours)")
                TempleTimeIntervalRow(label: "ימים", value: "\(viewModel.days)")
                TempleTimeIntervalRow(label: "חודשים", value: "\(viewModel.months)")
                TempleTimeIntervalRow(label: "שנים", value: "\(viewModel.years)")
                TempleTimeIntervalRow(label: "סך הכל ימים", value: "\(viewModel.totalDays)")
            }
        }
        .padding()
    }
}
