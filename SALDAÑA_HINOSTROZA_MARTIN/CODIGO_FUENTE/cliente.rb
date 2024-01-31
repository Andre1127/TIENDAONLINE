class Cliente

 attr_accessor :dni, :nombre, :apellidos

 def initialize(dni,nombre,apellidos)
   @dni = dni
   @nombre = nombre
   @apellidos = apellidos
 end

 def self.obtener_datos_personales
  puts 'Ingrese su nombre:'
  nombre = gets.chomp

  puts 'Ingrese sus apellidos:'
  apellidos = gets.chomp

  dni = validar_dni

  Cliente.new(dni, nombre, apellidos)
 end

 def self.validar_dni

  loop do
    puts 'Ingrese su DNI:'
    dni = gets.chomp

    return dni if dni.match?(/^\d{8}$/)

    puts 'DNI no válido. Debe tener exactamente 8 números. Intente de nuevo.'
  end
 end

 def self.registrar_cliente(clientes_registrados)
  if clientes_registrados.length >= 1
    puts 'Ya se ha registrado el máximo de clientes (1).'
  else
    nuevo_cliente = obtener_datos_personales
    clientes_registrados << nuevo_cliente
    puts 'Cliente registrado correctamente.'
  end

  clientes_registrados

 end

 def self.mostrar_clientes_registrados(clientes_registrados)
  puts 'Clientes registrados:'
  puts '%-10s %-20s %-20s %-10s' % ['Índice', 'Nombre', 'Apellidos', 'DNI']
  i = 1
  clientes_registrados.each do |usuario|
    puts '%-10s %-20s %-20s %-10s' % [i, usuario.nombre, usuario.apellidos, usuario.dni]
    i += 1
  end
 end

 def self.imprimir_cliente(clientes_registrados)

  clientes_registrados.each do |usuario|
    puts "Cliente: #{usuario.nombre}, #{usuario.apellidos}"
    puts "DNI: #{usuario.dni}"

  end
 end

end
