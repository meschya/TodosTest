import SwiftUI

struct FetchView: View {
    // MARK: - Properties
    
    // MARK: Public
    
    @ObservedObject var fetchViewModel = FetchViewModel()
    
    @State var isWifiOn: Bool
    
    @State var isShowResults: Bool
    
    @State var isToggle: Bool
    
    // MARK: - View
    
    var body: some View {
        NavigationView {
            ZStack {
                Color
                    .background
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    NavigationLink(destination: ResultsView(todos: fetchViewModel.todos, disappear: fetchViewModel.clearTodos).navigationBarBackButtonHidden(true),
                                   isActive: $isShowResults) { EmptyView() }
                    WifiButtonView(isWifiOn: $isWifiOn,
                                   isToggle: $isToggle,
                                   viewModel: fetchViewModel)
                        .background(PulsatingWavesView(isWifiOn: $isWifiOn))
                    Spacer()
                    InformationView(isWifiOn: $isWifiOn)
                    WiFiToolsBarView(isWifiOn: $isWifiOn,
                                     isToggle: $isToggle,
                                     viewModel: fetchViewModel,
                                     clickButton: {
                        self.isShowResults = true
                    }
                    )
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
    FetchView(isWifiOn: false, isShowResults: true, isToggle: false)
}
