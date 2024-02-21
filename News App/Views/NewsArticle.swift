import SwiftUI
import CachedAsyncImage

struct NewsArticle: View {
    let title: String
    let imageUrl: String
    let siteName: String
    let summary: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(siteName)
                .foregroundColor(.blue)
                .italic()
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                CachedAsyncImage(url: URL(string: imageUrl),
                                 transaction: Transaction(animation: .easeInOut)) {phase in
                    if let image = phase.image {
                        image.resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .transition(.opacity)
                    } else {
                        HStack {
                            // Placeholder
                        }
                    }
                }
            }
            
            Text(title)
                .font(.headline)
                .padding(8)
            
            Text(summary)
                .lineLimit(10)
                .font(.body)
                .padding(8)

        }
    }
}

#Preview {
    NewsArticle(title: "Tech Academy", imageUrl: "https://logowik.com/content/uploads/images/nbk-national-bank-of-kuwait937.logowik.com.webp", siteName: "Tech Academy", summary: "This project was made during the Tech Academy at NBK.")
}
