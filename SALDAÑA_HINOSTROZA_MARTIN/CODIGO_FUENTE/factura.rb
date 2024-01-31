require_relative('./lineasfactura')
require_relative('./articulo')
class Factura

  attr_accessor :numero, :cliente, :lineas

  def initialize(numero,cliente,lineas)
    @numero = numero
    @cliente = cliente
    @lineas = lineas
  end

  def calcularmontototal
    return @lineas.map{|linea| linea.calcularsubtotal}.sum
  end

  def agregar_linea(articulo, cantidad)
    linea = LineasFactura.new(articulo, cantidad)
    @lineas << linea
  end

  def eliminar_linea(linea)
    @lineas.delete(linea)
  end

  def imprimirfactura
    puts '******************************************************************'

    puts "Factura Nº F#{@numero}"

    puts ' '
    Cliente.imprimir_cliente(@cliente)
    puts '******************************************************************'
    puts ' '
    puts 'Detalle'
    LineasFactura.imprimir_lineasfactura(@lineas)
    puts "TOTAL: #{calcularmontototal}"

    puts '******************************************************************'

  end
end
