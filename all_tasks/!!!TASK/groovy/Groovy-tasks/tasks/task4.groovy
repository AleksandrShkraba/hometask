def fib(n) {
    def a = 0, b= 1;
    n.times{
        (a,b) = [b,a+b]
    }
    a
}
return this
