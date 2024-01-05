import SwiftUI


class ViewModel: ObservableObject {
    
    @Published var desserts: [Dessert] = []
    
    func fetch() {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in 
            guard let data = data, error == nil else {
                print("Error fetching data:", error?.localizedDescription ?? "Unknown error")
                return
            }
            
            print("Raw data from API:", String(data: data, encoding: .utf8) ?? "Unable to convert to string")
            
            do {
                let desserts = try JSONDecoder().decode([Dessert].self, from: data)
                DispatchQueue.main.async {
                    self?.desserts = desserts
                }
            } catch {
                print("Error decoding JSON:", error)
            }
        }
        task.resume()
    }
    
}
