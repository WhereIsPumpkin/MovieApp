import UIKit

struct MovieDetails {
    let image: UIImage?
    var isLiked: Bool
    let rating: Double
    let title: String
    let genre: String
    let certificate: String
    let runtime: String
    let releaseYear: String
    let director: String
    let cast: String
    let description: String
    
    static let movies = [
        MovieDetails(
            image: UIImage(named: "Batman"),
            isLiked: false,
            rating: 8.1,
            title: "The Batman",
            genre: "Action",
            certificate: "15+",
            runtime: "02:56",
            releaseYear: "2023",
            director: "Matt Reeves",
            cast: "Robert Pattinson, Zoë Kravitz, Colin Farrell",
            description: "When the Riddler, a sadistic serial killer, begins murdering key political figures in Gotham, Batman is forced to investigate the city's hidden corruption and question his family's involvement."
        ),
        MovieDetails(
            image: UIImage(named: "Exorcism"),
            isLiked: false,
            rating: 5.6,
            title: "The Exorcism of God",
            genre: "Horror",
            certificate: "16+",
            runtime: "02:15",
            releaseYear: "2023",
            director: "Alejandro Hidalgo",
            cast: "Joseph Marcell, Maria Gabriela de Faria, Will Beinbrink",
            description: "A young priest is sent to a remote village in Venezuela to investigate a series of supernatural events, leading him to confront the devil himself."
        ),
        MovieDetails(
            image: UIImage(named: "Morbius"),
            isLiked: false,
            rating: 5.3,
            title: "Morbius",
            genre: "Action",
            certificate: "15+",
            runtime: "02:10",
            releaseYear: "2023",
            director: "Daniel Espinosa",
            cast: "Jared Leto, Matt Smith, Adria Arjona",
            description: "Dr. Michael Morbius, a brilliant biochemist, tries to cure his rare blood disease but inadvertently turns himself into a living vampire with superhuman abilities."
        ),
        MovieDetails(
            image: UIImage(named: "Spider-Man"),
            isLiked: false,
            rating: 8.1,
            title: "Spider-Man",
            genre: "Action",
            certificate: "15+",
            runtime: "02:28",
            releaseYear: "2023",
            director: "Jon Watts",
            cast: "Tom Holland, Zendaya, Benedict Cumberbatch",
            description: "Peter Parker faces new challenges as he teams up with Doctor Strange to deal with multiverse threats while his secret identity is at risk."
        ),
        MovieDetails(
            image: UIImage(named: "Turning Red"),
            isLiked: false,
            rating: 7.1,
            title: "Turning Red",
            genre: "Comedy",
            certificate: "15+",
            runtime: "01:42",
            releaseYear: "2022",
            director: "Domee Shi",
            cast: "Rosalie Chiang, Sandra Oh, Ava Morse",
            description: "A 13-year-old girl in Toronto turns into a giant red panda whenever she gets excited, leading to humorous and heartfelt adventures."
        ),
        MovieDetails(
            image: UIImage(named: "Uncharted"),
            isLiked: false,
            rating: 7.9,
            title: "Uncharted",
            genre: "Adventure",
            certificate: "15+",
            runtime: "01:56",
            releaseYear: "2023",
            director: "Ruben Fleischer",
            cast: "Tom Holland, Mark Wahlberg, Antonio Banderas",
            description: "Nathan Drake, a treasure hunter, embarks on a daring quest to uncover the lost treasure of Ferdinand Magellan and faces dangerous obstacles."
        )
    ]
}
