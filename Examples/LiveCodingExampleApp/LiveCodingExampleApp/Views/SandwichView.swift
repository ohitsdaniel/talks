import SwiftUI

struct SandwichView: View {
    let sandwich: Sandwich

    var body: some View {
        VStack {
            id
            ScrollView(.horizontal) {
                LazyHStack(alignment: .center) {
                    bread
                    ingredients
                    spread
                    bread
                }
            }

        }
    }

    private var id: some View {
        HStack {
            Text("Yummy sandwich #" + sandwich.id.rawValue)
                .font(.caption2)
            Spacer()
        }
        .foregroundColor(.black)
    }

    private var bread: some View {
        ChipView(
            content: .bread(sandwich.bread)
        )
    }

    private var ingredients: some View {
        ForEach(sandwich.ingredients, id: \.self) { ingredient in
            ChipView(content: .ingredient(ingredient))
        }
    }

    private var spread: some View {
        ChipView(content: .spread(sandwich.spread))
    }
}

struct SandwichView_Previews: PreviewProvider {
    static var previews: some View {
        SandwichView(
            sandwich: .danielsFavorite
        )
        .previewLayout(.sizeThatFits)
    }
}
