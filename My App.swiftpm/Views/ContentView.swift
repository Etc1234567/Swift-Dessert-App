import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.desserts, id: \.self) { dessert in 
                    HStack {
                        Text(dessert.strMeal)
                            .bold()
                    }   
                    .padding(3)
                }
            }
            .navigationTitle("Recipes")
            .onAppear {
                viewModel.fetch()
                print("Number of desserts: \(viewModel.desserts.count)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
