import Foundation

/*
 課題
勇者、戦士クラスで似たような処理を人クラスを作り共通化させてください
またnameパラメータをfileprivateを使ってカプセル化して下の(*1)がエラーになるようにしてください
 変わりに(*2)で初期化パラメータを入れてnameを決定してください
 */

class Yusha {
    var hp: Int = 10
    var mp: Int = 10
    var name: String = ""

    func attackKen() {
        print("\(name)は剣で攻撃")
    }

    func attackMaho() {
        print("\(name)は魔法で攻撃")
    }
}

class Senshi {
    var hp = 10
    var name: String = ""

    func attackKen() {
        print("戦士は剣で攻撃")
    }
}

//(*2)
let senshi = Senshi()
let yusha = Yusha()

//(*1)
senshi.name = "浜田"
yusha.name = "松本"


senshi.attackKen()
yusha.attackMaho()
