//
//  MovieManager.swift
//  AlkemyMovieApp
//
//  Created by Cristian Costa on 19/03/2022.
//

import Foundation
import Alamofire

protocol MovieManagerDelegate {
    func didUpdateMovie(_ movieManager: MovieManager, movie: [MovieModel])
    func didFailWithError(error: Error)
}

struct MovieManager {
    var delegate: MovieManagerDelegate?
    var webPage = "https://api.themoviedb.org/3/movie/"
    let apiKey = "197e17574936f206f7c082be97d0443b"
    let language = "es"
    
    func getRequestWithAlamofire(_ url: String){
        print("URL \(webPage)\(url)api_key=\(apiKey)&language=\(language)")
        Alamofire.request("\(webPage)\(url)api_key=\(apiKey)&language=\(language)").responseData { response in
            if let data = response.result.value {
                if let movie = self.parseJSON(data) {
                    self.delegate?.didUpdateMovie(self, movie: movie)
                }
            }
        }
    }
    
    func parseJSON(_ movieData: Data) -> [MovieModel]? {
        let decoder = JSONDecoder()
        
        do {
            var movieArray = [MovieModel]()
            let decodedData = try decoder.decode(MovieData.self, from: movieData)
            for i in 0...decodedData.results.count-1 {
                let decoded = decodedData.results
                var currentTitle = ""
                if let titleSafe = decoded[i].title {
                    currentTitle = titleSafe
                }
                
                var currentPoster = ""
                if let posterSafe = decoded[i].poster_path {
                    currentPoster = posterSafe
                }
                
                var currentBackdrop = ""
                if let safeBackdrop = decoded[i].backdrop_path {
                    currentBackdrop = safeBackdrop
                }
                
                var currentId: Double = 0.0
                if let safeId = decoded[i].id {
                    currentId = safeId
                }
                
                var currentOverview = ""
                if let safeOverview = decoded[i].overview {
                    currentOverview = safeOverview
                }
                
                var currentVote: Double = 0.0
                if let safeVote = decoded[i].vote_average {
                    currentVote = safeVote
                }
                
                var currentRelease = ""
                if let safeRelease = decoded[i].release_date {
                    currentRelease = safeRelease
                }

                var currentLanguage = ""
                if let safeLanguage = decoded[i].original_language {
                    currentLanguage = safeLanguage
                }
                
                var currentGenre: [Int] = []
                if let safeGenre = decoded[i].genre_ids {
                    currentGenre = safeGenre
                }

                let movie = MovieModel(id: currentId, title: currentTitle, backdrop: currentBackdrop, poster: currentPoster, overview: currentOverview, vote: currentVote, release: currentRelease, language: currentLanguage, genre: currentGenre)
                movieArray.append(movie)
            }
            return movieArray
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
