//
//  ViewControllerSignUp.swift
//  Konspekt
//
//  Created by user on 05.02.2025.
//

import UIKit

class ViewControllerSignUp: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView!
    var items = ["UITextField"]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        sutupCollectionView()
    }
    
    
    //MARK: Create collektionView
    func sutupCollectionView() {
        //MARK: create loyaut
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        //MARK: Create CollectionView
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                ])
            }
            
            // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return items.count // Возвращаем количество элементов в массиве
        }
            
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        let title = items[indexPath.item] // Берём название из массива
        cell.configureCell(title: title) // Передаём в ячейку
        return cell
    }
            
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width = (view.frame.width - 30) / 2
             return CGSize(width: width, height: width)
            }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem = items[indexPath.item]
        openImageViewController(with: selectedItem)
    }
    
    func openImageViewController(with imageName: String) {
        let imageVC = ImageViewController()
        imageVC.imageName = imageName
        navigationController?.pushViewController(imageVC, animated: true)
    }
}


