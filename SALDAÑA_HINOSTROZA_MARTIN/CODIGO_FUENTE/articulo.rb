require_relative('./cliente')
require_relative('./lineasfactura')

class Articulo

  attr_accessor :codigo, :denominacion, :precio

  def initialize(codigo, denominacion, precio)
    @codigo = codigo
    @denominacion = denominacion
    @precio = precio
  end

  def self.mostrar_articulos(articulos)
    puts 'Lista de Articulos'
    puts '%-10s %-10s %-25s %-10s' % ['Indice','Código', 'Denominación', 'Precio Unitario']
    i = 1
    articulos.each do |articulo|
      puts '%-10s %-10s %-25s %-10s' % [i,articulo.codigo,articulo.denominacion,articulo.precio]
      i += 1
    end
  end

end
