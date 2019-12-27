import groovy.json.JsonSlurper
import groovy.json.JsonOutput
def parseAndFilterJson(people) {
    def res_people = [:]
    JsonSlurper slurper = new JsonSlurper()
    Map new_people = slurper.parseText(people)
    new_people.each { name, age ->
        sum = 0
        age.toString().split("").each { sum += it.toInteger() }
        if (sum == 9) {
            res_people.put(name, age)
        }
    }
    return JsonOutput.toJson(res_people)
}
return this
