import ComposableArchitecture
import SwiftUI

struct SandwichDetailView: View {
    let store: Store<SandwichDetailState, SandwichDetailAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            ScrollView(.vertical) {
                LazyVStack(spacing: 8) {
                    id(viewStore)
                    bread(viewStore)
                    ingredients(viewStore)
                    spread(viewStore)
                    
                    title(with: "Yummy!")
                        .foregroundColor(.red)
                }
            }
        }
    }

    private func title(with content: String) -> some View {
        Text(content)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
    }

    private func id(
        _ viewStore: ViewStore<SandwichDetailState, SandwichDetailAction>
    ) -> some View {
        HStack {
            title(with: "ID: ")
            Text(viewStore.sandwich.id.rawValue)
                .font(.title)
            Spacer()
        }
    }


    private func bread(
        _ viewStore: ViewStore<SandwichDetailState, SandwichDetailAction>
    ) -> some View {
        HStack {
            title(with: "Bread: ")
            ChipView(content: .bread(viewStore.sandwich.bread))
            Spacer()
        }
    }

    private func ingredients(
        _ viewStore: ViewStore<SandwichDetailState, SandwichDetailAction>
    ) -> some View {
        HStack {
            title(with: "Ingredients: ")
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(viewStore.sandwich.ingredients, id: \.self) { ingredient in
                        ChipView(content: .ingredient(ingredient))
                    }
                }
            }
            Spacer()
        }
    }

    private func spread(
        _ viewStore: ViewStore<SandwichDetailState, SandwichDetailAction>
    ) -> some View {
        HStack {
            title(with: "Spread: ")
            ChipView(content: .spread(viewStore.sandwich.spread))
            Spacer()
        }
    }
}

struct SandwichDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SandwichDetailView(
            store: Store(
                initialState: SandwichDetailState(
                    sandwich: .danielsFavorite
                ),
                reducer: .empty,
                environment: ()
            )
        )
    }
}
