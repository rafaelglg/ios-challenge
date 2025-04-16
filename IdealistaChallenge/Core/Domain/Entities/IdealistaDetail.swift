//
//  IdealistaDetail.swift
//  IdealistaChallenge
//
//  Created by Rafael Loggiodice on 11/4/25.
//

import Foundation

struct IdealistaDetail: Codable, Identifiable, Hashable {
    var id: String = UUID().uuidString
    
    let adid: Int
    let price: Int
    let priceInfo: PriceInfoDetail
    let operation: String
    let propertyType: String
    let extendedPropertyType: String
    let homeType: String
    let state: String
    let multimedia: MultimediaDetail
    let propertyComment: String
    let ubication: UbicationDetail
    let country: String
    let moreCharacteristics: MoreCharacteristicsDetail
    let energyCertification: EnergyCertificationDetail
    
    var showPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "EUR" // o tu moneda
        formatter.locale = Locale(identifier: "es_ES")
        let formattedPrice = formatter.string(from: NSNumber(value: price)) ?? "\(price)"
        return formattedPrice
    }
    
    enum CodingKeys: String, CodingKey {
        case adid, price, priceInfo, operation, propertyType, extendedPropertyType,
             homeType, state, multimedia, propertyComment, ubication, country,
             moreCharacteristics, energyCertification
    }
    
    static var mock: IdealistaDetail {
        mocks[0]
    }
    
    static var empty: IdealistaDetail {
        IdealistaDetail(
            adid: 0,
            price: 0,
            priceInfo: PriceInfoDetail(
                amount: 0,
                currencySuffix: ""
            ),
            operation: "",
            propertyType: "",
            extendedPropertyType: "",
            homeType: "",
            state: "",
            multimedia: MultimediaDetail(
                images: [MultimediaImageDetail(
                    url: "",
                    tag: "",
                    localizedName: "",
                    multimediaId: 0
                )]
            ),
            propertyComment: "",
            ubication: UbicationDetail(
                latitude: 0.0,
                longitude: 0.0
            ),
            country: "",
            moreCharacteristics: MoreCharacteristicsDetail(
                communityCosts: 0,
                roomNumber: 0,
                bathNumber: 0,
                exterior: false,
                housingFurnitures: "",
                agencyIsABank: false,
                energyCertificationType: "",
                flatLocation: "",
                modificationDate: 0,
                constructedArea: 0,
                lift: false,
                boxroom: false,
                isDuplex: false,
                floor: "",
                status: ""
            ),
            energyCertification: EnergyCertificationDetail(
                title: "",
                energyConsumption: Emissions(
                    type: ""
                ),
                emissions: Emissions(
                    type: ""
                )
            )
        )
    }
    
    static var mocks: [IdealistaDetail] {
        return [
            IdealistaDetail(
                adid: 1,
                price: 1195000,
                priceInfo: PriceInfoDetail(amount: 1195000, currencySuffix: "€"),
                operation: "sale",
                propertyType: "homes",
                extendedPropertyType: "flat",
                homeType: "flat",
                state: "active",
                multimedia: MultimediaDetail(images: [
                    MultimediaImageDetail(url: "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/58/60/32/1273036727.webp", tag: "livingRoom", localizedName: "Salón", multimediaId: 1273036727),
                    MultimediaImageDetail(url: "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/a1/0f/ee/1273036728.webp", tag: "unknown", localizedName: "Desconocido", multimediaId: 1273036728),
                    MultimediaImageDetail(url: "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/79/6b/e0/1273036729.webp", tag: "views", localizedName: "Vistas", multimediaId: 1273036729),
                    // puedes añadir el resto si lo necesitas
                ]),
                propertyComment: "Venta.Piso EN EXCLUSIVA. Castellana. Se ofrece en venta vivienda de 133 m² en el exclusivo Barrio de Salamanca...",
                ubication: UbicationDetail(latitude: 40.4362687, longitude: -3.6833686),
                country: "es",
                moreCharacteristics: MoreCharacteristicsDetail(
                    communityCosts: 330,
                    roomNumber: 3,
                    bathNumber: 2,
                    exterior: false,
                    housingFurnitures: "unknown",
                    agencyIsABank: false,
                    energyCertificationType: "e",
                    flatLocation: "internal",
                    modificationDate: 1727683968000,
                    constructedArea: 133,
                    lift: true,
                    boxroom: false,
                    isDuplex: false,
                    floor: "2",
                    status: "renew"
                ),
                energyCertification: EnergyCertificationDetail(
                    title: "Certificado energético",
                    energyConsumption: Emissions(type: "e"),
                    emissions: Emissions(type: "e")
                )
            ),
            IdealistaDetail(
                adid: 2,
                price: 975000,
                priceInfo: PriceInfoDetail(amount: 975000, currencySuffix: "€"),
                operation: "sale",
                propertyType: "homes",
                extendedPropertyType: "flat",
                homeType: "flat",
                state: "active",
                multimedia: MultimediaDetail(images: [
                    MultimediaImageDetail(url: "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/00/c5/91/1273036730.webp", tag: "facade", localizedName: "Fachada", multimediaId: 1273036730),
                    MultimediaImageDetail(url: "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/f6/5e/9b/1273036732.webp", tag: "livingRoom", localizedName: "Salón", multimediaId: 1273036732),
                    MultimediaImageDetail(url: "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/7d/e1/66/1273036734.webp", tag: "livingRoom", localizedName: "Salón", multimediaId: 1273036734),
                ]),
                propertyComment: "Segunda propiedad similar en el exclusivo Barrio de Salamanca...",
                ubication: UbicationDetail(latitude: 40.4370000, longitude: -3.6840000),
                country: "es",
                moreCharacteristics: MoreCharacteristicsDetail(
                    communityCosts: 290,
                    roomNumber: 3,
                    bathNumber: 2,
                    exterior: false,
                    housingFurnitures: "unknown",
                    agencyIsABank: false,
                    energyCertificationType: "e",
                    flatLocation: "internal",
                    modificationDate: 1727683968000,
                    constructedArea: 130,
                    lift: true,
                    boxroom: false,
                    isDuplex: false,
                    floor: "1",
                    status: "renew"
                ),
                energyCertification: EnergyCertificationDetail(
                    title: "Certificado energético",
                    energyConsumption: Emissions(type: "e"),
                    emissions: Emissions(type: "e")
                )
            )
        ]
    }
}

struct PriceInfoDetail: Codable, Hashable {
    let amount: Int
    let currencySuffix: String
}

struct MultimediaDetail: Codable, Hashable {
    let images: [MultimediaImageDetail]
}

struct MultimediaImageDetail: Codable, Hashable {
    let url: String
    let tag: String
    let localizedName: String
    let multimediaId: Int
    
    var imageUrl: URL {
        guard let url = URL(string: url) else {
            return URL(filePath: "")
        }
        return url
    }
}

struct UbicationDetail: Codable, Hashable {
    let latitude: Double
    let longitude: Double
}

struct MoreCharacteristicsDetail: Codable, Hashable {
    let communityCosts: Int
    let roomNumber: Int
    let bathNumber: Int
    let exterior: Bool
    let housingFurnitures: String
    let agencyIsABank: Bool
    let energyCertificationType: String
    let flatLocation: String
    let modificationDate: Int
    let constructedArea: Int
    let lift: Bool
    let boxroom: Bool
    let isDuplex: Bool
    let floor: String
    let status: String
    
    var isExterior: String {
        guard exterior else {
            return "Is not exterior"
        }
        return "Is exterior"
    }
    
    var hasLift: String {
        guard exterior else {
            return "Without lift"
        }
        return "With lift"
    }
}

struct EnergyCertificationDetail: Codable, Hashable {
    let title: String
    let energyConsumption: Emissions
    let emissions: Emissions
}

struct Emissions: Codable, Hashable {
    let type: String
}
