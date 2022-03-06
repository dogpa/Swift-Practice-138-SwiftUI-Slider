//
//  ContentView.swift
//  Swift Practice 138 SwiftUI Slider
//
//  Created by Dogpa's MBAir M1 on 2022/3/6.
//

import SwiftUI

struct ContentView: View {
    
    ///初始slider溫度
    @State private var temperatureIndex: Float = 20.0
   
    ///華氏溫度轉換
    var Fahrenheit : Float {
        return ((temperatureIndex * 9 / 5) + 32)
    }
    
    var body: some View{
        
        VStack{
            Spacer()
            
            VStack{
                Text("體溫滑桿")
                //溫度Slider，value為溫度, in為溫度範圍, step為slider每次移動改變的值
                Slider(value: $temperatureIndex,
                       in : -10...100,
                       step: 0.1) {
                } minimumValueLabel: {
                    Text("-10")
                } maximumValueLabel: {
                    Text("100")
                }
            }.padding().background(Color.yellow)

            
            
            //顯示華氏與攝氏溫度結果，依照溫度判斷決定顯示顏色
            VStack(alignment: .center, spacing: 40) {
               
                HStack(){
                    Text("攝氏溫體：").font(.system(size: 20))
                    Text("\(String(format: "%.2f", temperatureIndex))")
                        .font(.system(size: 30))
                        .foregroundColor(checkTemperatureColor(gray:false)).frame(width: 150, height: 30, alignment: .center)
                }
                
                HStack(){
                    Text("華氏溫體：").font(.system(size: 20))
                    Text("\(String(format: "%.2f", Fahrenheit))")
                        .font(.system(size: 30))
                        .foregroundColor(checkTemperatureColor(gray:false))
                        .frame(width: 150, height: 30, alignment: .center)
                }
                

            }.padding().background(Color(red: 189/255, green: 1, blue: 189/255))
            
            
            //放置一張圖片，依照溫度判斷決定背景顏色
            VStack{
                Image("human")
                    .resizable().background(checkTemperatureColor(gray:true))
                    .scaledToFit()
                    .frame(width: 300, height: 300)
            }
            Spacer()
            Spacer()
        }
        

    }
    
    
    /// 依照溫度回傳指定顏色
    /// - Parameter gray: 因為照片黑底會看不清楚，所以判斷是否改成灰色
    /// - Returns: 回傳指定顏色值
    func checkTemperatureColor(gray:Bool) -> Color {
        var color : Color = Color.black
        if temperatureIndex < 15.0 {
            color = .blue
        }else if temperatureIndex >= 15.0 && temperatureIndex < 37.5  {
            if gray == true {
                color = .gray
            }
            else {
                color = .black
            }
        }else{
            color = .red
        }
        return color
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
