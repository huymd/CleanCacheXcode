    //
    //  AnalysisView.swift
    //  Cleaner4Xcode
    //
    //  Created by Baye Wayly on 2019/10/2.
    //  Copyright © 2019 Baye. All rights reserved.
    //

import SwiftUI

struct AnalysisView: View {
    @EnvironmentObject var appData: AppData
    @ObservedObject var analysis: Analysis
    
    var body: some View {
        let (title, _) = analysis.group.describe()
        
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.title2)
                    .bold()
                    .foregroundColor(.primary)
                
                Text(humanize(analysis.totalSize))
                    .font(Font.headline.monospacedDigit())
//                    .foregroundColor(.red)
                    .foregroundColor(Color(red: 50/255, green: 109/255, blue: 198/255))
                
                if analysis.progress > 0 && analysis.progress < 1 {
                    ProgressBar(progress: CGFloat(analysis.progress), height: 4)
                        .frame(width: 80, height: 4, alignment: .leading)
                        .animation(.easeIn)
                } else {
                    Text("").frame(height: 2)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct AnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        let data = AppData()
        return VStack{
            AnalysisView(analysis: data.deviceSupport)
            AnalysisView(analysis: data.archives)
            AnalysisView(analysis: data.archives)
            //AnalysisView(analysis: data.previews)
        }
        .padding()
        .environmentObject(data)
    }
}
