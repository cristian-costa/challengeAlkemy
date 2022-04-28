//
//  MovieFavManager.swift
//  AlkemyMovieApp
//
//  Created by Cristian Costa on 27/03/2022.
//

import Foundation
import Alamofire

protocol MovieFavManagerDelegate {
    func didUpdateMovie(_ movieFavManager: MovieFavManager, movie: MovieModel)
    func didFailWithErrorFav(error: Error)
}

struct MovieFavManager {
    var delegate: MovieFavManagerDelegate?
    var webPage = "https://api.themoviedb.org/3/movie/"
    let apiKey = "197e17574936f206f7c082be97d0443b"
    let language = "es"
    
    func getRequestWithAlamofire(_ url: String){
        print("URL", url)
        Alamofire.request("\(webPage)\(url)api_key=\(apiKey)&language=\(language)").responseData { response in
            if let data = response.result.value {
                if let movie = self.parseJSON(data) {
                    self.delegate?.didUpdateMovie(self, movie: movie)
                }
            }
        }
    }
    
    func parseJSON(_ movieData: Data) -> MovieModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(MovieFavs.self, from: movieData)
            
            var currentTitle = ""
            if let titleSafe = decodedData.title {
                currentTitle = titleSafe
            }
            
            var currentPoster = ""
            if let posterSafe = decodedData.poster_path {
                currentPoster = posterSafe
            }
            
            var currentBackdrop = ""
            if let safeBackdrop = decodedData.backdrop_path {
                currentBackdrop = safeBackdrop
            }
            
            var currentId: Double = 0.0
            if let safeId = decodedData.id {
                currentId = safeId
            }
            
            var currentOverview = ""
            if let safeOverview = decodedData.overview {
                currentOverview = safeOverview
            }
            
            var currentVote: Double = 0.0
            if let safeVote = decodedData.vote_average {
                currentVote = safeVote
            }
            
            var currentRelease = ""
            if let safeRelease = decodedData.release_date {
                currentRelease = safeRelease
            }

            var currentLanguage = ""
            if let safeLanguage = decodedData.original_language {
                currentLanguage = safeLanguage
            }
            
            var genreArray: [Int] = []
            if let safeGenreArray = decodedData.genres {
                for i in 0...safeGenreArray.count-1 {
                    genreArray.append(safeGenreArray[i].id)
                }
            }
            
            let movie = MovieModel(id: currentId, title: currentTitle, backdrop: currentBackdrop, poster: currentPoster, overview: currentOverview, vote: currentVote, release: currentRelease, language: currentLanguage, genre: genreArray)
            return movie
        } catch {
            delegate?.didFailWithErrorFav(error: error)
            return nil
        }
    }
}
