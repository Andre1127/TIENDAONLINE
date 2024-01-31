require_relative('./cliente')
require_relative('./articulo')
require_relative('./factura')
require_relative('./lineasfactura')

articulo1 = Articulo.new('A001', 'Camiseta', 20.0)
articulo2 = Articulo.new('A002', 'Pantalón', 30.0)
articulo3 = Articulo.new('A003', 'Sudadera', 25.0)
articulo4 = Articulo.new('A004', 'Vaqueros', 40.0)
articulo5 = Articulo.new('A005', 'Zapatos deportivos', 50.0)
articulo6 = Articulo.new('A006', 'Chaqueta de cuero', 80.0)
articulo7 = Articulo.new('A007', 'Bufanda', 15.0)
articulo8 = Articulo.new('A008', 'Gorra', 12.0)
articulo9 = Articulo.new('A009', 'Calcetines', 8.0)
articulo10 = Articulo.new('A010', 'Vestido elegante', 60.0)
articulo11 = Articulo.new('A011', 'Corbata', 18.0)
articulo12 = Articulo.new('A012', 'Sombrero de ala ancha', 45.0)
articulo13 = Articulo.new('A013', 'Gafas de sol', 30.0)
articulo14 = Articulo.new('A014', 'Reloj de pulsera', 100.0)
articulo15 = Articulo.new('A015', 'Mochila', 35.0)
articulo16 = Articulo.new('A016', 'Guantes de lana', 10.0)
articulo17 = Articulo.new('A017', 'Bolso de mano', 25.0)
articulo18 = Articulo.new('A018', 'Gorra de lana', 15.0)
articulo19 = Articulo.new('A019', 'Collar elegante', 35.0)
articulo20 = Articulo.new('A020', 'Paraguas plegable', 18.0)


articulos =
[
  articulo1, articulo2, articulo3, articulo4, articulo5,
  articulo6, articulo7, articulo8, articulo9, articulo10,
  articulo11, articulo12, articulo13, articulo14, articulo15,
  articulo16, articulo17, articulo18, articulo19, articulo20
]
usuarios = []
lineas_factura = []
factura = []
i = 0

loop do
  puts 'Menú de opciones:'
  puts '1. Registrar cliente'
  puts '2. Mostrar clientes registrados'
  puts '3. Mostrar lista de articulos'
  puts '4. Comprar'
  puts '5. Imprimir factura'
  puts '10. Salir'

  opcion = gets.chomp.to_i

  case opcion
  when 1
    Cliente.registrar_cliente(usuarios)
  when 2
    Cliente.mostrar_clientes_registrados(usuarios)
  when 3
    Articulo.mostrar_articulos(articulos)
  when 4
    lineas_factura = LineasFactura.comprar(usuarios, articulos, lineas_factura)

    if lineas_factura.any?
      factura= Factura.new(i+1, usuarios, lineas_factura)
      i += 1
    else
      puts 'No hay líneas de factura para imprimir.'
    end

    subopcion = 0

    while subopcion != 3
      puts "\nSubmenú de opciones de líneas de factura:"
      puts '1. Agregar línea de factura'
      puts '2. Eliminar línea de factura'
      puts '3. Volver al menú principal'
      subopcion = gets.chomp.to_i

      case subopcion
      when 1
        puts 'Ingrese el índice del artículo que desea agregar:'
        indice_articulo = gets.chomp.to_i
        puts 'Ingrese la cantidad:'
        cantidad = gets.chomp.to_i

        if (1..articulos.length).cover?(indice_articulo)
          factura.agregar_linea(articulos[indice_articulo - 1], cantidad)
          puts 'Línea de factura agregada con éxito.'
        else
          puts 'Índice de artículo no válido.'
        end
      when 2
        puts 'Ingrese el índice de la línea de factura que desea eliminar:'
        indice_linea = gets.chomp.to_i

        if (1..factura.lineas.length).cover?(indice_linea)
          factura.eliminar_linea(factura.lineas[indice_linea - 1])
          puts 'Línea de factura eliminada con éxito.'
        else
          puts 'Índice de línea de factura no válido.'
        end
      when 3
        puts 'Volviendo al menú principal.'
      else
        puts 'Opción no válida. Intente de nuevo.'
      end
    end
  when 5
    if factura.nil?
      puts 'No hay factura para imprimir. Realice una compra primero.'
    else
      factura.imprimirfactura
    end
  when 10
    puts 'Saliendo del programa.'
    break
  else
    puts 'Opción no válida. Intente de nuevo.'
  end
end
