//
//  ViewController.swift
//  UIColletctionView
//
//  Created by Saba Gogrichiani on 03.11.23.
//

import UIKit

final class ViewController: UIViewController {
    
    private lazy var logo: UIBarButtonItem = {
        let logo = UIImage(named: "Product Logo") ?? UIImage()
        let logoImageView = UIImageView(image: logo)
        let logoBarButton = UIBarButtonItem(customView: logoImageView)
        return logoBarButton
    }()
    
    private lazy var profileButton: UIBarButtonItem = {
        let profileButton = UIButton()
        profileButton.setTitle("Profile", for: .normal)
        profileButton.backgroundColor = UIColor(red: 255/255, green: 128/255, blue: 54/255, alpha: 1)
        profileButton.widthAnchor.constraint(equalToConstant: 77).isActive = true
        profileButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        profileButton.layer.cornerRadius = 8
        profileButton.clipsToBounds = true
        profileButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        let profileBarButton = UIBarButtonItem(customView: profileButton)
        return profileBarButton
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor(red: 26/255, green: 34/255, blue: 50/255, alpha: 1)
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setUpNavigationBar()
    }
    
    private func setupUI() {
        setUpCollectionView()
    }
    
    func setUpNavigationBar() {
        self.navigationItem.leftBarButtonItem = logo
        self.navigationItem.rightBarButtonItem = profileButton
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(red: 31/255, green: 41/255, blue: 61/255, alpha: 1)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func setUpCollectionView() {
        self.view.addSubview(collectionView)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 8, right: 16)
        }
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MovieDetails.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else {
            fatalError("Failed to deque CustomCollectionViewCell in ViewController")
        }
        
        let movie = MovieDetails.movies[indexPath.row]
        cell.movie = movie
        cell.configure(with: movie)
        
        cell.likeButtonTapped = { cell.configure(with: movie) }
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as! HeaderCollectionReusableView
            headerView.configure(with: "Now in cinemas")
            return headerView
        }
        return UICollectionReusableView()
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (view.frame.width - 47) / 2
        return CGSize(width: size, height: 278)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMovie = MovieDetails.movies[indexPath.item]
        
        let movieDetailViewController = MovieDetailViewController(movie: selectedMovie)
        
        navigationController?.pushViewController(movieDetailViewController, animated: true)
    }
}

