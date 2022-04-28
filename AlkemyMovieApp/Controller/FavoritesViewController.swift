//
//  FavoritesViewController.swift
//  AlkemyMovieApp
//
//  Created by Cristian Costa on 16/03/2022.
//

import UIKit
import Firebase

class FavoritesViewController: UIViewController {
    //IBOulet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var logOutButton: UIButton!
    
    //Variables
    var idsFavs: [Int] = []
    let db = Firestore.firestore()
    var movieFavs: [MovieModel] = []
    var movieFavManager = MovieFavManager()
    
    //Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        movieFavs = []
        loadFavs()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tabBar.delegate = self
        movieFavManager.delegate = self
        tableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
    }
    
    //IBAction
    @IBAction func logOutButton(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            let loginViewController = LoginViewController()
            loginViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            self.present(loginViewController, animated: true, completion: nil)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    //Private
    private func loadFavs() {
        idsFavs = []
        db.collection("moviesFavs").getDocuments { (querySnapshot, error) in
            if let e = error {
                print(e.localizedDescription)
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if data["email"] as? String == Auth.auth().currentUser?.email {
                            self.idsFavs.append((data["id"] as? Int)!)
                            print("IMPRIMIR IDS \(self.idsFavs)")
                            if self.idsFavs.count == 0 {
                                self.movieFavs = []
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
                for movie in self.idsFavs {
                    self.movieFavManager.getRequestWithAlamofire("\(movie)?")
                }
            }
        }
    }
}

//MARK: - MovieFavManagerDelegate
extension FavoritesViewController: MovieFavManagerDelegate {
    func didUpdateMovie(_ movieFavManager: MovieFavManager, movie: MovieModel) {
        DispatchQueue.main.async {
            self.movieFavs.append(movie)
            self.tableView.reloadData()
        }
    }
    
    func didFailWithErrorFav(error: Error) {
        print(error)
    }
}

//MARK: - TableViewDataSource, TableViewDelegate
extension FavoritesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieFavs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! MovieCell
        cell.titleLabel.text = movieFavs[indexPath.row].title
        if let safeURL = URL(string: "https://image.tmdb.org/t/p/w500\(movieFavs[indexPath.row].poster!)") {
            cell.posterMovie.loadImage(from: safeURL)
        }
        cell.overview.text = movieFavs[indexPath.row].release
        let decimalNM = ((movieFavs[indexPath.row].vote!)*10).rounded()
        cell.rate.text = "\(String(format: "%.0f", decimalNM))%"
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.black
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MovieViewController()
        vc.movie = movieFavs[indexPath.row]
        vc.idsFavs = idsFavs
        vc.send = "Fav"
        vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        let transition: CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window!.layer.add(transition, forKey: nil)
        present(vc, animated: false, completion: nil)
    }
}

//MARK: - TabBarDelegate
extension FavoritesViewController: UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.title == "Movies" {
            let mainViewController = MainViewController()
            mainViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            self.present(mainViewController, animated: false, completion: nil)
        }
    }
}
