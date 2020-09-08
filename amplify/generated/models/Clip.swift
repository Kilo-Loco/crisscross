// swiftlint:disable all
import Amplify
import Foundation

public struct Clip: Model {
  public let id: String
  public var username: String
  public var caption: String
  public var creationDate: Temporal.DateTime
  public var videoKey: String
  
  public init(id: String = UUID().uuidString,
      username: String,
      caption: String,
      creationDate: Temporal.DateTime,
      videoKey: String) {
      self.id = id
      self.username = username
      self.caption = caption
      self.creationDate = creationDate
      self.videoKey = videoKey
  }
}