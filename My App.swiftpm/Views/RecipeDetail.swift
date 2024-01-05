import SwiftUI

struct RecipeDetail: View {
    var body: some View {
        NavigationView{
            Text("Recipe Detail")
                .navigationTitle("Recipe Detail")
        }
        .navigationViewStyle(.stack)
    }
}

struct RecipeDetail_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetail()
    }
}
