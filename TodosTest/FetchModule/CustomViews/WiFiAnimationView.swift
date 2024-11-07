import SwiftUI

struct WiFiAnimationView: View {
    @State private var scaleSize: CGFloat = .zero
    
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.blue.gradient)
                .ignoresSafeArea()
            
            ForEach(1..<1000) { index in
                addCircleView(delayValue: CGFloat(Double(index) + 0.50))
            }
            
            Circle()
                .fill(.white)
                .frame(width: 150, height: 150)
                .overlay {
                    Image(systemName: "wifi")
                        .foregroundStyle(Color.blue.opacity(0.6))
                        .font(.system(size: 50))
                }
        }.onReceive(timer) { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                scaleSize = 3
            }
        }

    }
    
    
    @ViewBuilder
    func addCircleView(delayValue: CGFloat) -> some View {
        Circle()
            .fill(.white.opacity(scaleSize == 3 ? 0.0 : 1.3))
            .frame(width: 150, height: 150)
            .scaleEffect(scaleSize)
            .animation(.easeInOut(duration: 1.4).delay(delayValue), value: scaleSize)
    }
}

#Preview {
    WiFiAnimationView()
}
