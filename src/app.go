package main
import "fmt"
func main() {
    fmt.Print("Your name: ")
    var input string
    fmt.Scanln(&input)
    fmt.Println("Hello world " + input)
}