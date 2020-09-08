// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "4bcb3557cdd5fdea01000c0eb3b48012"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: Clip.self)
  }
}