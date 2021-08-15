import Core
import SwiftUI

struct ContentView: View {
  var body: some View {
    Button(
      action: { HelloWorldPrinter().sayHello() },
      label: { Text("Hello, world!") }
    )
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
