import Foundation

struct Todo: Codable, Hashable {
    let userID, id: Int
    let title: String
    var completed: Bool

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, completed
    }
    
    mutating func toggleCompleted(bool: inout Bool) {
        completed = bool
    }
}
