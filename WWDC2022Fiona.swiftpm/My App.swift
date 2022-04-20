import SwiftUI

//home-----------------------------------------------------

struct Home: View{
    
    @State var currentIndex: Int = 0
    @State var posts: [Post] = []
    
    var body: some View {
        
        VStack(spacing: 15){
            
            VStack(alignment: .leading, spacing: 12){
                
                
                SnapCarousel(index: $currentIndex, items: posts)
                {post in
                    
                    GeometryReader{proxy in
                        
                        let size = proxy.size
            
                    
                    Image(post.postImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width)
                        .cornerRadius(12)
                    }
                }
            
                
                    .frame(maxHeight: .infinity,alignment: .top)
                    .onAppear {
                        for index in 1...8{
                            posts.append(Post(postImage: "post\(index)"))
                            
                        }
                    }
        }
    }
        
}
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


//Post----------------------------------------------------------------

struct Post: Identifiable{
    var id = UUID().uuidString
    var postImage: String
}




//Snapcarousel---------------------------------------------------------

struct SnapCarousel<Content: View,T: Identifiable>: View {
    var content: (T) -> Content
    var list: [T]
    
    var spacing: CGFloat
    var trailingSpace: CGFloat
    @Binding var index : Int
    
    init(spacing: CGFloat = 15, trailingSpace: CGFloat = 100, index: Binding<Int>, items: [T], @ViewBuilder content: @escaping(T)->Content){
        
        self.list = items
        self.spacing = spacing
        self.trailingSpace = trailingSpace
        self._index = index
        self.content = content
    }
    var body: some View{
        
        GeometryReader{proxy in
            
            ForEach(list){item in
                
                HStack(spacing: spacing){
                    ForEach(list){item in
                        content(item)
                    }
                }
            }
        }
    }
}

struct  SnapCarousel_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
