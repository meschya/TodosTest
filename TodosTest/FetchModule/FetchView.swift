import SwiftUI

struct FetchView: View {
    
    var body: some View {
        NavigationView {
            ZStack {
                Color
                    .background
                    .edgesIgnoringSafeArea(.all)
                VStack {

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
    FetchView()
}
