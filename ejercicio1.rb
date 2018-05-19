class Table
  attr_reader :nombre, :dia1, :dia2, :dia3, :dia4
  def initialize (nombre="", dia1=0, dia2=0, dia3=0, dia4=0)
    @nombre = nombre.to_s
    @dia1 = dia1.to_i
    @dia2 = dia2.to_i
    @dia3 = dia3.to_i
    @dia4 = dia4.to_i
  end

  def creaMesa ()
    mesas = []

    file = File.open('casino.txt', 'r')
    data = file.readlines
    file.close

    data.each do |mesa|
      mesas << Table.new(*(mesa.split(', ')))
    end

    mesas[0].conocerMayor(mesas)
    mesas[0].promedio(mesas)
  end


  def conocerMayor (arreglo)
    arr_max = [[0, 0], [0, 0], [0, 0],[0, 0]]
    i_arr_max = 0

    arreglo.each do |mesa|
      arr = [mesa.dia1, mesa.dia2, mesa.dia3, mesa.dia4]
      max_mesa = 0
      max_indice = 0
      arr.each_with_index {|v, i|
        if v > max_mesa
          max_mesa = v
          max_indice = i
        end
        }
      arr_max[i_arr_max] = [max_mesa, max_indice]
      i_arr_max += 1
    end

    indice_maximo_mesas = 0
    indice_aux = 0
    max_aux = 0

    arr_max.each do |x|
      if x[0] > max_aux
        max_aux = x[0]
        indice_maximo_mesas = indice_aux
      end
      indice_aux += 1
    end

    case indice_maximo_mesas
    when 0
      puts "El mayor valor recaudado corresponde a la mesa 1, al día #{arr_max[0][1] + 1} con monto #{arr_max[0][0]}"
    when 1
      puts "El mayor valor recaudado corresponde a la mesa 2, al día #{arr_max[1][1] + 1} con monto #{arr_max[1][0]}"
    when 2
      puts "El mayor valor recaudado corresponde a la mesa 3, al día #{arr_max[2][1] + 1} con monto #{arr_max[2][0]}"
    when 3
      puts "El mayor valor recaudado corresponde a la mesa 4, al día #{arr_max[3][1] + 1} con monto #{arr_max[3][0]}"
    end

  end

  def promedio (arreglo)
    sum = 0
    divisor = 0.0
    arreglo.each do |mesa|
      sum += mesa.dia1 + mesa.dia2 + mesa.dia3 + mesa.dia4
      divisor += 4
    end
    prom = sum / divisor
    puts "El promedio es #{prom}"

  end
end

#############################################################################33



#creaMesa()

mesa = Table.new()
mesas = mesa.creaMesa()
