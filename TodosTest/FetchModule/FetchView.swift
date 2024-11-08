import SwiftUI

struct FetchView: View {
    
    @State var isWifiOn: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                Color
                    .background
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    WifiButtonView(isWifiOn: $isWifiOn)
                        .background(PulsatingWavesView(isWifiOn: $isWifiOn))
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
