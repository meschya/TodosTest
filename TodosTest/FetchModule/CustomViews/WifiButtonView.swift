import SwiftUI

struct WifiButtonView: View {
    // MARK: - Properties
    
    @Binding var isWifiOn: Bool
    
    // MARK: - UIConstants
    
    private let sizeImage: CGFloat = 120
    
    // MARK: - View
    
    var body: some View {
        Button(action: {
            isWifiOn.toggle()
        },
               label: {
            Image(systemName: AppImage.wifi)
                .resizable()
                .frame(width: sizeImage,
                       height: sizeImage)
                .foregroundStyle(isWifiOn ? Color.appGreen : .white,
                                 isWifiOn ? Color.appLightGreen : Color.lightGray)
        })
    }
}

#Preview {
    WifiButtonView(isWifiOn: .constant(false))
}
