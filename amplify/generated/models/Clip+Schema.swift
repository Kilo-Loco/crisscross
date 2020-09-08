// swiftlint:disable all
import Amplify
import Foundation

extension Clip {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case username
    case caption
    case creationDate
    case videoKey
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let clip = Clip.keys
    
    model.pluralName = "Clips"
    
    model.fields(
      .id(),
      .field(clip.username, is: .required, ofType: .string),
      .field(clip.caption, is: .required, ofType: .string),
      .field(clip.creationDate, is: .required, ofType: .dateTime),
      .field(clip.videoKey, is: .required, ofType: .string)
    )
    }
}