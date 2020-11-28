import Foundation

/*
 課題
勇者、戦士クラスで似たような処理を人クラスを作り共通化させてください
またnameパラメータをfileprivateを使ってカプセル化して下の(*1)がエラーになるようにしてください
 変わりに(*2)で初期化パラメータを入れてnameを決定してください
 */

// 人クラスの定義。勇者と戦士の共通項目を設定する。
class Human {
//    各プロパティの型定義
    fileprivate var name: String //flieprivateであれば同一ファイル内からのアクセスが可能。func attackMaho()からアクセスしたい。
    private var hp: Int
//    勉強のためイニシャライザを使用して初期値設定しているが、[var name = "初期値"]などと書くのの違いはよく分かっていない
    
//    イニシャライザを用いて初期値を設定する(インスタンスの初期化ともいう？)
    init(name: String, hp: Int) {
        self.name = name
        self.hp = hp
//        =以降のhp/nameは引数のシンボルを意味していると考えている
//        指定イニシャライザというらしい
    }
    
//    共通メソッドの定義
    func attackKen() {
        print("\(name)は剣で攻撃")
    }
    
}


// 勇者クラスはHumanクラスを継承している。:の後にスーパークラス名を記述する。
class Yusha: Human {
//    勇者クラス専用のプロパティを定義
    private var mp: Int
    
//    インスタンスの初期化を行う。hp/mpはインスタンス生成時のデフォルト値を10としている。
    init(name: String, hp: Int = 10, mp: Int = 10) {
        self.mp = mp
//        新たに定義されたプロパティの初期化
        super.init(name: name, hp: hp)
//        スーパークラスの指定イニシャライザを実行
    }
    
//    勇者クラス専用のメソッドを定義
    func attackMaho() {
        print("\(name)は魔法で攻撃")
    }
    
}


// 戦士クラス
class Senshi: Human {
    override init(name: String, hp: Int = 20) {
        super.init(name: name, hp: hp)
//      イニシャライザがスーパークラスと全く同一なのでオーバーライド記載必要。
    }
}


// Yushaクラスのyusha1インスタンスを生成。nameプロパティのみ値を指定している。hp/mpはデフォルトの設定をしているので値を渡さなくてもよい。
let yusha1 = Yusha(name: "ダイ")
// Yushaクラスのyusha2インスタンスを生成。所有する全てのプロパティに値を指定している。
let yusha2 = Yusha(name: "アバン", hp: 80, mp: 50)
let senshi = Senshi(name: "ヒュンケル")

yusha1.attackKen()
yusha2.attackMaho()
senshi.attackKen()
// senshi.attackMaho() ...// Value of type 'Senshi' has no member 'attackMaho'
