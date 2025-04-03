import SwiftUI

struct TextShadowView: View {
  @State var index = 0
  let colors: [Color] = [.green, .pink, .blue, .orange, .purple]
  let texts: [String] = ["NEON", "GLOW", "LIGHT", "SHINE", "BRIGHT"]

  var body: some View {
    Text(texts[index])
      .font(.system(size: 70, weight: .thin, design: .rounded))
      .foregroundStyle(.white)
      .contentTransition(.numericText())
      .shadow(color: colors[index], radius: 5)
      .shadow(color: colors[index], radius: 5)
      .shadow(color: colors[index], radius: 50)
      .shadow(color: colors[index], radius: 100)
      .shadow(color: colors[index], radius: 200)
      .padding(.all, 100)
      .task {
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { _ in
          withAnimation {
            index = (index + 1) % texts.count
          }
        }
      }
  }
}

#Preview {
  TextShadowView()
}
