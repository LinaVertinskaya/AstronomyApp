//
//  PhotoInfo.swift
//  AstronomyPicture
//
//  Created by Лина Вертинская on 24.12.22.
//

import Foundation

struct PhotoInfo: Codable {
    var title: String
    var description: String
    var url: URL?
    var copyright: String?
    var date: String

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case description = "explanation"
        case url = "url"
        case copyright = "copyright"
        case date = "date"
    }

    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)

        self.title = try valueContainer.decode(String.self, forKey: CodingKeys.title)
        self.description = try valueContainer.decode(String.self, forKey: CodingKeys.description)
        self.url = try valueContainer.decode(URL.self, forKey: CodingKeys.url)
        self.copyright = try? valueContainer.decode(String.self, forKey: CodingKeys.copyright)
        self.date = try valueContainer.decode(String.self, forKey: CodingKeys.date)
    }

    init() {
        self.description = ""
        self.title = ""
        self.date = ""
    }

    static func createDefault() -> PhotoInfo {
        var photoInfo = PhotoInfo()
        photoInfo.title = "Geminids and the Mittens"
        photoInfo.description = "Asteroid 3200 Phaethon's annual gift to planet Earth always arrives in December. Otherwise known as the Geminid meteor shower, the source of the meteroid stream is dust shed along the orbit of the mysterious asteroid. Near the December 13/14 peak of the shower's activity, geminid meteors are captured in this night skyscape, composited from 22 images of starry sky taken before the moon rose over Monument Valley in the American southwest. The bright stars near the position of the shower's radiant are the constellation Gemini's twin stars Castor (blue) and Pollux (yellow). As Earth sweeps through the dusty stream, the parallel meteor trails appear to radiate from a point on the sky in Gemini due to perspective, and so the yearly shower is named for the constellation. From the camera's perspective, this view of three prominent buttes across Monument Valley also suggests appropriate names for two of them. The third one is called Merrick Butte."
        photoInfo.date = "2022-12-25"
        return photoInfo
    }
}
