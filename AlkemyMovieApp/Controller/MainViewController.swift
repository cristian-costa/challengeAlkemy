//
//  MainViewController.swift
//  AlkemyMovieApp
//
//  Created by Cristian Costa on 16/03/2022.
//

import UIKit
import Firebase

class MainViewController: UIViewController {
    //IBOUlet
    @IBOutlet weak var logOutButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var moviesButton: UITabBarItem!
    @IBOutlet weak var tabBar: UITabBar!
    @IBOutlet weak var favoritesButton: UITabBarItem!
    
    //Variables
    var movieManager = MovieManager()
    var movieMainArray = [MovieModel]()
    let db = Firestore.firestore()
    var idsFavs: [Int] = []
    
    //Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        idsFavs = []
        loadFavs()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tabBar.delegate = self
        movieManager.delegate = self
        tableView.register(UINib(nibName: "MovieCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        movieManager.getRequestWithAlamofire("popular?page=1&")
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
        db.collection("moviesFavs").getDocuments { (querySnapshot, error) in
            if let e = error {
                print(e.localizedDescription)
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if data["email"] as? String == Auth.auth().currentUser?.email {
                            self.idsFavs.append((data["id"] as? Int)!)
                        }
                    }
                }
            }
        }
    }
}

//MARK: -  MovieManagerDelegate
extension MainViewController: MovieManagerDelegate {
    func didUpdateMovie(_ movieManager: MovieManager, movie: [MovieModel]) {
        DispatchQueue.main.async {
            self.movieMainArray = movie
            self.tableView.reloadData()
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

//MARK: - TableViewDelegate & TableViewDataSource
extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieMainArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! MovieCell
        cell.titleLabel.text = movieMainArray[indexPath.row].title
        if let safeURL = URL(string: "https://image.tmdb.org/t/p/w500\(movieMainArray[indexPath.row].poster!)") {
            cell.posterMovie.loadImage(from: safeURL)
        }
        cell.overview.text = movieMainArray[indexPath.row].release
        let decimalNM = ((movieMainArray[indexPath.row].vote!)*10).rounded()
        cell.rate.text = "\(String(format: "%.0f", decimalNM))%"
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.black
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selecting row")
        let vc = MovieViewController()
        vc.movie = movieMainArray[indexPath.row]
        vc.idsFavs = idsFavs
        vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        let transition: CATransition = CATransition()
        transition.duration = 0.4
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window!.layer.add(transition, forKey: nil)
        present(vc, animated: false, completion: nil)
    }
}

//MARK: - TabBarDelegate
extension MainViewController: UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.title == "Favorites" {
            let favoritesViewController = FavoritesViewController()
            favoritesViewController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            self.present(favoritesViewController, animated: false, completion: nil)
        }
    }
}
