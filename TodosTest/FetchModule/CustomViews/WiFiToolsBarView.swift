import SwiftUI

struct WiFiToolsBarView: View {
    // MARK: - Properties
    
    @Binding var isWifiOn: Bool
    
    // MARK: - UIConstant
    
    private let cornerRadius: CGFloat = 40
    
    private let widthForButtonTitle: CGFloat = 155
    
    private var toolColor: Color {
        return isWifiOn ? Color.appGreen.opacity(0.5) : Color.appGreen
    }
    
    // MARK: - View
    
    var body: some View {
        HStack {
            Button(action: {}) {
                Text(AppCaption.showResults)
                    .foregroundStyle(.black)
                    .padding()
                    .frame(width: widthForButtonTitle)
                    .background(toolColor)
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            }
            .disabled(isWifiOn)
            .padding()
            Spacer()
            Toggle(isOn: .constant(isWifiOn)) {}
                .tint(toolColor)
                .padding()
                .disabled(isWifiOn)
        }
        .background(Color.lightGray)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        .padding(.horizontal)
    }
}

#Preview {
    WiFiToolsBarView(isWifiOn: .constant(true))
}
