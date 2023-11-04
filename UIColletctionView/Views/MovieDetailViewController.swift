//
//  MovieDetailViewController.swift
//  UIColletctionView
//
//  Created by Saba Gogrichiani on 04.11.23.
//

import UIKit

class MovieDetailViewController: UIViewController {
    var movie: MovieDetails?
    
    private let mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical 
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let ratingView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = UIColor(red: 31/255, green: 41/255, blue: 61/255, alpha: 1)
        stackView.layoutMargins = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    
    let sourceLabel: UILabel = {
        let label = UILabel()
        label.text = "IMDb"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(red: 99/255, green: 115/255, blue: 148/255, alpha: 1)
        return label
    }()
    
    let movieInfoView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 16
        view.backgroundColor = UIColor(_colorLiteralRed: 26/255, green: 34/255, blue: 50/255, alpha: 1)
        view.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 12, right: 16)
        view.isLayoutMarginsRelativeArrangement = true
        
        return view
    }()
    
    let movieDescriptionLabel: UILabel = {
        let description = UILabel()
        description.font = UIFont.systemFont(ofSize: 14)
        description.textColor = .white
        description.numberOfLines = 0
        
        return description
    }()
    
    let footerView: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = UIColor(red: 31/255, green: 41/255, blue: 61/255, alpha: 0.7)
        view.heightAnchor.constraint(equalToConstant: 88).isActive = true
        view.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        view.isLayoutMarginsRelativeArrangement = true
        
        return view
    }()
    
    let selectSesionButton: UIButton = {
        let button = UIButton()
        button.setTitle("Select session", for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = UIColor(red: 255/255, green: 128/255, blue: 54/255, alpha: 1)
        button.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        
        return button
    }()
    
    
    init(movie: MovieDetails) {
        super.init(nibName: nil, bundle: nil)
        self.movie = movie
        ratingLabel.text = "\(movie.rating)"
        movieDescriptionLabel.text = "\(movie.description)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        setUpMovieDetails()
        
    }
    
    
    private func setupView() {
        self.navigationItem.title = movie?.title
        view.backgroundColor = UIColor(red: 26/255, green: 34/255, blue: 50/255, alpha: 1)
        
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(myImageView)
        mainStackView.addArrangedSubview(ratingView)
        mainStackView.addArrangedSubview(movieInfoView)
        mainStackView.addArrangedSubview(footerView)
        footerView.addArrangedSubview(selectSesionButton)
        
        movieInfoView.addArrangedSubview(movieDescriptionLabel)
        
        ratingView.addArrangedSubview(ratingLabel)
        ratingView.addArrangedSubview(sourceLabel)
        
        myImageView.image = UIImage(named: "CoverPic")
    }
    
    func setUpMovieDetails() {
        if let movieDetails = movie {
            let properties = ["Certificate", "Runtime", "Release", "Genre", "Director", "Cast"]
            let values = [movieDetails.certificate, movieDetails.runtime, movieDetails.releaseYear, movieDetails.genre, movieDetails.director, movieDetails.cast]
            
            for (property, value) in zip(properties, values) {
                let horizontalStack = UIStackView()
                horizontalStack.axis = .horizontal
                horizontalStack.spacing = 16
                
                
                let propertyLabel = UILabel()
                propertyLabel.text = property
                propertyLabel.textColor = UIColor(red: 99/255, green: 115/255, blue: 148/255, alpha: 1)
                propertyLabel.widthAnchor.constraint(equalToConstant: 74).isActive = true
                propertyLabel.font = UIFont.systemFont(ofSize: 14)
                
                
                let valueLabel = UILabel()
                valueLabel.text = value
                valueLabel.textColor = .white
                valueLabel.font = UIFont.systemFont(ofSize: 14)
                valueLabel.numberOfLines = 0
                
                horizontalStack.addArrangedSubview(propertyLabel)
                horizontalStack.addArrangedSubview(valueLabel)
                
                movieInfoView.addArrangedSubview(horizontalStack)
            }
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Constraints for the mainStackView
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            myImageView.heightAnchor.constraint(equalToConstant: 220),
            ratingView.heightAnchor.constraint(equalToConstant: 70),
            
            
        ])
    }
}
