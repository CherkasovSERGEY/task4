=begin
class TrainКласс Train (Поезд):
Имеет номер (произвольная строка) и тип (грузовой, пассажирский)
и количество вагонов, эти данные указываются при создании экземпляра класса
Может набирать скорость
Может возвращать текущую скорость
Может тормозить (сбрасывать скорость до нуля)
Может возвращать количество вагонов
Может прицеплять/отцеплять вагоны (по одному вагону за операцию,
метод просто увеличивает или уменьшает количество вагонов). Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
Может принимать маршрут следования (объект класса Route).
При назначении маршрута поезду, поезд автоматически помещается
на первую станцию в маршруте.
Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только на 1 станцию за раз.
Возвращать предыдущую станцию, текущую, следующую, на основе маршрута
  attr_reader :speed, :amount_wagons
=end
  def initialize(number, type, amount_wagons = 0)
    @number = number
    @type = type
    @amount_wagons = amount_wagons
    @speed = 0
  end

  def increase_speed(speed)
    @speed += speed
  end

  def stop
    @speed = 0
  end

  def attach_wagon
    @amount_wagons += 1 if @speed.zero?
  end

  def detach_wagon
    @amount_wagons -= 1 if @speed.zero? && @amount_wagons > 0
  end

  def set_route(route)
    @route = route
    @index_current_station = 0
  end

  def move_forward
    @index_current_station += 1 if @route.stations.size - 1 > @index_current_station
  end

  def move_backward
    @index_current_station -= 1 unless @index_current_station.zero?
  end

  def previous_station
    get_station_by_index @index_current_station - 1
  end

  def current_station
    get_station_by_index @index_current_station
  end

  def next_station
    get_station_by_index @index_current_station + 1
  end

  def get_station_by_index(index)
    return nil if index < 0

    @route.stations[index]
  end
end
