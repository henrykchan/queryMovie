//
//  Movie.swift
//  queryMovieProject
//
//  Created by Henry Chan on 1/23/17.
//  Copyright © 2017 Henry Chan. All rights reserved.
//

import UIKit

struct Movie {
    
    var title: String?
    var year: String?
    var released: String?
    var genre: String?
    var director: String?
    var actors: String?
    var plot: String?
    var poster: String?
    var imdbRating: String?
    
    init(title: String?, year: String?, released: String?, genre: String?, director: String?, actors: String?, plot: String?, poster: String?, imdbRating: String?) {
        
        self.title = title
        self.year = year
        self.released = released
        self.genre = genre
        self.director = director
        self.actors = actors
        self.plot = plot
        self.poster = poster
        self.imdbRating = imdbRating
    }
}
