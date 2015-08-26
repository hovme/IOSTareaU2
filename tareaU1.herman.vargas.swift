//: Playground - noun: a place where people can play

import UIKit
// Se crea la clase ingrediente
class Ingrediente{
    // se generan atributos
    var idIngrediente : Int
    var nombreIn : String
    var precioIn : Int
    var disponible : Bool
    // se inicializan las variables
    init(idIngrediente:Int, nombreIn:String, precioIn:Int, disponible:Bool){
        self.idIngrediente = idIngrediente
        self.nombreIn = nombreIn
        self.precioIn = precioIn
        self.disponible = disponible
    }
}
// se generan los ingredientes con los preciosa para cada uno
let pollo = Ingrediente (idIngrediente:1, nombreIn:"Pollo", precioIn:500, disponible:true)
let pimenton = Ingrediente (idIngrediente:2, nombreIn:"Pimenton", precioIn:200, disponible:true)
let tomate = Ingrediente (idIngrediente:3, nombreIn:"Tomate", precioIn:150, disponible:true)
let churrasco = Ingrediente (idIngrediente:4, nombreIn:"Churrasco", precioIn:600, disponible:true)
let mechada = Ingrediente (idIngrediente:5, nombreIn:"Mechada", precioIn:700, disponible:false)
let mayonesa = Ingrediente (idIngrediente:6, nombreIn:"Mayonesa", precioIn:100, disponible:true)

// se crea la clase Plato
class Plato{
    // se generan atributos
    var idPlato: Int
    var nombrePl:String
    var tipoPlato:String
    var ingredientes: [(ingredientes:Ingrediente, cantidad:Int)] // se crea atributo Ingrediente de tipo Arreglo con 2 atributos, un objeto ingredientes de tipo Ingrediente y la cantidad
    // se inicializan los atributos * los ingredientes de tipo Array
    init(idPlato:Int, nombrePl:String, tipoPlato:String, ingredientes: Array<(ingredientes:Ingrediente, cantidad:Int)>){
        self.idPlato = idPlato
        self.nombrePl = nombrePl
        self.tipoPlato = tipoPlato
        self.ingredientes = ingredientes
       
    }
    // se genera metodo para devolver nombre
    func getNombre() -> String{
        return nombrePl
    }
}

class Pedido{
    var idPedido: Int
    var platos: [(plato:Plato, precio:Int)]
    
    init(idPedido:Int, platos: Array<(plato:Plato, precio:Int)>){
        self.idPedido = idPedido
        self.platos = platos
    }
}



// se crean los sandwich de otra forma

let sandwich1 = Plato(idPlato: 1, nombrePl: "El constructor sobrecargado", tipoPlato:"Sandwich", ingredientes:[(pollo, 1),(pimenton, 2),(mayonesa, 2)])

let sandwich2 = Plato(idPlato: 1, nombrePl: "La variable loca", tipoPlato: "Sandwich", ingredientes: [(pollo,1),(mechada,2),(pimenton,2)])

let sandwich3 = Plato(idPlato: 1, nombrePl: "El harrison For", tipoPlato: "Sandwich", ingredientes: [(mechada,1),(tomate,2),(pimenton,2)])

let Sanguches:[Plato] = [sandwich1, sandwich2, sandwich3]
println(" Menu: ")
println(" ---------- ")

var precioPedido = 0

for Plato in Sanguches{
    var disponibilidad:Bool = true
    
    println("Sanguche: " + String(Plato.nombrePl))
    println("Ingredientes:  ")
    var precio:Int = 0
    for tuple in Plato.ingredientes{
        println(String(tuple.ingredientes.nombreIn) + ": $" + String(tuple.ingredientes.precioIn))
        precio = precio + tuple.ingredientes.precioIn
        if !tuple.ingredientes.disponible{
            disponibilidad = false
        }
    }
    println("El precio del Sanguche es: $" + String(precio))
    if disponibilidad{
        println("El sanguche esta disponible")
    }else{
        println("El sanguche NO esta disponible")
    }
    println(" ")
    precioPedido = precioPedido + precio
}
    println("El precio del pedido es: $" + String(precioPedido))

