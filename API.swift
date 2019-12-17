import Foundation

typealias JSON = [String : Any]

enum API {

  static var identifier: String { "TEST17" }

  static var baseURL: String {
      "https://ios-napoleonit.firebaseio.com/data/\(identifier)/"
  }

  static var storageName: String { "ann" }

  static func loadAnn(completion: @escaping ([AutoOne]) -> Void) {
    let url = URL(string: baseURL + ".json")!
    let request = URLRequest(url: url)
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        guard
            let data = data,
            let json = try? JSONSerialization.jsonObject(with: data, options: []) as? JSON
        else { return }
    let annJSON = json[storageName] as! JSON
    var ann = [AutoOne]()
    for anns in annJSON {
        ann.append(AutoOne(id: anns.key, data: anns.value as! JSON))
    }
        
    ann.sort { $0.autoDate > $1.autoDate }
        
    DispatchQueue.main.async {
        completion(ann)
        }
    }
  task.resume()
  }

static func createAnn(autoBrand: String, autoModel: String, autoYear: String, autoBody: String, autoEngineType: String, autoEngineVolume: String, autoEnginePower: String, autoTransmission: String, autoDrive: String, autoColor: String, autoMileage: String, autoRegion: String, autoTown: String, contactName: String, contactPhone: String, autoPrice: String, autoInfo: String, autoPhoto: [String], completion: @escaping (Bool) -> Void) {
    let params = [
        "autoBrand": autoBrand,
        "autoModel": autoModel,
        "autoYear": autoYear,
        "autoBody": autoBody,
        "autoEngineType": autoEngineType,
        "autoEngineVolume": autoEngineVolume,
        "autoEnginePower": autoEnginePower,
        "autoTransmission": autoTransmission,
        "autoDrive": autoDrive,
        "autoColor": autoColor,
        "autoMileage": autoMileage,
        "autoRegion": autoRegion,
        "autoTown": autoTown,
        "contactName": contactName,
        "contactPhone": contactPhone,
        "autoPrice": autoPrice,
        "autoInfo": autoInfo,
        "autoPhoto": autoPhoto,
        "autoDate": Date().string
        ] as [String : Any]
    let url = URL(string: baseURL + "/\(storageName).json")!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.httpBody = try? JSONSerialization.data(withJSONObject: params)
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        completion(error == nil)
        }
    task.resume()
    }
}
