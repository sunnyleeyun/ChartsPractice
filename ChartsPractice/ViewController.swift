//
//  ViewController.swift
//  ChartsPractice
//
//  Created by Mac on 2017/6/28.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {

    @IBOutlet weak var myView: BarChartView!
    
    let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //執行 setChart 
        setChart(dataPoints: months, values: unitsSold)

    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func setChart(dataPoints: [String], values: [Double]) {
        
        //若沒有資料，顯示的文字
        myView.noDataText = "You need to provide data for the chart."
        
        //存放資料的陣列，型別是BarChartDataEntry.
        var dataEntries: [BarChartDataEntry] = []
        
        //迴圈，來載入每筆資料內容
        for i in 0..<dataPoints.count {
            //設定X.Y座標分別顯示的東西
            let dataEntry = BarChartDataEntry(x: Double(i), y: unitsSold[i])
            //把個別的dataEntry的資料，儲存至dataEntries中
            dataEntries.append(dataEntry)
        }
        
        //顯示的資料之內容與名稱（左下角所顯示的）
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Units Sold")
        //把dataSet轉換成可顯示的BarChartData
        let chartData = BarChartData(dataSet: chartDataSet)
        //指定剛剛連結的myView要顯示的資料為charData
        myView.data = chartData
        
        /*
        
        ////// 從這裡開始是補充的部分 /////
        
        //改變chartDataSet的顏色，此為橘色
        //chartDataSet.colors = [UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 1)]
        
        //改變chartDataSet為彩色
        chartDataSet.colors = ChartColorTemplates.colorful()
        
        //標籤換到下方
        myView.xAxis.labelPosition = .bottom
        
        //改變barChartView的背景顏色
        myView.backgroundColor = UIColor(red: 189/255, green: 195/255, blue: 199/255, alpha: 1)
        
        //一個一個延遲顯現的特效
        myView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        
        //彈一下特效
        myView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInBounce)
        
        //設立界線
        let limit = ChartLimitLine(limit: 10.0, label: "Target")
        myView.rightAxis.addLimitLine(limit)
        
        ///// 補充到此 /////
        
        */
        
    }

}

