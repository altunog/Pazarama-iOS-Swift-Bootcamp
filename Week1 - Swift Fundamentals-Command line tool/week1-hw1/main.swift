//
//  main.swift
//  week1-hw1
//
//  Created by Oğuz Kaan Altun on 22.09.2022.
//

import Foundation

// Poke-Mall App

// append Seller accounts data into User.users array
User.users.append(contentsOf: [ash, proffessorOak, misty, brock, gary])

// user commands will be stored in userInput
var userInput: String? = ""

// custom function for user inputs.
// gets command with readLine(), unwraps and checks if valid then returns as lowercased string
func input(for phrase: String? = nil) -> String {
    if let phrase = phrase {
        // print a custom sentence before asking for input
        print("Enter \(phrase): ", terminator: "")
    } else {
        // print default sentence before asking for input
        print("Enter a command: ", terminator: "")
    }
    userInput = readLine()
    guard let userInput = userInput else {
        print("Invalid input. Try again.")
        return input(for: phrase)
    }
    return userInput.lowercased()
}

// login function for existing users
// returns User object if username and password matches with one of the existing users'
func logIn() -> User {
    print("\n--- LOG IN ---")
    let username = input(for: "username")
    let password = input(for: "password")
    let userLoggingIn = User.users.first { existingUser in
        existingUser.username == username && existingUser.password == password
    }
    
    if let user = userLoggingIn {
        return user
    } else {
        print("Invalid username or password. Try again.")
        return logIn()
    }
}

// while a new account is being created, checks if username available
 func checkUsernameAvailable(for newUsername: String) -> Bool {
    let isUsernameExist = User.users.contains { $0.username == newUsername }
    return !isUsernameExist
}

// creates a new account, appends to User.users array
// returns newly created User object
func createUserAccount() -> User {
    print("\n--- CREATE ACCOUNT ---")
    var username = input(for: "username")
    while !checkUsernameAvailable(for: username) {
        print("The username is taken. Try another!")
        username = input(for: "new username")
    }
    let password = input(for: "password")
    let age = Int(input(for: "your age"))!
    let gender = Gender(rawValue: input(for: "your gender (male | female)"))!
    let job = JobType(rawValue: input(for: "your job (trainer | gym leader | officer | nurse)"))!

    let newUser = User(username: username, password: password, age: age, gender: gender, job: job)
    User.users.append(newUser)
    return newUser
}

func filterAvailablePokemons(for jobOfCurrentUser: JobType, using pokemons: [Pokemon]) -> [Pokemon] {
    let filteredPokemons = pokemons.filter { pokemon in
        pokemon.suitableJobs.contains(jobOfCurrentUser)
    }
    return filteredPokemons
}

func printPokemonList(of availablePokemons: [Pokemon]) {
    print("\n--- SHOP ---")
    print("#\tPokemon")
    for (index, pokemon) in availablePokemons.enumerated() {
        print("\(index+1).\t\(pokemon.name)")
    }
    print("\n")
}

func printPokemonDetails(of selectedPokemon: Pokemon) {
    let name = selectedPokemon.name
    let hp = selectedPokemon.hp
    let attack = selectedPokemon.attack
    let type = selectedPokemon.type
    let rating = selectedPokemon.rating
    let price = selectedPokemon.price
    let stock = selectedPokemon.numberOfStock
    let comments = selectedPokemon.comments
    print("\n--- DETAILS ---")
    print("Pokemon: \(name.uppercased())")
    print("Type: \(type.rawValue.uppercased())")
    print("HP: \(hp)\tAttack: \(attack)")
    print("Rating: \(rating) star(s)")
    print("Price: ₺\(price)")
    print("Stock: \(stock) left.")
    print("Seller: \(selectedPokemon.seller.username)")
    print("Comments:")
    for comment in comments {
        print("‣ '\(comment.content)' - \(comment.username)")
    }
    print("\n")
}

func printFavoritesList(of user: User) {
    print("\n--- FAVORITE POKEMONS ---")
    for fav in user.favorites {
        print("- \(fav.name.uppercased())")
    }
}

func printCartList(of user: User) {
    print("\n--- CART ---")
    for item in user.itemsInCart {
        print("- \(item.name.uppercased()), ₺\(item.price)")
    }
}

func printPaymentMethodsList(of user: User) {
    print("\n--- PAYMENT METHODS ---")
    print("#.\tMethod")
    for (index, method) in user.paymentMethods.enumerated() {
        print("\(index+1).\t\(method.methodType) - \(method.methodID)")
    }
}

func addToUserCart(pokemon: Pokemon, user: User) {
    if pokemon.isInStock {
        user.addToCart(pokemon)
        print("\n\(pokemon.name.uppercased()) is added to your cart.")
    }
}

func addToUserFavorites(pokemon: Pokemon, user: User) {
    user.addToFavorites(pokemon)
    print("\n\(pokemon.name.uppercased()) is added to your favorites.")
}

func addToUserPaymentMethods(user: User) {
    print("\n--- ADD PAYMENT METHOD ---")
    let methodType = PaymentMethod.PaymentMethodType(rawValue: input(for: "a method (pokedexcard | pokeballs)"))!
    let methodID = Int(input(for: "method's ID"))!
    user.addPaymentMethod(methodType: methodType, methodID: methodID)
    print("Payment method is added to your account.")
}

func checkForBalance(of paymentMethod: PaymentMethod, for cart: [Pokemon]) -> Bool {
    print("Checking for pokedexcard's balance...")
    let totalCostOfCart = cart.reduce(0) { $0 + $1.price }
    if paymentMethod.balance >= totalCostOfCart {
        print("✅ You have enough balance in your pokedexcard!")
        return true
    } else {
        print("⛔️ Not enough balance for the transaction.")
        return false
    }
}

func checkout(user: User) {
    if user.paymentMethods.isEmpty {
        print("You have to add a payment method.")
        addToUserPaymentMethods(user: user)
        return checkout(user: user)
    } else {
        printPaymentMethodsList(of: user)
        let methodIndex = Int(input(for: "an index number to select or a payment method, (0) to add new payment method"))!
        if methodIndex == 0 {
            addToUserPaymentMethods(user: user)
            return checkout(user: user)
        }
        let selectedMethod = user.paymentMethods[methodIndex-1]
        if selectedMethod.isOnline { // online payment with pokedexcard
            if checkForBalance(of: selectedMethod, for: user.itemsInCart) {
                user.updateBalance(paymentMethodID: selectedMethod.methodID, amount: user.itemsInCart.reduce(0) { $0 + $1.price })
                print("🥳 Payment successful!\nYour order is preparing.")
            } else { // not enough balance
                print("You need to use another payment method.")
                return checkout(user: user)
            }
        } else { // pay at the door with pokeballs
            print("🥳 Your order is successfully created and is preparing.")
            print("🤝 Make sure you have enough pokeballs when it arrives.")
        }
    }
}


// MARK: - Begin
print("(create) - Create a new account")
print("(login) - Log in")
print("(add fav) - Add to favorites")
print("(add cart) - Add to cart")
print("(checkout) - Proceed to checkout")
print("(back) - Back to shop")
print("(quit) - Quit")
print("\n*** WELCOME TO POKE-MALL ***\n")
print("Use keywords for navigation.")
userInput = input()
while userInput != "quit" {
    let user: User
    if userInput == "login" {
        user = logIn()
    } else if userInput == "create" {
        user = createUserAccount()
    } else {
        break
    }
    var isLoggedIn = true
    while isLoggedIn {
        let availablePokemons = filterAvailablePokemons(for: user.job, using: pokemons)
        printPokemonList(of: availablePokemons)
        
        userInput = input(for: "an index number for details or a command")
        if let unwrappedUserInput = userInput {
            if let pokemonIndex = Int(unwrappedUserInput) {
                let selectedPokemon = availablePokemons[pokemonIndex-1]
                printPokemonDetails(of: selectedPokemon)
                switch input() {
                case "back":
                    continue
                case "add fav":
                    addToUserFavorites(pokemon: selectedPokemon, user: user)
                case "add cart":
                    addToUserCart(pokemon: selectedPokemon, user: user)
                default:
                    continue
                }
            } else {
                //userInput = input()
                switch unwrappedUserInput {
                case "list fav":
                    printFavoritesList(of: user)
                case "list cart":
                    printCartList(of: user)
                case "checkout":
                    checkout(user: user)
                case "logout":
                    isLoggedIn = false
                default:
                    continue
                }
            }
        }
    }
}



