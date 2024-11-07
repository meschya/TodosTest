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
                    Text("Fetcher")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 20,
                                      weight: .bold))
                }
            }
        }
    }
}

#Preview {
    FetchView()
}
