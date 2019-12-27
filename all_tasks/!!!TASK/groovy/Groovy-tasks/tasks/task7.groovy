def encryptThis(str){
    def a = []
    b = str.split(" ")
    for (i in b)
    {
        a.add((int)i[0]+i[-1]+i[2..-2]+i[1])
    }
    return a.join(" ")
}
return this
