require_relative('./articulo')
class LineasFactura

  attr_accessor :articulo, :cantidad

  def initialize(articulo,cantidad)
     @articulo = articulo
     @cantidad = cantidad
  end

  def calcularsubtotal
    return @articulo.precio * @cantidad
  end

  def self.comprar(usuarios, articulos,lineas_factura)
    if usuarios.length >= 1
      puts 'Elija los artículos que quiere comprar'
      Articulo.mostrar_articulos(articulos)
      begin
        indices_seleccionados = []
        cantidades_seleccionadas = []
        lineas_factura = []

        puts 'Elija los artículos que quiera comprar según el índice indicado (separados por comas " , ")'
        indices_seleccionados = gets.chomp.split(',')

        indices_seleccionados = indices_seleccionados.map do |indice|
          raise 'Excepcion: Indice de Artículo no es un número válido' unless indice =~ /^\d+$/
          raise 'Excepcion: Índice de Artículo fuera de rango' unless (1..articulos.length).cover?(indice.to_i)
          raise 'Excepcion: Ya seleccionó este índice' if indices_seleccionados.include?(indice.to_i)

          indice.to_i
        end
        articulos_seleccionados = indices_seleccionados.map { |indice| articulos[indice - 1] }
        puts 'Artículos seleccionados:'
        puts '%-10s %-10s %-25s %-10s' % ['Indice', 'Código', 'Denominación', 'Precio Unitario']
        i = 1
        articulos_seleccionados.each do |articulo|
          puts '%-10s %-10s %-25s %-10s' % [i, articulo.codigo, articulo.denominacion, articulo.precio]
          puts 'Selecciones la cantidad a comprar para este articulo'
          cantidad = gets.chomp

          raise 'Excepcion: No es un numero valido' unless cantidad =~ /^\d+$/

          cantidades_seleccionadas << cantidad.to_i

          lineas_factura << LineasFactura.new(articulo, cantidad.to_i)

          i += 1
        end
        puts 'Articulos a Comprar'
        puts '%-10s %-10s %-10s %-10s %-10s %-10s' % ['Indice', 'Código', 'Denominación', 'Precio Unitario', 'Cantidad', 'Subtotal']
        i = 1
        lineas_factura.each do |linea|
        subtotal = linea.calcularsubtotal
        puts '%-10s %-10s %-10s %-10s %-10s %-10s' % [i, linea.articulo.codigo, linea.articulo.denominacion, linea.articulo.precio, linea.cantidad, subtotal]
        i += 1
      end

      return lineas_factura

      rescue StandardError => e
        puts "Error: #{e.message}. Intente de nuevo."
        retry
      end
    else
      puts 'Primero debe registrar un usuario'
      return []
    end
  end

  def self.imprimir_lineasfactura(lineas_factura)
    puts '%-10s %-10s %-15s %-15s %-10s %-10s' % ['Indice', 'Código', 'Denominación', 'Precio Unitario', 'Cantidad', 'Subtotal']

    i = 1
    lineas_factura.each do |linea|
      subtotal = linea.calcularsubtotal
      puts '%-10s %-10s %-15s %-15s %-10s %-10s' % [i, linea.articulo.codigo, linea.articulo.denominacion, linea.articulo.precio, linea.cantidad, subtotal]
      i += 1
    end
  end

end
