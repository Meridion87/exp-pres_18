require 'date'

class Course
  attr_reader :nombre, :fecha_inicio, :fecha_termino
  def initialize (nombre, fecha_inicio, fecha_termino)
    @nombre = nombre
    @fecha_inicio = Date.parse fecha_inicio
    @fecha_termino = Date.parse fecha_termino
  end

  def creaCursos ()
    file = File.open('cursos.txt', 'r')
    data = file.readlines
    file.close
    cursos = []

    data.each do |c|
      elem_curso = c.split(', ')
      cursos << Course.new(*elem_curso)
    end
    return cursos
  end

  def cursosAntesFecha(arr_curso, fecha = Date.today)
    list_cursos = []
    arr_curso.each do |c|
      list_cursos << c.nombre if c.fecha_inicio < Date.parse(fecha)
    end
    respuesta = ""
    if list_cursos.length == 0
      respuesta = "No hay ningún curso que comiece antes de la fecha indicada"
    else
      respuesta = "Los cursos que comienzan antes de la fecha indicada son: "
      indice = 0
      list_cursos.each do |nombre|
        if indice != list_cursos.length-1
          respuesta += "#{nombre}, "
        else
          respuesta += "#{nombre}"
        end
        indice += 1
      end
    end
    puts respuesta
  end

  def cursosPosteriorFecha(arr_curso, fecha = Date.today)
    list_cursos = []
    arr_curso.each do |c|
      list_cursos << c.nombre if c.fecha_termino > Date.parse(fecha)
    end
    respuesta = ""
    if list_cursos.length == 0
      respuesta = "No hay ningún curso que termine después de la fecha indicada"
    else
      respuesta = "Los cursos que comienzan antes de la fecha indicada son: "
      indice = 0
      list_cursos.each do |nombre|
        if indice != list_cursos.length-1
          respuesta += "#{nombre}, "
        else
          respuesta += "#{nombre}"
        end
        indice += 1
      end
    end
    puts respuesta
  end


end

curso = Course.new('abc', '2000-01-01', '2001-12-31')
arr_cursos = curso.creaCursos
curso.cursosAntesFecha(arr_cursos, '2019-01-01')
curso.cursosPosteriorFecha(arr_cursos, '2016-01-01')


# curso = Course.new('Front-end', '2017-05-21', '2017-08-10')
# print curso
