import SwiftUI

struct WifiButtonView: View {
    // MARK: - Properties
    
    // MARK: Public
    
    @Binding var isWifiOn: Bool
    
    @Binding var isToggle: Bool

    @ObservedObject var viewModel: FetchViewModel
    
    // MARK: - UIConstants
    
    private let sizeImage: CGFloat = 120
    
    // MARK: - View
    
    var body: some View {
        Button(action: {
                   isWifiOn.toggle()
                   viewModel.getTodos(isToggle)
                   viewModel.completionRequest = {
                       isWifiOn = false
                   }
               },
               label: {
                   Image(systemName: AppImage.wifi)
                       .resizable()
                       .frame(width: sizeImage,
                              height: sizeImage)
                       .foregroundStyle(isWifiOn ? Color.appGreen : .white,
                                        isWifiOn ? Color.appLightGreen : Color.lightGray)
        }).disabled(isWifiOn)
    }
}
