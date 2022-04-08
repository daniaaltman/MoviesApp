//
//  ViewController.swift
//  collectionView
//
//  Created by Dania Altman on 07/04/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    let itemsPerRow:CGFloat = 2
    lazy var movieApi: MovieApi = MovieApi()
    var moviesArray: [MovieData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure () {
        Task() {
            await fetchAndPlaceData()
            collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = CGSize(width: 120, height: 120)
            
            
            collectionView.collectionViewLayout = layout
            collectionView.delegate = self
            collectionView.dataSource = self
        }
        
    }
    
    func fetchAndPlaceData() async {
        do {
            moviesArray = (try await movieApi.getMovies(.popularity)).map { MovieData($0) }
            
            for movie in moviesArray {
                movie.image = try await movieApi.getMovieImage(movie.posterLink)
            }
        } catch {
            print("error occurred", error)
        }
    }
    

  

}


extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("you yapped me")
    }
}

extension ViewController: UICollectionViewDataSource {

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
         
        cell.configure(with: moviesArray[indexPath.item])
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow

        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    // 3
    func collectionView(
      _ collectionView: UICollectionView,
      layout collectionViewLayout: UICollectionViewLayout,
      insetForSectionAt section: Int
    ) -> UIEdgeInsets {
      return sectionInsets
    }

    // 4
    func collectionView(
      _ collectionView: UICollectionView,
      layout collectionViewLayout: UICollectionViewLayout,
      minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
      return sectionInsets.left
    }

}

