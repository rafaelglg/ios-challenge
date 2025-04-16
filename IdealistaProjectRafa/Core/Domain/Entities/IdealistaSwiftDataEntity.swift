//
//  IdealistaEntity.swift
//  IdealistaProjectRafa
//
//  Created by Rafael Loggiodice on 13/4/25.
//
import Foundation
import SwiftData

@Model
final class IdealistaEntity {
    @Attribute(.unique) var id: String
    var isFavorite: Bool
    var dateLiked: Date
    var thumbnail: String
    var floor: String
    var price: Int
    var propertyType: String
    var operation: String
    var size: Int
    var exterior: Bool
    var rooms: Int
    var bathrooms: Int
    var address: String
    var province: String
    var municipality: String
    var district: String
    var country: String
    var neighborhood: String
    var latitude: Double
    var longitude: Double
    var descriptionAds: String
    
    init(from model: IdealistaModel) {
        self.id = model.propertyCode
        self.isFavorite = model.isLiked
        self.dateLiked = model.likedDate ?? Date()
        self.thumbnail = model.thumbnail
        self.floor = model.floor
        self.price = model.price
        self.propertyType = model.propertyType
        self.operation = model.operation
        self.size = model.size
        self.exterior = model.exterior
        self.rooms = model.rooms
        self.bathrooms = model.bathrooms
        self.address = model.address
        self.province = model.province
        self.municipality = model.municipality
        self.district = model.district
        self.country = model.country
        self.neighborhood = model.neighborhood
        self.latitude = model.latitude
        self.longitude = model.longitude
        self.descriptionAds = model.description
    }
    
    var toIdealistaModel: IdealistaModel {
        IdealistaModel(
            propertyCode: id,
            thumbnail: thumbnail,
            floor: floor,
            price: price,
            priceInfo: PriceInfo(price: Price(amount: 0, currencySuffix: "")),
            propertyType: propertyType,
            operation: operation,
            size: size,
            exterior: exterior,
            rooms: rooms,
            bathrooms: bathrooms,
            address: address,
            province: province,
            municipality: municipality,
            district: district,
            country: country,
            neighborhood: neighborhood,
            latitude: latitude,
            longitude: longitude,
            description: self.descriptionAds,
            multimedia: Multimedia(images: [ImageDetail(url: "", tag: "")]),
            features: Features(hasSwimmingPool: nil, hasTerrace: nil, hasAirConditioning: false, hasBoxRoom: false, hasGarden: nil),
            isLiked: isFavorite,
            likedDate: dateLiked
        )
    }
}
