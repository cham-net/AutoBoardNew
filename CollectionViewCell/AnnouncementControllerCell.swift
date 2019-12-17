import UIKit
import Closures
import RealmSwift

class AnnouncementControllerCell: UICollectionViewCell {
    
    @IBOutlet weak var labelBrandModelYear: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelTown: UILabel!
    @IBOutlet weak var labelMileage: UILabel!
    @IBOutlet weak var labelEngine: UILabel!
    @IBOutlet weak var labelTransmission: UILabel!
    @IBOutlet weak var labelColor: UILabel!
    @IBOutlet weak var labelDrive: UILabel!
    @IBOutlet weak var labelBody: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var fButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    var ann = [AutoOne]() {
        didSet {
            collectionView.reloadData()
        }
    }
        
    func setup(with ann: AutoOne) {
        labelBrandModelYear.text = ann.autoBrand! + ann.autoModel! + ann.autoYear!
        labelPrice.text = ann.autoPrice
        labelTown.text = ann.autoTown
        labelMileage.text = ann.autoMileage
        labelEngine.text = ann.autoEngineVolume! + ann.autoEnginePower! + ann.autoEngineType!
        labelTransmission.text = ann.autoTransmission
        labelColor.text = ann.autoColor
        labelDrive.text = ann.autoDrive
        labelBody.text = ann.autoBody
        labelDate.text = ann.autoDate.string
    }
        
    //ТЕСТОВАЯ МОДЕЛЬ ДАННЫХ
    let itemsTest = [
        (aBrand: "Mazda",
        aModel: "3",
        aYear: "2012",
        aBody: "Седан",
        aEngineType: "Бензин",
        aEngineVolume: "3.2 л.",
        aEnginePower: "190 л.с.",
        aTransmission: "Автоматическая",
        aDrive: "Полный",
        aColor: "Красный",
        aMileage: "180 000 км.",
        aRegion: "Челябинская область",
        aTown: "Челябинск",
        aContactName: "Василий",
        aContactPhone: "+79525254115",
        aPrice: "1 000 000 рублей",
        aInfo: "Продам, недорого test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test",
        aImage: [
                "https://47.img.avito.st/1280x960/7895113547.jpg",
                "https://48.img.avito.st/1280x960/7895113548.jpg",
                "https://41.img.avito.st/1280x960/7895113541.jpg",
                "https://54.img.avito.st/1280x960/7895113554.jpg",
                "https://47.img.avito.st/1280x960/7895113547.jpg",
                "https://48.img.avito.st/1280x960/7895113548.jpg",
                "https://41.img.avito.st/1280x960/7895113541.jpg",
                "https://54.img.avito.st/1280x960/7895113554.jpg",
                "https://41.img.avito.st/1280x960/7895113541.jpg",
                "https://54.img.avito.st/1280x960/7895113554.jpg"]),
            
        (aBrand: "Volkswagen",
        aModel: "Polo",
        aYear: "2018",
        aBody: "Седан",
        aEngineType: "Бензин",
        aEngineVolume: "3.2 л",
        aEnginePower: "190 л.с.",
        aTransmission: "Автоматическая",
        aDrive: "Полный",
        aColor: "Красный",
        aMileage: "180 000 км.",
        aRegion: "Сверловская область",
        aTown: "Екатеринбург",
        aContactName: "Дмитрий",
        aContactPhone: "+79523214119",
        aPrice: "900 000 рублей",
        aInfo: "Продам, недорого test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test",
        aImage: [
                "https://59.img.avito.st/640x480/7857943159.jpg",
                "https://86.img.avito.st/640x480/7857947586.jpg",
                "https://59.img.avito.st/640x480/7857943159.jpg",
                "https://86.img.avito.st/640x480/7857947586.jpg",
                "https://59.img.avito.st/640x480/7857943159.jpg",
                "https://86.img.avito.st/640x480/7857947586.jpg",
                "https://59.img.avito.st/640x480/7857943159.jpg",
                "https://86.img.avito.st/640x480/7857947586.jpg",
                "https://41.img.avito.st/1280x960/7895113541.jpg",
                "https://54.img.avito.st/1280x960/7895113554.jpg"]),
            
        (aBrand: "Volkswagena",
        aModel: "Polo",
        aYear: "2018",
        aBody: "Седан",
        aEngineType: "Бензин",
        aEngineVolume: "3.2 л",
        aEnginePower: "190 л.с.",
        aTransmission: "Автоматическая",
        aDrive: "Полный",
        aColor: "Красный",
        aMileage: "180 000 км.",
        aRegion: "Сверловская область",
        aTown: "Екатеринбург",
        aContactName: "Алексей",
        aContactPhone: "+79823114215",
        aPrice: "900 000 рублей",
        aInfo: "Продам, недорого test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test",
        aImage: [
                "https://82.img.avito.st/1280x960/7866079482.jpg",
                "https://11.img.avito.st/1280x960/7866080711.jpg",
                "https://82.img.avito.st/1280x960/7866079482.jpg",
                "https://11.img.avito.st/1280x960/7866080711.jpg",
                "https://82.img.avito.st/1280x960/7866079482.jpg",
                "https://11.img.avito.st/1280x960/7866080711.jpg",
                "https://82.img.avito.st/1280x960/7866079482.jpg",
                "https://11.img.avito.st/1280x960/7866080711.jpg",
                "https://41.img.avito.st/1280x960/7895113541.jpg",
                "https://54.img.avito.st/1280x960/7895113554.jpg"])
        ]
        
    }

extension AnnouncementControllerCell: UICollectionViewDelegate, UICollectionViewDataSource {
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ann.count
        //ann[section].autoPhoto.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnnouncementImageCollectionViewCell", for: indexPath as IndexPath) as! AnnouncementImageCollectionViewCell
        cell.imageAuto.ddownloadedFrom(link: "\(ann[indexPath.section].autoPhoto)")
        return cell
    }
}

//extension UIImageView {
//
//    func ddownloadedFrom(link:String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
//    guard let url = URL(string: link) else { return }
//    URLSession.shared.dataTask(with: url, completionHandler: { (data, _, error) -> Void in
//        guard let data = data , error == nil, let image = UIImage(data: data) else { return }
//        DispatchQueue.main.async { () -> Void in
//            self.image = image
//        }
//    }).resume()
//    }
//}


extension UIImageView {
    
    func ddownloadedFrom(url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { () -> Void in
                self.image = image
            }
        }.resume()
    }
    func ddownloadedFrom(link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        ddownloadedFrom(url: url, contentMode: mode)
    }
}


    
    
    
    
    
    
    
    

