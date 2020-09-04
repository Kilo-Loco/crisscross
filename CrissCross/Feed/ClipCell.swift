//
//  ClipCell.swift
//  CrissCross
//
//  Created by Kyle Lee on 9/3/20.
//  Copyright © 2020 Kilo Loco. All rights reserved.
//

import Combine
import UIKit

final class ClipCell: UICollectionViewCell {
    
    let actionPublisher = PassthroughSubject<Action, Never>()
    
    private lazy var videoView = VideoView.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var profileButton = UIButton.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = Self.buttonDimension / 2
        $0.setBackgroundImage(UIImage(systemName: "person.circle.fill"), for: .normal)
        $0.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        $0.tintColor = .white
    }
    
    private lazy var likeButton = UIButton.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setBackgroundImage(
            UIImage(systemName: "heart.fill"),
            for: .normal
        )
        $0.tintColor = .white
        $0.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    private lazy var likeCountLabel = UILabel.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .white
        $0.adjustsFontForContentSizeCategory = true
        $0.font = .preferredFont(forTextStyle: .subheadline)
        $0.numberOfLines = 1
        $0.textAlignment = .center
    }
    
    private lazy var likeStackView = UIStackView.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
    }
    
    private lazy var commentButton = UIButton.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setBackgroundImage(
            UIImage(systemName: "text.bubble.fill"),
            for: .normal
        )
        $0.tintColor = .white
        $0.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    private lazy var commentCountLabel = UILabel.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .white
        $0.adjustsFontForContentSizeCategory = true
        $0.font = .preferredFont(forTextStyle: .subheadline)
        $0.numberOfLines = 1
        $0.textAlignment = .center
    }
    
    private lazy var commentStackView = UIStackView.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
    }
    
    private lazy var shareButton = UIButton.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setBackgroundImage(
            UIImage(systemName: "arrowshape.turn.up.right.fill"),
            for: .normal
        )
        $0.tintColor = .white
        $0.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    private lazy var shareCountLabel = UILabel.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .white
        $0.adjustsFontForContentSizeCategory = true
        $0.font = .preferredFont(forTextStyle: .subheadline)
        $0.numberOfLines = 1
        $0.textAlignment = .center
    }
    
    private lazy var shareStackView = UIStackView.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
    }
    
    private lazy var soundButton = UIButton.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setBackgroundImage(
            UIImage(systemName: "circle.fill"),
            for: .normal
        )
        $0.tintColor = .white
        $0.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    private lazy var buttonStackView = UIStackView.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.spacing = 30
    }
    
    private lazy var handleLabel = UILabel.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .white
        $0.adjustsFontForContentSizeCategory = true
        $0.font = .preferredFont(forTextStyle: .headline)
        $0.numberOfLines = 1
    }
    
    private lazy var dateLabel = UILabel.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .white
        $0.adjustsFontForContentSizeCategory = true
        $0.font = .preferredFont(forTextStyle: .body)
        $0.numberOfLines = 1
    }
    
    private lazy var handleDateStackView = UIStackView.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.spacing = 4
    }
    
    private lazy var captionLabel = UILabel.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .white
        $0.adjustsFontForContentSizeCategory = true
        $0.font = .preferredFont(forTextStyle: .body)
        $0.numberOfLines = 3
    }
    
    private lazy var musicIcon = UIImageView.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(systemName: "music.note")
        $0.tintColor = .white
    }
    
    private lazy var soundLabel = UILabel.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .white
        $0.adjustsFontForContentSizeCategory = true
        $0.font = .preferredFont(forTextStyle: .body)
        $0.numberOfLines = 1
    }
    
    private lazy var soundStackView = UIStackView.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.spacing = 8
    }
    
    private lazy var detailsStackView = UIStackView.create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.alignment = .leading
        $0.spacing = 8
    }
    
    private var clip: Clip?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSelf()
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupSelf() {
        backgroundColor = .black
    }
    
    private func setupSubviews() {
        likeStackView.addArrangedSubviews(likeButton, likeCountLabel)
        commentStackView.addArrangedSubviews(commentButton, commentCountLabel)
        shareStackView.addArrangedSubviews(shareButton, shareCountLabel)
        
        buttonStackView.addArrangedSubviews(
            profileButton,
            likeStackView,
            commentStackView,
            shareStackView,
            soundButton
        )
        
        handleDateStackView.addArrangedSubviews(handleLabel, dateLabel)
        soundStackView.addArrangedSubviews(musicIcon, soundLabel)
        
        detailsStackView.addArrangedSubviews(
            handleDateStackView,
            captionLabel,
            soundStackView
        )
        
        addSubviews(
            videoView,
            buttonStackView,
            detailsStackView
        )
        
        let guide = contentView.layoutMarginsGuide
        let bottomPadding: CGFloat = UIDevice.current.hasNotch ? -80 : -20
        NSLayoutConstraint.activate([
            videoView.topAnchor.constraint(equalTo: topAnchor),
            videoView.leadingAnchor.constraint(equalTo: leadingAnchor),
            videoView.trailingAnchor.constraint(equalTo: trailingAnchor),
            videoView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            profileButton.widthAnchor.constraint(equalToConstant: Self.buttonDimension),
            profileButton.heightAnchor.constraint(equalToConstant: Self.buttonDimension),
            
            likeButton.widthAnchor.constraint(equalToConstant: Self.buttonDimension),
            likeButton.heightAnchor.constraint(equalToConstant: Self.buttonDimension),
            
            commentButton.widthAnchor.constraint(equalToConstant: Self.buttonDimension),
            commentButton.heightAnchor.constraint(equalToConstant: Self.buttonDimension),
            
            shareButton.widthAnchor.constraint(equalToConstant: Self.buttonDimension),
            shareButton.heightAnchor.constraint(equalToConstant: Self.buttonDimension),
            
            soundButton.widthAnchor.constraint(equalToConstant: Self.buttonDimension),
            soundButton.heightAnchor.constraint(equalToConstant: Self.buttonDimension),
            
            buttonStackView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: bottomPadding),
            
            captionLabel.leadingAnchor.constraint(equalTo: detailsStackView.leadingAnchor),
            captionLabel.trailingAnchor.constraint(equalTo: detailsStackView.trailingAnchor),
            
            detailsStackView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            detailsStackView.trailingAnchor.constraint(equalTo: buttonStackView.leadingAnchor, constant: -16),
            detailsStackView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: bottomPadding)
        ])
    }
    
    func populate(with clip: Clip) {
        self.clip = clip
        
        let videoPath = Bundle.main.path(forResource: "test", ofType: "mov")!
        videoView.prepareVideo(at: videoPath)
        
        handleLabel.text = "@kilo_loco"
        dateLabel.text = "• \(DateService.shared.formatter.string(from: Date()))"
        captionLabel.text = "That boi needs Jesus!"
        soundLabel.text = "@kilo_loco Original Sound"
        
        likeCountLabel.text = "500"
        commentCountLabel.text = "100"
        shareCountLabel.text = "200"
    }
    
    func togglePlay(on: Bool) {
        videoView.togglePlay(on: on)
    }
    
    @objc
    func didTapButton(_ sender: UIButton) {
        guard let clip = self.clip else { return }
        
        let action: Action
        
        switch sender {
        case profileButton: action = .profile(clip)
        case likeButton: action = .like(clip)
        case commentButton: action = .comment(clip)
        case shareButton: action = .share(clip)
        case soundButton: action = .sound(clip)
        default: return
        }
        
        print("Tapped")
        
        actionPublisher.send(action)
    }
    
    override func prepareForReuse() {
        togglePlay(on: false)
        
    }
}

extension ClipCell: Reusable {}

extension ClipCell {
    private static let buttonDimension: CGFloat = 50
    
    enum Action {
        case comment(Clip)
        case like(Clip)
        case profile(Clip)
        case share(Clip)
        case sound(Clip)
    }
}
