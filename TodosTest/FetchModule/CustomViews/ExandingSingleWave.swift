import SwiftUI

struct ExandingSingleWave: View {
    // MARK: - Properties
    
    // MARK: Public
    
    var waveColor: Color = Color.lightGray
    
    @Binding var isWifiOn: Bool
    
    // MARK: Private
    
    @State private var isAnimating: Bool = false
    
    // MARK: - UIConstants
    
    private let lineWidth: CGFloat = 2
    
    private let speed: CGFloat = 1/2
    
    private let fullScaleEffect: CGFloat = 1
    
    private let appearOpacity: CGFloat = 1
    
    private let linearDuration: CGFloat = 1
    
    // MARK: - View
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(.black, lineWidth: lineWidth)
                .fill(isWifiOn ? Color.appGreen : waveColor)
                .scaleEffect(isAnimating ? fullScaleEffect : .zero)
                .opacity(isAnimating ? .zero : appearOpacity)
                .animation(.linear(duration: linearDuration)
                    .repeatForever(autoreverses: false)
                    .speed(speed), value: isAnimating)
        }
        .onAppear {
            isAnimating.toggle()
        }
    }
}

#Preview {
    ExandingSingleWave(isWifiOn: .constant(false))
}
