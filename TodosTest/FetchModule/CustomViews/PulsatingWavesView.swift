import SwiftUI

struct PulsatingWavesView: View {
    // MARK: - Properties
    
    @Binding var isWifiOn: Bool
    
    // MARK: - UIConstants
    
    private let rangeOfCircles = 1 ..< 5
    
    private let circleSize = 120
    
    // MARK: - View
    
    var body: some View {
        ZStack {
            ForEach(rangeOfCircles, id: \.self) { index in
                let waveRadius = CGFloat(index * circleSize)
                ExandingSingleWave(isWifiOn: $isWifiOn)
                    .frame(width: waveRadius,
                           height: waveRadius)
            }
        }
    }
}

#Preview {
    PulsatingWavesView(isWifiOn: .constant(false))
}
