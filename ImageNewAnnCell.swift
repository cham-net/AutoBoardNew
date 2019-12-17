import UIKit

class ImageNewAnnCell: UICollectionViewCell {
    
    @IBOutlet weak var imageCell: UIImageView!
    
//    func setThumbnailImage(thumbNailImage: UIImage) {
//        self.imageCell.image = thumbNailImage
//    }
    
    func configurecell(image: UIImage){


       imageCell.image = image

    }
    
}
