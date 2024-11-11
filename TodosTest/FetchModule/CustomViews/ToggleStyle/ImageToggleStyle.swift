import SwiftUI

struct ImageToggleStyle: ToggleStyle {
    var onImageName: String
    var offImageName: String
        
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Rectangle()
                .foregroundColor(configuration.isOn ? Color.appGreen : .gray)
                .frame(width: 71, height: 36, alignment: .center)
                .overlay(
                    Image(systemName: configuration.isOn ? onImageName : offImageName)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 71, height: 36, alignment: .center)
                        .offset(x: configuration.isOn ? -16 : 16, y: 0)
                        .font(.system(size: 18))
                        .overlay(
                            Circle()
                                .foregroundColor(.white)
                                .padding(.all, 3)
                                .offset(x: configuration.isOn ? 16 : -16, y: 0)
                                .animation(Animation.linear(duration: 0.1))
                        ).cornerRadius(20)
                        .onTapGesture { configuration.isOn.toggle() }
                        )
                .cornerRadius(20)
        }
    }
}
