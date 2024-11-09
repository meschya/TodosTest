import SwiftUI

struct FetchView: View {
    // MARK: - Properties
    
    @State var isWifiOn: Bool
    
    // MARK: - View
    
    var body: some View {
        NavigationView {
            ZStack {
                Color
                    .background
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    WifiButtonView(isWifiOn: $isWifiOn)
                        .background(PulsatingWavesView(isWifiOn: $isWifiOn))
                    Spacer()
                    InformationView(isWifiOn: $isWifiOn)
                }
            }
            
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(AppCaption.fetcher)
                        .foregroundStyle(Color.white)
                        .font(.system(size: FetcherUIConstants.fontSize,
                                      weight: .bold))
                }
            }
        }
    }
}

#Preview {
    FetchView(isWifiOn: false)
}
