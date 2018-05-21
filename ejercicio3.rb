r = (1..10).to_a

class Roulette

  def play (num, arr)
    azar = rand(0..(arr.length-1))
    num_azar = arr[azar]
    almacena_num(num_azar)
    if num == num_azar
      almacena_ganador(num_azar)
      puts "Ha acertado"
    else
      puts "No ha acertado"
    end
  end

  def almacena_num (num)
    file = File.open('roulette_history.txt', 'a')
    file.puts num
    file.close
  end

  def almacena_ganador (num)
    file = File.open('winners.txt', 'a')
    file.puts num
    file.close
  end

  def mayor_freq ()
    file = File.open('roulette_history.txt', 'r')
    data = file.readlines
    file.close

    data = data.map {|x| x.to_i}

    freq = data.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    max_freq = data.max_by { |v| freq[v] }

    puts "El número con mayor frecuencia es #{max_freq}"
  end
end

def menu (r)
  puts "Ingrese un número entre 1 y 10"
  num_usr = gets.chomp.to_i
  if (num_usr >= 1 and num_usr <= 10)
    ruleta = Roulette.new()
    ruleta.play(num_usr, r)
    ruleta.mayor_freq()
  else
    puts "Ingrese un número válido"
    menu()
  end
end

menu(r)
