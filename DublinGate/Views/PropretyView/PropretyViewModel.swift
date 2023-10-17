
import SwiftUI

class PropretyViewModel: ObservableObject {
    @Published var dublinResults: [DublinGateResponse] = []

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

