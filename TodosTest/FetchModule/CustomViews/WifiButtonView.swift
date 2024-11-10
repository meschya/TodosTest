import SwiftUI

struct WifiButtonView: View {
    // MARK: - Properties
    
    // MARK: Public
    
    @Binding var isWifiOn: Bool

    @ObservedObject var viewModel: FetchViewModel
    
    // MARK: - UIConstants
    
    private let sizeImage: CGFloat = 120
    
    // MARK: - View
    
    var body: some View {
        Button(action: {
                   isWifiOn.toggle()
                   viewModel.getTodos()
                   viewModel.completionRequest = {
                       isWifiOn.toggle()
                   }
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
