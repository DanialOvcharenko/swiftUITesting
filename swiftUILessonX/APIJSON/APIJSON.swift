//
//  APIJSON.swift
//  swiftUILessonX
//
//  Created by Mac on 14.02.2022.
//

import SwiftUI

struct APIJSON: View {
    
    @State var posts: [Post] = []
    
    var body: some View {
        NavigationView{
            List(posts) { post in
                HStack{
                    VStack {
                        Text(post.title)
                            .fontWeight(.bold)
                        Divider()
                        Text(post.body)
                    }
                    Spacer()
                    Divider()
                    
                    HStack {
                        Text("\(post.userId)")
                    }
                }
            }
            .onAppear() {
                Api().getPost { (posts) in
                    self.posts = posts
                }
            }
            .navigationBarTitle("Posts")
        }
    }
}

struct Post: Codable, Identifiable {
    let id = UUID()
    var title: String
    var body: String
    var userId: Int
}

class Api {
    func getPost(completion: @escaping ([Post]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            let posts = try! JSONDecoder().decode([Post].self, from: data!)
            DispatchQueue.main.async {
                completion(posts)
            }
        }
        .resume()
    }
}


struct APIJSON_Previews: PreviewProvider {
    static var previews: some View {
        APIJSON()
    }
}
