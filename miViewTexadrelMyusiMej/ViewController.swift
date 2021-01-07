//
//  ViewController.swift
//  miViewTexadrelMyusiMej
//
//  Created by Saq on 12/11/20.
//  Copyright © 2020 Saq. All rights reserved.
//
//        var qareriDasht:[[Bool]] = [[true,true,true,true,true,true,true,true],
//        [true,true,true,true,true,true,true,true],
//        [false,false,false,false,false,false,false,false],
//        [false,false,false,false,false,false,false,false],
//        [false,false,false,false,false,false,false,false],
//        [false,false,false,false,false,false,false,false],
//        [true,true,true,true,true,true,true,true],
//        [true,true,true,true,true,true,true,true]]
//    var qareriDasht:[[Bool]] = [[true,false,true,false],
//                                [false,false,false,false],
//                                [false,false,false,false],
//                                [false,true,false,true]]
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var secondView: UIView!
    
    @IBOutlet var sharjiFirstView: UIPanGestureRecognizer!
    
    
    @IBOutlet var errordView: UIView!
    let toxCount:CGFloat = 8
    let syunCount:CGFloat = 8
    let bordeWidth = 2
    
    func bajaniMaserVIew(view:UIView) {
        jnjiView(view: view)
        let viewWidth = view.bounds.width / syunCount
        let viewHeight = view.bounds.height / toxCount
        for tox in 0..<Int(toxCount) {
            for syun in 0..<Int(syunCount) {
                let viewFrame = CGRect(x: 0 , y: 0, width: viewWidth, height: viewHeight)
                let avelacvoxView = UIView(frame: viewFrame)
                avelacvoxView.center = veradardzruMiQarakusuKentrony(view: view, syun: syun, tox: tox)
                avelacvoxView.layer.borderWidth = CGFloat(bordeWidth)
                avelacvoxView.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
                avelacvoxView.backgroundColor = ((syun + tox) % 2) == 0 ? #colorLiteral(red: 0.5056313452, green: 0.4581978993, blue: 0.3308045929, alpha: 1) : #colorLiteral(red: 1, green: 0.9257106548, blue: 0.8345380365, alpha: 1)
                view.addSubview(avelacvoxView)
            }
        }
    }
    
    var dasckDasht:[[(Rank,PlayerType)?]] = [[(.rook,.white),(.knight,.white),(.bishop,.white),(.queen,.white),(.king,.white),(.bishop,.white),(.knight,.white),(.rook,.white)],
        [(.pown,.white),(.pown,.white),(.pown,.white),(.pown,.white),(.pown,.white),(.pown,.white),(.pown,.white),(.pown,.white)],
        [nil,           nil,            nil,            nil,            nil,        nil,            nil,            nil],
        [nil,           nil,            nil,            nil,            nil,        nil,            nil,            nil],
        [nil,           nil,            nil,            nil,            nil,        nil,            nil,            nil],
        [nil,           nil,            nil,            nil,            nil,        nil,            nil,            nil],
        [(.pown,.black),(.pown,.black),(.pown,.black),(.pown,.black),(.pown,.black),(.pown,.black),(.pown,.black),(.pown,.black)],
        [(.rook,.black),(.knight,.black),(.bishop,.black),(.queen,.black),(.king,.black),(.bishop,.black),(.knight,.black),(.rook,.black)]]
    
    
    func avelacruViewSecondViewMej(view:UIView,syun:Int,tox:Int,playerType:PlayerType,konkretQarType: Rank) {
        let frame = CGRect(x: 0, y: 0, width: view.bounds.width / (1.5 * toxCount), height: view.bounds.height / (1.5 * syunCount))
        let viewiMejAvelacvoxView = Xaxaqar(frame: frame, type: playerType, rankType: konkretQarType)
        viewiMejAvelacvoxView.center = veradardzruMiQarakusuKentrony(view: view, syun: syun, tox: tox)
        viewiMejAvelacvoxView.row = tox
        viewiMejAvelacvoxView.col = syun
        //        viewiMejAvelacvoxView.qareriDasht[syun][tox]!.0 = playerType
        //        viewiMejAvelacvoxView.qareriDasht[syun][tox]!.1 = konkretQarType
        //        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        //        viewiMejAvelacvoxView.addGestureRecognizer(tap)
        let pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        viewiMejAvelacvoxView.addGestureRecognizer(pan)
        view.addSubview(viewiMejAvelacvoxView)
    }
    
    
    //     @objc func handleTap(_ sender:UITapGestureRecognizer) {
    //            guard sender.view != nil else { return }
    //            if let xaxaqar = sender.view as? Xaxaqar {
    //                switch (xaxaqar.playerType,xaxaqar.rank) {
    //                case (.black,.pown):
    //                jnjiImageView(imageView: xaxaqar)
    //
    //
    //                default:
    //                    break
    //                }
    ////                print(xaxaqar.playerType!)
    //                }
    //        }
    
    
    //    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    //    super.touchesBegan(touches, with: event)
    //
    //    let first = touches.first!
    ////        print(touches.count)
    //    let figureLocation = first.location(in: secondView)
    //    fromCol = Int(figureLocation.x / 100)
    //    fromRow = Int(figureLocation.y / 100)
    //    print("from \(fromCol), \(fromRow)")
    //    dasckDasht[fromCol][fromRow] = nil
    //
    //    }
    
    
    //    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    //        super.touchesEnded(touches, with: event)
    //        let first = touches.first!
    //            let figureLocation = first.location(in: secondView)
    //         toCol = Int(figureLocation.x / 100)
    //         toRow = Int(figureLocation.y / 100)
    //        print("to \(toCol), \(toRow)")
    ////        avelacruViewSecondViewMej(view: secondView, syun: toCol , tox: toRow , playerType: .black, konkretQarType: .pown)
    ////        dasckDasht[toCol][toRow] = (.pown,.black)
    ////        if 0...7 ~= fromCol  && fromRow == 6 {
    ////            avelacruViewSecondViewMej(view: secondView, syun: toCol , tox: toRow , playerType: .black, konkretQarType: .pown)
    ////            dasckDasht[toCol][toRow] = (.pown,.black)
    ////        }
    //    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        skzbnakanX = (sharjiFirstView.view?.frame.origin.x)!
        skzbnakanY = (sharjiFirstView.view?.frame.origin.y)!
        sharjiFirstView.view?.layer.borderWidth = 4
        sharjiFirstView.view?.layer.borderColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        bajaniMaserVIew(view: secondView)
        for i in 0..<dasckDasht.count {
            for j in 0..<dasckDasht[i].count {
                if dasckDasht[i][j] != nil {
                    avelacruViewSecondViewMej(view: secondView, syun: j, tox: i, playerType: dasckDasht[i][j]!.1, konkretQarType: dasckDasht[i][j]!.0)
                }
            }
        }
    }
    
    func jnjiView(view:UIView) {
        let arrayView = view.subviews
        for i in arrayView {
            i.removeFromSuperview()
        }
    }
    
    func jnjiImageView (imageView:Xaxaqar,to:(Int,Int)) {
        if imageView.col == to.1 && imageView.row == to.0  {
            imageView.removeFromSuperview()
        }
    }
    
    
    var skzbnakanQariKentrony:CGPoint = CGPoint(x: 0, y: 0)
    var fromCol:Int = 0
    var fromRow:Int = 0
    var toCol:Int = 0
    var toRow:Int = 0
    
    func poxiDasckDasht(rankType:(Rank,PlayerType),to:(Int,Int)) {
        switch (rankType.0,rankType.1) {
        case (.knight,let type):
            if type == .black {
                dasckDasht[to.1][to.0] = (.knight,.black)
                
            }else {
                dasckDasht[to.1][to.0] = (.knight,.white)
            }
            
        case (.pown,let type):
            if type == .black {
                dasckDasht[to.1][to.0] = (.pown,.black)
            }else {
                dasckDasht[to.1][to.0] = (.pown,.white)
            }
        case (.rook,let type):
            if type == .black {
                dasckDasht[to.1][to.0] = (.rook,.black)
            }else {
                dasckDasht[to.1][to.0] = (.rook,.white)
            }
        case (.bishop,let type):
            if type == .black {
                dasckDasht[to.1][to.0] = (.bishop,.black)
            }else {
                dasckDasht[to.1][to.0] = (.bishop,.white)
            }
            
        case (.queen,let type):
            if type == .black {
                dasckDasht[to.1][to.0] = (.queen,.black)
            }else {
                dasckDasht[to.1][to.0] = (.queen,.white)
            }
            
        case (.king,let type):
            if type == .black {
                dasckDasht[to.1][to.0] = (.king,.black)
            }else {
                dasckDasht[to.1][to.0] = (.king,.white)
            }
        }
    }
    
    func test() {
        // TODO: grelTestiMarminy
    }
    
    
    func existFigure(from:(Int,Int),to:(Int,Int)) -> Bool{
        if from.0 == to.0 && from.1 == to.1 {
            return false
        }
        if from.0 == to.0 {
            let minPosition = min(from.1, to.1)
            let maxPosition = max(from.1, to.1)
            
            for i in (minPosition + 1)..<maxPosition {
                if dasckDasht[i][from.0] != nil {
                    print("ka \(i), \(from.0)")
                    return true
                }
            }
        }
        else if from.1 == to.1 {
            let minPosition = min(from.0, to.0)
            let maxPosition = max(from.0, to.0)
            for i in (minPosition + 1)..<maxPosition {
                if dasckDasht[from.1][i] != nil {
                    print("ka \(from.1), \(i)")
                    return true
                }
            }
        }
        else if abs(from.1 - to.1) == abs(from.0 - to.0) {
            let minPositionForCol = min(from.0, to.0)
            let maxPositionForCol = max(from.0, to.0)
            let minPositionForRow = min(from.1, to.1)
            let maxPositionForRow = max(from.1, to.1)
            
            for col in (minPositionForCol + 1)..<maxPositionForCol {
                
                print("petq e stugi \(col ), \(minPositionForRow + 1)")

            }
            for row in (minPositionForRow + 1)..<maxPositionForRow {
                    print("petq e stugi  \(row)")
            }
        }
        
        
        return false
    }
    
    // MARK:sharjumneri Mshakum
    @objc func handlePan(_ sender:UIPanGestureRecognizer) {
        if sender.state == .began || sender.state == .changed {
            let secondViewyiCentre = sender.translation(in: sender.view)
            let  popoxvoxX = (sender.view?.center.x)! + secondViewyiCentre.x
            let popoxvoxY = (sender.view?.center.y)! + secondViewyiCentre.y
            sender.view?.center = CGPoint(x: popoxvoxX, y: popoxvoxY)
            sender.setTranslation(CGPoint.zero, in: sender.view)
        }
        
        if sender.state == .began {
            fromRow = Int(((sender.view?.center.y)! / 100))
            fromCol = Int(((sender.view?.center.x)! / 100))
            dasckDasht[fromRow][fromCol] = nil
            print("from \(fromCol),\(fromRow)")
        }
        
        if sender.state == .ended  {
            toRow = Int(((sender.view?.center.y)! / 100))
            toCol = Int(((sender.view?.center.x)! / 100))
            print("to \(toCol),\(toRow)")
//            #warning("aaaa")
            
            if let xaxaqar = sender.view as? Xaxaqar {
                // FIXME:chanaparhin petq e stugvi urish xaxacox ka te voch
                if xaxaqar.qayl(to: (toCol,toRow)) && dasckDasht[toRow][toCol] == nil && !existFigure(from: (fromCol,fromRow), to: (toCol,toRow))  {
                    sender.view?.center = veradardzruMiQarakusuKentrony(view: secondView, syun: toCol, tox: toRow)
                    poxiDasckDasht(rankType: (xaxaqar.rank,xaxaqar.playerType), to: (toCol,toRow))
                    xaxaqar.col = toCol
                    xaxaqar.row = toRow
                } else {
                    sender.view?.center = veradardzruMiQarakusuKentrony(view: secondView, syun: xaxaqar.col, tox: xaxaqar.row)
                    poxiDasckDasht(rankType: (xaxaqar.rank,xaxaqar.playerType), to: (xaxaqar.col,xaxaqar.row))
                }
                return
            }
        }
    }
    
    
    func veradardzruMiQarakusuKentrony(view:UIView, syun:Int,tox:Int) -> (CGPoint) {
        let dasckiMijiQarakusuWidth = view.bounds.width / syunCount
        let dasckiMijiQarakusuHeight = view.bounds.height / toxCount
        let x = (CGFloat(syun) * dasckiMijiQarakusuWidth) + (dasckiMijiQarakusuWidth / 2)
        let y = (CGFloat(tox) * dasckiMijiQarakusuHeight) + (dasckiMijiQarakusuHeight / 2)
        return CGPoint(x: x, y: y)
    }
    
    func veradardzruFrame(view:UIView, syun:Int,tox:Int) -> (CGRect) {
        let dasckiMijiQarakusuWidth = view.bounds.width / syunCount
        let dasckiMijiQarakusuHeight = view.bounds.height / toxCount
        let x = (CGFloat(syun) * dasckiMijiQarakusuWidth)
        let y = (CGFloat(tox) * dasckiMijiQarakusuHeight)
        
        return CGRect(x: x, y: y,width:dasckiMijiQarakusuWidth ,height: dasckiMijiQarakusuWidth)
    }
    
    
    
    
    var skzbnakanX:CGFloat = 0
    var skzbnakanY:CGFloat = 0
    @IBAction func sharjiFirstViewnPressed(_ sender: UIPanGestureRecognizer) {
        if sender.state == .began || sender.state == .changed {
            let secondViewyiCentre = sender.translation(in: sender.view)
            //            print(secondViewyiCentre)
            let popoxvoxX = (sender.view?.center.x)! + secondViewyiCentre.x
            let popoxvoxY = (sender.view?.center.y)! + secondViewyiCentre.y
            sender.view?.center = CGPoint(x: popoxvoxX, y: popoxvoxY)
            sender.setTranslation(CGPoint.zero, in: sender.view)
        }
        
        let secondViewFrame = secondView.frame
        secondView.backgroundColor = secondViewFrame.intersects((sender.view?.frame)!) ? #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1) : #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        errordView.backgroundColor = errordView.frame.intersects((sender.view?.frame)!) ? #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1) : #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        
        if sender.state == .ended {
            if secondViewFrame.contains((sender.view?.frame)!) {
                sender.view?.center = secondView.center
                sender.view?.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
            }
            if errordView.frame.contains((sender.view?.frame)!) {
                sender.view?.center = errordView.center
                sender.view?.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            }
        }
        if sender.state == .ended && !secondViewFrame.contains((sender.view?.frame)!) && !errordView.frame.contains((sender.view?.frame)!) {
            UIView.animate(withDuration: 0.5) {
                sender.view?.frame.origin.x = self.skzbnakanX
                sender.view?.frame.origin.y = self.skzbnakanY
                sender.view?.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                self.secondView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
                self.errordView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            }
        }
        
        
        
    }
}

//extension UIImage {
//
//    /// Extracts image name from a description.
//    /// * Example description: `<UIImage:0x60000278ce10 named(main: ic_timeline_milestone_bluedot) {16, 16}>`
//    /// * Example name: `ic_timeline_milestone_bluedot`
//    /// - warning: For the debug use only.
//    var name: String? {
//        let description = self.description
//        guard let regexp = try? NSRegularExpression(pattern: "\\(main: (.*)\\)", options: []) else { return nil }
//        guard let match = regexp.matches(in: description, options: [], range: description.fullRange).first else { return nil }
//        guard match.numberOfRanges > 0 else { return nil }
//        let idx1 = description.index(description.startIndex, offsetBy: range.lowerBound)
//        let idx2 = description.index(description.startIndex, offsetBy: range.upperBound)
//        return String(description[idx1..<idx2])
//    }
//}


//        let dashtiKesy = Int(toxCount / 2)
//        for i in 0..<qareriDasht.count {
//            for j in 0..<qareriDasht[i].count {
//
//                if qareriDasht[i][j] == true {
//                    if i > dashtiKesy {
//                        avelacruViewSecondViewMej(view: secondView, syun: j, tox: i, playerType: .white)
//                    }
//                    else {
//                        avelacruViewSecondViewMej(view: secondView, syun: j, tox: i, playerType:  .black)
//
//                    }
//
//                }
//            }
//        }

//        if sender.state == .ended || sender.state == .began{
//            for i in 0..<qareriDasht.count{
//                for j in 0..<qareriDasht[i].count {
//
//                    if (i + j) % 2 == 0  { // ete sev vandaka
//                        if sender.state == .began && (sender.view?.frame.intersects(veradardzruFrame(view: secondView, syun: j, tox: i)))!  {
//                            skzbnakanQariKentrony = veradardzruMiQarakusuKentrony(view: secondView, syun: j, tox: i)
//                            qareriDasht[i][j] = false
//                        }
//
//                        if sender.state == .ended && qareriDasht[i][j] == true && (sender.view?.frame.intersects(veradardzruFrame(view: secondView, syun: j, tox: i)))!  {
//                            qareriDasht[i][j] = true
//
//                            UIView.animate(withDuration: 0.5) {
//                                sender.view?.center = self.skzbnakanQariKentrony
//                                self.qareriDasht[i][j] = true
//
//                            }
//                        }
//
//                        // ete arden qary toxel enq u qary gtnvuma sev vandaki vra  uremn kentrony dir sev vandaki kentronin
//                        if sender.state == .ended && (sender.view?.frame.intersects(veradardzruFrame(view: secondView, syun: j, tox: i)))!  {
//                            UIView.animate(withDuration: 0.5) {
//                                sender.view?.center = self.veradardzruMiQarakusuKentrony(view: self.secondView, syun: j, tox: i)
//                            }
//                            // vortex arden isk gtnvuma qary ed texy sarqi true aysinqn asa vor @tex qar ka
//                            qareriDasht[i][j] = true
//                        }
//                    }
//                    // ete qar@ toxnum enq spitakl vandaki mej
//                    if sender.state == .ended && (i + j) % 2 != 0 && (sender.view?.frame.intersects(veradardzruFrame(view: secondView, syun: j, tox: i)))!{
//                        UIView.animate(withDuration: 0.5) {
//                            // qar@ het ber en tex@ vortexic vor sharjel enq
//                            sender.view?.center = self.skzbnakanQariKentrony
//                        }
//                    }
//
//
//                }
//            }
//            if sender.state == .ended {
//                print(qareriDasht)
//            }
//        }

//        skzbnakanQariKentrony = veradardzruMiQarakusuKentrony(view: secondView, syun: 0, tox: 0)
//        let frame = CGRect(x:  view.bounds.width, y:  view.bounds.height, width: -50, height: -50)
//
//       let newView = UIView(frame: frame)
//        newView.backgroundColor = .black
//        print(newView.frame)
//        print(frame.standardized)
//        self.view.addSubview(newView)
