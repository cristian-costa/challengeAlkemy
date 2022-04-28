//
//  MovieViewController.swift
//  AlkemyMovieApp
//
//  Created by Cristian Costa on 24/03/2022.
//

import UIKit
import Firebase

class MovieViewController: UIViewController {
    //IBOulet
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imgBackdrop: CustomImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var releaseLbl: UILabel!
    @IBOutlet weak var navigationTitle: UINavigationItem!
    @IBOutlet weak var genreLbl: UILabel!
    @IBOutlet weak var starButton: UIBarButtonItem!
    
    //Variables
    var movie: MovieModel?
    var idsFavs: [Int] = []
    let db = Firestore.firestore()
    var send: String = ""
    
    //Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    //IBAction
    @IBAction func backButtonPressed(_ sender: Any) {
        if send == "Fav" {
            let vc = FavoritesViewController()
            vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            let transition: CATransition = CATransition()
            transition.duration = 0.4
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromLeft
            self.view.window!.layer.add(transition, forKey: nil)
            present(vc, animated: false, completion: nil)
            
        } else {
            let transition: CATransition = CATransition()
            transition.duration = 0.4
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromLeft
            self.view.window!.layer.add(transition, forKey: nil)
            dismiss(animated: false, completion: nil)
        }
        
    }
    
    @IBAction func starButtonPressed(_ sender: Any) {
        var existMovie = false
        
        for fav in idsFavs {
            if fav == Int((movie?.id)!) {
                existMovie = true
            }
        }
        
        if existMovie {
            starButton.image = UIImage(systemName: "star")
            db.collection("moviesFavs").document(String(Int((movie?.id)!))).delete() { error in
                if let e = error {
                    print(e)
                } else {
                    if let index = self.idsFavs.firstIndex(of: Int((self.movie?.id)!)) {
                        self.idsFavs.remove(at: index)
                    }
                    print("Delete")
                }
            }
        } else {
            starButton.image = UIImage(systemName: "star.fill")
            if let id = movie?.id, let user = Auth.auth().currentUser?.email {
                db.collection("moviesFavs").document(String(Int((movie?.id)!))).setData(["id": id, "email": user]) { error in
                    if let e = error {
                        print(e)
                    } else {
                        print("fav")
                        self.idsFavs.append((Int((self.movie?.id)!)))
                    }
                }
            }
        }
    }
    
    //Private
    private func configure() {
        for fav in idsFavs {
            if fav == Int((movie?.id)!) {
                starButton.image = UIImage(systemName: "star.fill")
            }
        }
        
        if let safeMovie = movie {
            if let movieBackdrop = safeMovie.backdrop {
                if let safeURL = URL(string: "https://image.tmdb.org/t/p/w500\(movieBackdrop)") {
                    self.imgBackdrop.loadImage(from: safeURL)
                }
            }
            
            navigationTitle.title = safeMovie.title!
            
            descriptionLbl.text = safeMovie.overview
            titleLbl.text = safeMovie.title
            var genreString = "Genero: "
            
            if let genreInt = safeMovie.genre {
                for i in 0...genreInt.count - 1 {
                    if(i == genreInt.count-1) {
                        genreString += "\(dictionaryGenres[genreInt[i]]!)"
                    } else {
                        genreString += "\(dictionaryGenres[genreInt[i]]!), "
                    }
                }
            }
            
            genreLbl.text = genreString
            releaseLbl.text = "Estreno: \(safeMovie.release!)"
            
            if let language = Iso639_1.init(rawValue: (safeMovie.language)!)?.language {
                languageLabel.text = "Idioma original: \(language)"
            }
        }
    }
}
