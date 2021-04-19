import ComposableArchitecture
import SwiftUI

struct SandwichOverviewView: View {
    let store: Store<SandwichOverviewState, SandwichOverviewAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            List(viewStore.sandwiches) { sandwich in
                Button(
                    action: {
                        viewStore.send(
                            .selectSandwich(with: sandwich.id)
                        )
                    },
                    label: {
                        SandwichView(sandwich: sandwich)
                            .contentShape(Rectangle())
                    }
                )
                .buttonStyle(BorderlessButtonStyle())
            }
        }
        .navigationBarTitle(Text("Yummy sandwiches!"))
    }
}

struct SandwichOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SandwichOverviewView(
                store: Store<SandwichOverviewState, SandwichOverviewAction>(
                    initialState: SandwichOverviewState(
                        sandwiches: [
                            .danielsFavorite,
                            .danielsFavorite,
                            .danielsFavorite
                        ]
                    ),
                    reducer: .empty,
                    environment: ()
                )
            )
        }
    }
}
