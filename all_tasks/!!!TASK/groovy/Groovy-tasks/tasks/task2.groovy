def mulEvenOdd(list) {
    def result = []
    for (i in list) {
        if (i %2 == 0){
            result.add(i*2)
        }
        else {
            result.add(i*3)
        }
    }
    return result
}
return this
