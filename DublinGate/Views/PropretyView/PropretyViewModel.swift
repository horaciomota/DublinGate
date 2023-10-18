
import SwiftUI

class PropretyViewModel: ObservableObject {
    @Published var dublinResults: [DublinGateResponse] = []
    @Published var favoritedProperties: Set<Int> = Set()


    func fetchPropertyData() {
        Task {
            do {
                dublinResults = try await ApiService()
            } catch {
                print("Error fetching data: \(error)")
            }
        }
    }
    
}

