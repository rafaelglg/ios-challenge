//
//  Idealista.swift
//  IdealistaProjectRafa
//
//  Created by Rafael Loggiodice on 11/4/25.
//

import Foundation

struct IdealistaModel: Decodable, Sendable, Hashable {
    let propertyCode: String
    let thumbnail: String
    let floor: String
    let price: Int
    let priceInfo: PriceInfo
    let propertyType: String
    let operation: String
    let size: Int
    let exterior: Bool
    let rooms: Int
    let bathrooms: Int
    let address: String
    let province: String
    let municipality: String
    let district: String
    let country: String
    let neighborhood: String
    let latitude: Double
    let longitude: Double
    let description: String
    let multimedia: Multimedia
    var features: Features
    var isLiked: Bool = false
    var likedDate: Date?
    
    enum CodingKeys: String, CodingKey {
        case propertyCode, thumbnail, floor, price, priceInfo, propertyType, operation, size, exterior, rooms, bathrooms, address, province, municipality, district, country, neighborhood, latitude, longitude, description, multimedia, features
    }
    
    var thumbnailUrl: URL {
        guard let url = URL(string: thumbnail) else {
            return URL(filePath: "")
        }
        
        return url
    }
    
    static var mock: IdealistaModel {
        mocks[0]
    }
    
    static var empty: IdealistaModel {
        IdealistaModel(propertyCode: "", thumbnail: "", floor: "", price: 0, priceInfo: PriceInfo(price: Price(amount: 0, currencySuffix: "")), propertyType: "", operation: "", size: 0, exterior: false, rooms: 0, bathrooms: 0, address: "", province: "", municipality: "", district: "", country: "", neighborhood: "", latitude: 0.0, longitude: 0.0, description: "", multimedia: Multimedia(images: [ImageDetail(url: "", tag: "")]), features: Features(hasSwimmingPool: false,hasTerrace: false, hasAirConditioning: false, hasBoxRoom: false, hasGarden: false))
    }
    
    static var mocks: [IdealistaModel] {
        return [
            IdealistaModel(
                propertyCode: "1",
                thumbnail: "https://img4.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/58/60/32/1273036727.webp",
                floor: "2",
                price: 1195000,
                priceInfo: PriceInfo(
                    price: Price(
                        amount: 1195000,
                        currencySuffix: "€"
                    )
                ),
                propertyType: "flat",
                operation: "sale",
                size: 133,
                exterior: false,
                rooms: 3,
                bathrooms: 2,
                address: "calle de Lagasca",
                province: "Madrid",
                municipality: "Madrid",
                district: "Barrio de Salamanca",
                country: "es",
                neighborhood: "Castellana",
                latitude: 40.4362687,
                longitude: -3.6833686,
                description: "Venta.Piso EN EXCLUSIVA. Castellana. Se ofrece en venta vivienda de 133 m² en el exclusivo Barrio de Salamanca, zona Castellana, con 3 dormitorios (uno en suite), 2 baños, amplio salón comedor, cocina independiente con office y lavadero. Cuenta con un amplio patio privado y armarios empotrados en todas las habitaciones. Reformado para optimizar el espacio, ofrece gran potencial para personalizarlo. Ubicado en una de las zonas más exclusivas de Madrid, el Barrio de Salamanca, en la cotizada zona de Castellana, se encuentra este espacioso piso en venta de 133 m² que ofrece una oportunidad única para",
                multimedia: Multimedia(
                    images: [ImageDetail(
                        url: "https://img4.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/58/60/32/1273036727.webp",
                        tag: "livingRoom"
                    )]
                ),
                features: Features(
                    hasSwimmingPool: nil,
                    hasTerrace: nil,
                    hasAirConditioning: true,
                    hasBoxRoom: false,
                    hasGarden: nil
                )
            ),
            IdealistaModel(
                propertyCode: "3",
                thumbnail: "https://img3.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/bc/27/d6/1273015346.webp",
                floor: "3",
                price: 895000,
                priceInfo: PriceInfo(price: Price(amount: 895000, currencySuffix: "€")),
                propertyType: "flat",
                operation: "sale",
                size: 112,
                exterior: true,
                rooms: 2,
                bathrooms: 2,
                address: "calle de Luchana",
                province: "Madrid",
                municipality: "Madrid",
                district: "Chamberí",
                country: "es",
                neighborhood: "Trafalgar",
                latitude: 40.429119,
                longitude: -3.703276,
                description: "Elegante vivienda reformada de 112 m² en Chamberí, con 2 dormitorios, 2 baños y salón-comedor con cocina abierta. Muy luminosa gracias a su orientación sur. Ideal para parejas o inversión en una de las zonas más demandadas.",
                multimedia: Multimedia(images: [
                    ImageDetail(url: "https://img3.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/bc/27/d6/1273015346.webp", tag: "livingRoom")
                ]),
                features: Features(hasSwimmingPool: nil, hasTerrace: true, hasAirConditioning: true, hasBoxRoom: false, hasGarden: nil)
            ),
            IdealistaModel(
                propertyCode: "4",
                thumbnail: "https://img3.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/a3/5c/85/1272015202.webp",
                floor: "5",
                price: 1390000,
                priceInfo: PriceInfo(price: Price(amount: 1390000, currencySuffix: "€")),
                propertyType: "flat",
                operation: "sale",
                size: 147,
                exterior: true,
                rooms: 4,
                bathrooms: 3,
                address: "calle de Narváez",
                province: "Madrid",
                municipality: "Madrid",
                district: "Retiro",
                country: "es",
                neighborhood: "Ibiza",
                latitude: 40.421015,
                longitude: -3.676612,
                description: "Ático reformado con terraza privada en pleno Retiro. Dispone de 4 dormitorios, 3 baños, cocina equipada y amplio salón con vistas despejadas. Muy cerca del parque del Retiro. Perfecto para familias.",
                multimedia: Multimedia(images: [
                    ImageDetail(url: "https://img3.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/a3/5c/85/1272015202.webp", tag: "terrace")
                ]),
                features: Features(hasSwimmingPool: false, hasTerrace: true, hasAirConditioning: true, hasBoxRoom: true, hasGarden: nil)
            ),
            IdealistaModel(
                propertyCode: "5",
                thumbnail: "https://img3.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/b9/95/90/1270877685.webp",
                floor: "1",
                price: 1580000,
                priceInfo: PriceInfo(price: Price(amount: 1580000, currencySuffix: "€")),
                propertyType: "flat",
                operation: "sale",
                size: 160,
                exterior: true,
                rooms: 3,
                bathrooms: 2,
                address: "calle Serrano",
                province: "Madrid",
                municipality: "Madrid",
                district: "Chamartín",
                country: "es",
                neighborhood: "El Viso",
                latitude: 40.452301,
                longitude: -3.685101,
                description: "Exclusiva propiedad de diseño con jardín comunitario y portero. Dispone de 3 habitaciones, 2 baños, cocina americana y terraza. Ubicación premium junto al Paseo de la Castellana.",
                multimedia: Multimedia(images: [
                    ImageDetail(url: "https://img3.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/b9/95/90/1270877685.webp", tag: "exterior")
                ]),
                features: Features(hasSwimmingPool: true, hasTerrace: true, hasAirConditioning: true, hasBoxRoom: true, hasGarden: true)
            ),
            IdealistaModel(
                propertyCode: "6",
                thumbnail: "https://img3.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/af/2e/3f/1272115672.webp",
                floor: "4",
                price: 1050000,
                priceInfo: PriceInfo(price: Price(amount: 1050000, currencySuffix: "€")),
                propertyType: "flat",
                operation: "sale",
                size: 120,
                exterior: false,
                rooms: 2,
                bathrooms: 2,
                address: "calle Fernando VI",
                province: "Madrid",
                municipality: "Madrid",
                district: "Centro",
                country: "es",
                neighborhood: "Justicia",
                latitude: 40.424192,
                longitude: -3.697931,
                description: "Piso elegante en una de las calles más cotizadas de Justicia. Cuenta con 2 habitaciones, 2 baños, techos altos y acabados de lujo. Ideal para quienes buscan vivir en el centro histórico con todo el confort.",
                multimedia: Multimedia(images: [
                    ImageDetail(url: "https://img3.idealista.com/blur/WEB_LISTING-M/0/id.pro.es.image.master/af/2e/3f/1272115672.webp", tag: "livingRoom")
                ]),
                features: Features(hasSwimmingPool: nil, hasTerrace: false, hasAirConditioning: true, hasBoxRoom: false, hasGarden: false)
            )
        ]
    }
}

// MARK: - PriceInfo Model
struct PriceInfo: Decodable, Hashable {
    let price: Price
}

// MARK: - Price Model
struct Price: Decodable, Hashable {
    let amount: Int
    let currencySuffix: String
}

// MARK: - Multimedia Model
struct Multimedia: Decodable, Hashable {
    let images: [ImageDetail]
}

// MARK: - Image Model
struct ImageDetail: Decodable, Hashable {
    let url: String
    let tag: String
}

// MARK: - Features Model
struct Features: Decodable, Hashable {
    let hasSwimmingPool: Bool?
    let hasTerrace: Bool?
    let hasAirConditioning: Bool
    let hasBoxRoom: Bool
    let hasGarden: Bool?
}
