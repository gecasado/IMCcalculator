//
//  IMCView.swift
//  cursoSwift
//
//  Created by Gerardo Casado on 28/6/25.
//

import SwiftUI

struct IMCView: View {
   /* init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    } */
    @State var gender: Int = 0
    @State var height: Double = 150
    @State var age: Int =  18
    @State var weight: Int = 60
    var body: some View {
        VStack{
            Spacer()
            HStack{
                togleButton(text: "Hombre", imagenName:"heart.fill", gender: 0, selectedGender: $gender)
                togleButton(text: "Mujer", imagenName:"star.fill", gender: 1, selectedGender: $gender)
            }
            heightCalculator(selectedHeight: $height)
            HStack{
                counterbutton(text: "edad", number: $age)
                counterbutton(text: "peso", number: $weight)
            }
            imcCalculator(userWeight: Double(weight), userHeight: height)
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.backgroundIMC)
            //.navigationBarBackButtonHidden()
            .toolbar{
                ToolbarItem(placement: .principal){
                    Text("IMC calculator")
                        .foregroundColor(.white)
                }
            }
    }
}
struct togleButton: View {
    let text: String
    let imagenName: String
    let gender: Int
    @Binding var selectedGender:Int
    
    var body: some View {
        
        let color = if (gender == selectedGender){
            Color(.backgroudSelected)
        }else{
            Color(.backgroundComponent)
        }
        
        Button(action: {
            selectedGender = gender
        }){
            VStack{
                Image(systemName: imagenName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .foregroundColor(.white)
                informationText(text: text)
                    
            }.frame(maxWidth: .infinity,maxHeight: .infinity)
                .background(color)
                .cornerRadius(16)
        }
        
    }
    
}

struct informationText: View {
    let text:String
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .bold()
            .foregroundColor(.white)
    }
}
struct titleText: View {
    let text:String
    var body: some View {
        Text(text)
            .font(.title2)
            .foregroundColor(.gray)
    }
    
}

struct heightCalculator: View {
    @Binding var selectedHeight:Double
    var body: some View {
        VStack{
            titleText(text: "Altura")
            informationText(text:"\(Int(selectedHeight)) cm")
            Slider(value: $selectedHeight, in:100...230, step: 1).accentColor(.purple).padding(.horizontal, 16)
            
        }.frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(.backgroundComponent)
            .cornerRadius(16)
    }
    
}

struct counterbutton: View {
    let text:String
    @Binding var number:Int
    var body: some View {
        VStack{
            titleText(text: text)
            informationText(text: String(number))
            HStack{
                Button(action: {
                    if(number <= 0)
                    {
                        number = 0
                    }else{
                        number -= 1
                    }
                }){
                    ZStack{
                        Circle()
                            .frame(width: 70, height: 70)
                            .accentColor(.purple)
                        Image(systemName: "minus")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 25, height: 4)
                        
                    }
                    Button(action: {
                        if(number > 200)
                        {
                            number = 100
                        }else{
                            number += 1
                        }}){
                        ZStack{
                            Circle()
                                .frame(width: 70, height: 70)
                                .accentColor(.purple)
                            Image(systemName: "plus")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 25, height: 25)
                                
                        }
                    }
                }
            }
        }.frame(maxWidth: .infinity,maxHeight: .infinity)
            .background(.backgroundComponent)
            .cornerRadius(16)
    }
}

struct imcCalculator: View {
    let userWeight: Double
    let userHeight: Double
    var body: some View {
        NavigationStack {
            NavigationLink(destination: {IMCresult(userWeight: userWeight, userHeight: userHeight)}) {
                Text("Calcular")
                    .font(.title)
                    .bold()
                    .foregroundColor(.purple)
                
                
            }.frame(maxWidth: .infinity,maxHeight: 100)
                .background(.backgroundComponent)
                .cornerRadius(16)
        }
    }
}


#Preview {
    IMCView()
}
