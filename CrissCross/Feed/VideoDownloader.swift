//
//  VideoDownloader.swift
//  CrissCross
//
//  Created by Kyle Lee on 9/4/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import Amplify
import Combine
import Foundation

final class VideoDownloader {
    private init() {}
    static let shared = VideoDownloader()
    
    private var storage = [String: URL]()
    private var tokens = [String: AnyCancellable]()
    
    private static var temporaryUrl: URL {
        let livePhotoMovieFileName = NSUUID().uuidString
        let livePhotoMovieFilePath = (NSTemporaryDirectory() as NSString).appendingPathComponent((livePhotoMovieFileName as NSString).appendingPathExtension("mov")!)
        return URL(fileURLWithPath: livePhotoMovieFilePath)
    }
    
    func getLocalVideoURL(for key: String) -> Future<URL, Error> {
        Future { [weak self] promise in
            
            if let url = self?.storage[key] {
                promise(.success(url))
                
            } else {
            
                let url = Self.temporaryUrl
                self?.tokens[key] = Amplify.Storage.downloadFile(key: key, local: url)
                    .resultPublisher
                    .sink(
                        receiveCompletion: { completion in
                            switch completion {
                            case .finished:
                                print("finished")
                            case .failure(let error):
                                promise(.failure(error))
                            }
                        },
                        receiveValue: {
                            self?.storage[key] = url
                            promise(.success(url))
                        }
                    )
            }
        }
    }
}
