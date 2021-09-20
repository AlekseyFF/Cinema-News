//
//  MovieCard.swift
//  Cinema News
//
//  Created by Aleksey Fedorov on 17.09.2021.
//

import SwiftUI

struct MovieCard: View {
    
    let movie: Movie
        @ObservedObject var imageLoader = ImageLoader()
        
        var body: some View {
            ZStack {
                if self.imageLoader.image != nil {
                    Image(uiImage: self.imageLoader.image!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(8)
                        .shadow(radius: 4)
                    
                } else {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .cornerRadius(8)
                        .shadow(radius: 4)
                    
                    Text(movie.title)
                        .multilineTextAlignment(.center)
                }
            }
            .frame(width: 204, height: 306)
            .onAppear {
                self.imageLoader.loadImage(with: self.movie.posterURL)
            }
        }
    }

struct MovieCard_Previews: PreviewProvider {
    static var previews: some View {
        MovieCard(movie: Movie.stubbedMovie)
    }
}
