import UIKit

class AnnouncementDetailController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var labelBrandModel: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelTown: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelYear: UILabel!
    @IBOutlet weak var labelMileage: UILabel!
    @IBOutlet weak var labelBody: UILabel!
    @IBOutlet weak var labelColor: UILabel!
    @IBOutlet weak var labelEngine: UILabel!
    @IBOutlet weak var labelTransmission: UILabel!
    @IBOutlet weak var labelDrive: UILabel!
    @IBOutlet weak var labelContactName: UILabel!
    @IBOutlet weak var labelContactPhone: UILabel!
    @IBOutlet weak var labelInfo: UITextView!
    @IBAction func buttonToCall(_ sender: Any) {
        let number = labelContactPhone.text!
        let url = URL(string: "telprompt://\(number)")!
        UIApplication.shared.open(url)
    }
    
    var image: UIImage?
    
    var ann = [AutoOne]()
    
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
            "https://47.img.avito.st/1280x960/7895113547.jpg",
            "https://48.img.avito.st/1280x960/7895113548.jpg",
            "https://41.img.avito.st/1280x960/7895113541.jpg",
            "https://54.img.avito.st/1280x960/7895113554.jpg",
            "https://47.img.avito.st/1280x960/7895113547.jpg",
            "https://48.img.avito.st/1280x960/7895113548.jpg",
            "https://41.img.avito.st/1280x960/7895113541.jpg",
            "https://54.img.avito.st/1280x960/7895113554.jpg",
            "https://41.img.avito.st/1280x960/7895113541.jpg",
            "https://54.img.avito.st/1280x960/7895113554.jpg"])
    ]
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ann.count
        //ann[section].autoPhoto.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnnouncementDetailCollectionCell", for: indexPath as IndexPath) as! AnnouncementDetailCollectionCell
        cell.imageAnn.downloadedFrom(link: "\(ann[indexPath.section].autoPhoto)")
        return cell
    }
    
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goPhoto" {
            let cell: AnnouncementDetailCollectionCell = sender as! AnnouncementDetailCollectionCell
            let image = cell.imageAnn.image
            let previewVC: AnnPreviewImageController = segue.destination as! AnnPreviewImageController
            previewVC.currentPhoto = image
        }
    }
    
}

extension UIImageView {
    
    func downloadedFrom(url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
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
    
    func downloadedFrom(link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}
