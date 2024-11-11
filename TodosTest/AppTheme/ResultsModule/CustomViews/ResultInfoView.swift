import SwiftUI

struct ResultInfoView: View {
    
    // MARK: - UIConstant
    
    private let cornerRadius: CGFloat = 18
    
    private let imageSize: CGFloat = 28
    
    // MARK: - View
    
    var body: some View {
        HStack {
            Image(AppImage.hugeicon)
                .frame(width: imageSize,
                       height: imageSize)
                .padding()

            Text(AppCaption.changeStatusTodo)
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
