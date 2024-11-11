import Foundation
import SwiftUI

final class FetchViewModel: ObservableObject {
    @Published var todos: [Todo] = [] {
        didSet {
            completionRequest?()
        }
    }
    
    var completionRequest: EmptyBlock?
    
    private var httpGatewayManager: HttpGatewayManager = .init()
    
    func clearTodos() {
        todos = []
    }
    
    func getTodos(_ isToggle: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.httpGatewayManager.get(
                route: isToggle ? FetchApiRoutes.todosWithUserId : FetchApiRoutes.todos,
                completion: self.onGetTodosResponse,
                errorCompletion: self.onGetTodosError
            )
        }
    }
    
    private func onGetTodosResponse(response: [Todo]) {
        todos = response
    }
    
    private func onGetTodosError(error: HttpError) {
        print(error)
    }
    
    private enum FetchApiRoutes {
        static let todos = "todos/"
        static let todosWithUserId = "todos?userId=5"
    }
}
