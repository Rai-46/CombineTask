//
//  MovieView.swift
//  combinetask
//
//  Created by 白井裕人 on 2022/07/11.
//

import SwiftUI
import AVKit
import AVFoundation

struct MovieView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            
            Color.gray.ignoresSafeArea()
            
            Movie()
                .gesture(
                    LongPressGesture(minimumDuration: 2, maximumDistance: Double.greatestFiniteMagnitude)
                        .onEnded({ _ in
                            //　ここで、長押しされた時、にBoolを変化させて、Publishedのコンバイン使って、音を鳴らすようにする。
                            viewModel.onTapView()
                        }))
                .fullScreenCover(isPresented: $viewModel.isTapMovie) {
                    ResultView(viewModel: viewModel)
                }
            
            VStack {
                Spacer()
                    .frame(height: UIScreen.main.bounds.size.height / 2)
                
                Text("画面を長押しでスキップ！")
                    .font(.title2)
            }
            
        }
    }
}

//struct MovieView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieView()
//    }
//}


struct Movie: UIViewRepresentable {
    
    let player: AVPlayer = AVPlayer(url: Bundle.main.url(forResource: "omikujiMovie", withExtension: "mp4")!)
    
    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<Movie>) {
        //
        
    }
    
    func makeUIView(context: UIViewRepresentableContext<Movie>) -> some UIView {
        let playerUIView = PlayerUIView(frame: .zero, player: player)
        
        return playerUIView
    }
    
    
}

class PlayerUIView: UIView {
    private let playerLayer = AVPlayerLayer()
    
    init(frame: CGRect, player: AVPlayer) {
        super.init(frame: frame)
        
        player.play()
        player.rate = 1.0
        
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspect
        layer.addSublayer(playerLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}


