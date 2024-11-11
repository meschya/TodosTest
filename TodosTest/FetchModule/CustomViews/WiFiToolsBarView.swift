import SwiftUI

struct WiFiToolsBarView: View {
    // MARK: - Properties
    
    @Binding var isWifiOn: Bool
    
    @Binding var isToggle: Bool
    
    @ObservedObject var viewModel: FetchViewModel
    
    var clickButton: EmptyBlock
    
    // MARK: - UIConstant
    
    private let cornerRadius: CGFloat = 40
    
    private let widthForButtonTitle: CGFloat = 155
    
    private var toolColor: Color {
        return viewModel.todos.isEmpty ? Color.appGreen.opacity(0.5) : Color.appGreen
    }
    
    // MARK: - View
    
    var body: some View {
        HStack {
            Button(action: {
                clickButton()
            }) {
                Text(AppCaption.showResults)
                    .foregroundStyle(.black)
                    .padding()
                    .frame(width: widthForButtonTitle)
                    .background(toolColor)
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            }
            .disabled(viewModel.todos.isEmpty)
            .padding()
            Spacer()
            Toggle(isOn: $isToggle) {}
                .padding()
                .disabled(isWifiOn)
                .toggleStyle(ImageToggleStyle(onImageName: AppImage.personFill,
                                              offImageName: AppImage.personSlashFill))
        }
        .background(Color.lightGray)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        .padding(.horizontal)
    }
}
