import SwiftUI

struct ResultsView: View {
    // MARK: - Properties
    
    @State var todos: [Todo] = []
    
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
                    
                    Button(action: {}) {
                        Text(AppCaption.done)
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.black)
                            .padding()
                            .background(Color.appGreen)
                            .clipShape(RoundedRectangle(cornerRadius: 40))
                    }.padding(.horizontal)
                }
            }
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
    private func createTableOfTodos() -> some View {
        List {
            Section {
                ForEach(todos, id: \.self) { item in
                    if item.completed == false {
                        ResultCellView(text: item.title,
                                       isCompleted: item.completed)
                            .onTapGesture {
                                self.todos[item.id - 1].completed.toggle()
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
                ForEach(todos, id: \.self) { item in
                    if item.completed == true {
                        ResultCellView(text: item.title,
                                       isCompleted: item.completed)
                        .onTapGesture {
                            self.todos[item.id - 1].completed.toggle()
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
    ResultsView()
}
