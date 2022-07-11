//
//  SelectView.swift
//  combinetask
//
//  Created by 白井裕人 on 2022/07/11.
//

import SwiftUI

struct SelectView: View {
    
    @ObservedObject var viewModel = ViewModel()
    @State var isShowMovieView: Bool = false
    
    var body: some View {
        ZStack {
            Image("fireworksBG")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: UIScreen.main.bounds.size.height)
            
            VStack {
                Spacer()
                    .frame(height: UIScreen.main.bounds.size.height / 3 )
                Button {
                    // 画面を切り替える
                    isShowMovieView.toggle()
                } label: {
                    Text("おみくじをひく")
                        .foregroundColor(.white)
                        .frame(width: 150)
                        .padding()
                    // 透過
                        .background(.ultraThinMaterial)
                        .background(Color.blue)
                        .cornerRadius(15)
                    
                }
                
            }
            
        }
        .edgesIgnoringSafeArea(.all)
        .fullScreenCover(isPresented: $isShowMovieView) {
            MovieView(viewModel: viewModel)
        }
        
    }
}

struct SelectView_Previews: PreviewProvider {
    static var previews: some View {
        SelectView()
    }
}
