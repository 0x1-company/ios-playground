import SwiftUI

struct ContentView: View {
  var body: some View {
    List {
      NavigationLink("Text Shadow") {
        TextShadowView()
      }
    }
    .navigationTitle("ios-playground")
    .navigationBarTitleDisplayMode(.inline)
  }
}

#Preview {
  ContentView()
}
