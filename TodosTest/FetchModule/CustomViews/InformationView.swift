import SwiftUI

struct InformationView: View {
    // MARK: - Properties
    
    @Binding var isWifiOn: Bool
    
    @State var degreesRotating = 0.0
    
    // MARK: - UIConstant
    
    private let cornerRadius: CGFloat = 18
    
    private let imageSize: CGFloat = 28
    
    // MARK: - View
    
    var body: some View {
        HStack {
            Group {
                if isWifiOn {
                    Image(systemName: AppImage.rays)
                        .frame(width: imageSize,
                               height: imageSize)
                        .symbolEffect(.variableColor.iterative.nonReversing)
                        .foregroundStyle(Color.textGray)
                        .padding()
                } else {
                    Image(AppImage.hugeicon)
                        .frame(width: imageSize,
                               height: imageSize)
                        .padding()
                }
            }

            Text(isWifiOn ? AppCaption.takeACoupleOfSeconds : AppCaption.fetchTodos)
                .foregroundStyle(Color.textGray)
            Spacer()
        }
        .background(Color.lightGray)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        .padding()
    }
}

#Preview {
    InformationView(isWifiOn: .constant(true))
}
