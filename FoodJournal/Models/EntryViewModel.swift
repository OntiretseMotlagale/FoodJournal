//
//  EntryViewModel.swift
//  FoodJournal
//
//  Created by Ontiretse Motlagale on 2022/11/29.
//

import Foundation
import SwiftUI


struct EntryModelView: View {

    //Vars
    let entry:JournalItem
    
    var body: some View {
        ZStack {
            
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 100)
                .shadow(radius: 5)
                .foregroundColor(Color(.white))
                .padding()
            
            HStack{
                Image(uiImage: entry.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .font(.system(size: 10))
                    .frame(maxWidth: 200, maxHeight: 200)
                
                VStack(alignment: .leading){
                    Text(entry.decription)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .font(.system(size: 16))
                        .lineLimit(3)
                        .padding(.horizontal, 5)
                    
                    
                    Spacer()
                    
                    
                    Text(dateFormatter(entry.date))
                        .font(.system(size: 12))
                        .lineLimit(1)
                        .padding(5)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 100)
            //.shadow(radius: 10)
            .padding()
        }
    }
    
    
    func dateFormatter(_ date:Date) -> String {
        let formatter3 = DateFormatter()
        formatter3.dateFormat = "HH:mm E, d MMM y"
        
        return formatter3.string(from: date)
    }
}
