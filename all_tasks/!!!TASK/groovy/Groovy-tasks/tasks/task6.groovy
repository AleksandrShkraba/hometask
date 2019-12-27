def adults(people) {
    result = [:]
    people.each { name, age ->
        if (age > 17) {
            result.put(name, age)
        }
    }
    return result
}
return this
