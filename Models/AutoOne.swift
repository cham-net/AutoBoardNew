import UIKit
import RealmSwift

class AutoOne: Object {
    
    @objc dynamic var id: String?
    @objc dynamic var autoBrand: String?            //Марка
    @objc dynamic var autoModel: String?            //Модель
    @objc dynamic var autoYear: String?             //Год выпуска
    @objc dynamic var autoBody: String?             //Кузов
    @objc dynamic var autoEngineType: String?       //Тип двигателя
    @objc dynamic var autoEngineVolume: String?     //Объем двигателя
    @objc dynamic var autoEnginePower: String?      //Мощность двигателя
    @objc dynamic var autoTransmission: String?     //Коробка передач
    @objc dynamic var autoDrive: String?            //Привод
    @objc dynamic var autoColor: String?            //Цвет
    @objc dynamic var autoMileage: String?          //Пробег
    @objc dynamic var autoRegion: String?           //Регион
    @objc dynamic var autoTown: String?             //Город
    @objc dynamic var contactName: String?          //Имя
    @objc dynamic var contactPhone: String?         //Номер телефона
    @objc dynamic var autoPrice: String?            //Цена
    @objc dynamic var autoInfo: String?             //Дополнительная информация
    @objc dynamic var autoDate: Date = Date()       //Дата
    var autoPhoto: [String] = []                    //Фото
    
    convenience init(id: String, data: JSON) {
        self.init()
        self.id = id
        self.autoBrand = data["autoBrand"] as? String
        self.autoModel = data["autoModel"] as? String
        self.autoYear = data["autoYear"] as? String
        self.autoBody = data["autoBody"] as? String
        self.autoEngineType = data["autoEngineType"] as? String
        self.autoEngineVolume = data["autoEngineType"] as? String
        self.autoEnginePower = data["autoEnginePower"] as? String
        self.autoTransmission = data["autoTransmission"] as? String
        self.autoDrive = data["autoDrive"] as? String
        self.autoColor = data["autoColor"] as? String
        self.autoMileage = data["autoMileage"] as? String
        self.autoRegion = data["autoRegion"] as? String
        self.autoTown = data["autoTown"] as? String
        self.contactName = data["autoTown"] as? String
        self.contactPhone = data["contactPhone"] as? String
        self.autoPrice = data["autoPrice"] as? String
        self.autoInfo = data["autoInfo"] as? String
        self.autoDate = (data["autoDate"] as! String).date
        self.autoPhoto = data["autoPhoto"] as! [String]
    }
    
    
}
