def gstring(String str, int number) {
    a = "1() 2() 3()"
    if (number == 1){
        a = "1(${str}) 2() 3()"
    }
    else if (number == 2) {
        a = "1() 2(${str}) 3()"}
    else if (number == 3) {
        a = "1() 2() 3(${str})"}
    return a
}
return this
