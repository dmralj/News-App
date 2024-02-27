import SwiftUI

struct OnboardingView: View {
    @State private var isOnboardingComplete = false
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Welcome to Space News")
                .font(.title)
                .fontWeight(.bold)
            
            Text("Stay updated with the latest space news and discoveries!")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .padding()
            
            Image("Image")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal)
            
            Spacer()
            
            Text("Swipe left to continue")
                .font(.caption)
                .padding(.bottom)
        }
        .padding()
        .gesture(
            DragGesture()
                .onEnded({ value in
                    if value.translation.width < -100 {
                        self.isOnboardingComplete = true
                    }
                })
        )
        .fullScreenCover(isPresented: $isOnboardingComplete, content: {
            ContentView()
        })
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
