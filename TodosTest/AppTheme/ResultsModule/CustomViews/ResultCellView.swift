import SwiftUI

struct ResultCellView: View {
    var text: String = ""
    var isCompleted: Bool = true
    
    var body: some View {
        HStack {
            Image(systemName: isCompleted ? AppImage.checkmarkCircleFill : AppImage.multiply)
                .font(.system(size: 20))
                .padding()
                .foregroundStyle(isCompleted ? Color.appGreen : Color.textGray)
                .background(Color.lightGray)
                .clipShape(Circle())
            Text(text)
                .foregroundStyle(Color.white)
                .font(.system(size: 17, weight: .medium))
            Spacer()
            Circle()
                .foregroundStyle(isCompleted ? Color.appGreen : .red)
                .frame(width: 8, height: 8)
                .padding()
        }.background(Color.background)
    }
}

#Preview {
    ResultCellView()
}
