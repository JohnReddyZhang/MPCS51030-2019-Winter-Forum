//
//  GalleryCollectionViewController.swift
//  CleanCodeDemo
//
//  Created by Susan Stevens on 3/3/19.
//  Copyright © 2019 Susan Stevens. All rights reserved.
//

import UIKit

class GalleryCollectionViewController: UICollectionViewController {

    @IBOutlet weak var getStartedLabel: UILabel!
    
    private var drawings: [Drawing] = []

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getStartedLabel.isHidden = drawings.count != 0
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let drawingViewController = segue.destination as? DrawingViewController else { return }
        guard let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
        drawingViewController.drawing = drawings[indexPath.row]
    }
    
    @IBAction func unwindToGallery(_ segue: UIStoryboardSegue) {
        guard let canvasViewController = segue.source as? CanvasViewController else { return }
        guard let image = canvasViewController.canvasView.image else { return }
        drawings.append(Drawing(image: image, creationDate: Date()))
        collectionView.reloadData()
    }
}

// MARK: UICollectionViewDataSource
extension GalleryCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return drawings.count
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCell",
                                                      for: indexPath) as! GalleryCollectionViewCell
        
        cell.imageView.image = drawings[indexPath.row].image
        return cell
    }
}
