//: Playground - noun: a place where people can play

struct Array2D<T> {
    ///　行数
    let rows: Int
    ///　列数
    let columns: Int
    
    /// 二次元配列の行優先で格納した一次元配列
    private var array: [T?]
    
    ///行と列を指定して、新規インスタンスを構築する
    init(rows: Int, columns: Int, repeatedValue: T? = nil) {
        self.rows = rows
        self.columns = columns
        self.array = Array<T?>(count: rows * columns, repeatedValue: repeatedValue)
    }
    
    
    //行番号と列番号を指定して、二次元配列中の要素を取得する
    subscript(row: Int, column: Int) -> T? {
        get {
            if row < 0 || self.rows <= row || column < 0 || self.columns <= column {
                return nil
            }
            let idx = row * self.columns + column
            return self.array[idx]
        }
        set(newValue) {
            self.array[row * self.columns + column] = newValue
        }
    }
}

var a2d = Array2D<String>(rows: 5, columns: 5, repeatedValue: "")
a2d[1, 2] = "AAA"
a2d[3, 4] = "AAA"
a2d[1, 2]
a2d[3, 4]
a2d[3, 7]

func countString(cells:Array2D<String>,target: String) -> Int {
    var count = 0
    for i in 0..<cells.rows {
        for j in 0..<cells.columns {
            if let s = cells[i, j] {
                if s == target {
                    count++
                }
            }
        }
    }
    
    return count
}