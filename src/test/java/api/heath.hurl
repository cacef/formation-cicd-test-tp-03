GET http://host.docker.internal:8080/health
HTTP 200
[Asserts]
header "Content-Type" contains "application/json"
jsonpath "$.status" == "UP"

GET http://host.docker.internal:8080/api/orders
HTTP 200
[Asserts]
header "Content-Type" contains "application/json"
jsonpath "$" isCollection
jsonpath "$" count == 2
jsonpath "$[0].id" == 1
jsonpath "$[0].product" == "Laptop"
jsonpath "$[0].price" == 1200.0
jsonpath "$[1].id" == 2
jsonpath "$[1].product" == "Mouse"
jsonpath "$[1].price" == 25.0

GET http://host.docker.internal:8080/
HTTP 200
[Asserts]
xpath "string(//title)" == "Mini API"
xpath "string(//h1)" == "Mini API Server"