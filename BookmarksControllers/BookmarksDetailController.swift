import UIKit

class BookmarksDetailController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
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
    @IBOutlet weak var textInfo: UITextView!
    @IBAction func buttonToCall(_ sender: Any) {
        let number = labelContactPhone.text!
        let url = URL(string: "telprompt://\(number)")!
        UIApplication.shared.open(url)
    }
    
    var image: UIImage?
    
    var item = [AutoOne]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        item[section].autoPhoto.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookmarksDetailCollectionCell", for: indexPath as IndexPath) as! BookmarksDetailCollectionCell
        cell.image.downloadedFrom(link: "\(item[indexPath.section].autoPhoto[indexPath.item])")
        //cell.imageAnn.downloadedFrom(link: "\(ann[indexPath.section].autoPhoto[indexPath.item])")
        return cell
    }
    
    
    
    
    
    
    
}
