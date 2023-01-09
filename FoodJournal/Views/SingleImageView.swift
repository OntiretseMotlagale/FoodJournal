//
//  SingleImageView.swift
//  FoodJournal
//
//  Created by Ontiretse Motlagale on 2022/11/29.
//

import SwiftUI

struct SingleImageView: View {
    
    //Vars
    @Binding var isShowSingleImageView:Bool
    let entry:JournalItem
    
    var body: some View {
        VStack{
            Image(uiImage: entry.imageName)
                .resizable()
                .scaledToFit()
                .border(.black)
                .padding()
            
            HStack{
                Text(entry.decription)
                    .font(.system(size: 20))
                    .padding()
                
                Spacer()
            }

            Spacer()
            
            if #available(iOS 16.0, *) {
                Button("Done") {
                    withAnimation {
                        isShowSingleImageView.toggle()
                    }
                }
                .frame(minWidth: 300, minHeight: 60)
                .background(Color(.black).opacity(0.8))
                .foregroundColor(.white)
                .cornerRadius(45)
                .shadow(color: Color(.systemYellow), radius: 10)
                .font(.system(size: 20))
                .tracking(1)
                .padding(.bottom, 80)
                .padding(.horizontal)
            } else {
                // Fallback on earlier versions
                Button("Done") {
                    withAnimation {
                        isShowSingleImageView.toggle()
                    }
                }
                .frame(minWidth: 300, minHeight: 60)
                .background(Color(.black).opacity(0.8))
                .foregroundColor(.white)
                .cornerRadius(45)
                .shadow(color: Color(.systemYellow), radius: 10)
                .font(.system(size: 20))
                //.tracking(1)
                .padding(.bottom, 80)
                .padding(.horizontal)
            }
        }
        .onAppear{
            print(entry.decription)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
    }
}

struct SingleImageView_Previews: PreviewProvider {
    static var previews: some View {
        SingleImageView(isShowSingleImageView: .constant(false), entry: JournalItem(decription: "nil", date: Date.now, imageName: UIImage()))
    }
}
