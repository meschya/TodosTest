import SwiftUI

struct ResultsView: View {
    // MARK: - Properties
    
    @State var todos: [Todo] = []
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var disappear: EmptyBlock
    
    // MARK: - UIConstant
    
    private let fontSize: CGFloat = 15
    
    // MARK: - View
    
    var body: some View {
        NavigationView {
            ZStack {
                Color
                    .background
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    ResultInfoView()
                    Spacer()
                    createTableOfTodos()
                    
                    Button(action: {
                        disappear()
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text(AppCaption.done)
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.black)
                            .padding()
                            .background(Color.appGreen)
                            .clipShape(RoundedRectangle(cornerRadius: 40))
                    }.padding(.horizontal)
                }
            }
            .navigationBarItems(leading: backButton)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(AppCaption.todos)
                        .foregroundStyle(Color.white)
                        .font(.system(size: FetcherUIConstants.fontSize,
                                      weight: .bold))
                }
            }
        }
    }
    
    @ViewBuilder
    private var backButton: some View {
        Button(action: {
            disappear()
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: AppImage.chevronLeft)
                .foregroundStyle(Color.textGray)
                .scaleEffect(0.6)
                .font(Font.title.weight(.medium))
        }
    }

    @ViewBuilder
    private func createTableOfTodos() -> some View {
        let withIndex = todos.enumerated().map({ $0 })
        List {
            Section {
                ForEach(withIndex, id: \.element) { index, item in
                    if item.completed == false {
                        ResultCellView(text: item.title,
                                       isCompleted: item.completed)
                            .onTapGesture {
                                self.todos[index].completed.toggle()
                            }
                    }
                }
                .background(Color.background)
                .listRowBackground(Color.background)
                .listRowSeparator(.hidden)
                .listSectionSeparator(.visible, edges: .top)

            } header: {
                createHeaderText(AppCaption.notCompleted)
            }

            Section {
                ForEach(withIndex, id: \.element) { index, item in
                    if item.completed == true {
                        ResultCellView(text: item.title,
                                       isCompleted: item.completed)
                        .onTapGesture {
                            self.todos[index].completed.toggle()
                        }
                    }
                }
                .listRowBackground(Color.background)
                .listRowSeparator(.hidden)
                .listSectionSeparator(.visible, edges: .top)
            } header: {
                createHeaderText(AppCaption.completed)
            }
        }
        .scrollContentBackground(.hidden)
        .listStyle(.plain)
    }
    
    @ViewBuilder
    private func createHeaderText(_ text: String) -> some View {
        Text(text)
            .font(.system(size: fontSize))
            .foregroundStyle(Color.textGray)
    }
}

#Preview {
    ResultsView(disappear: {})
}
