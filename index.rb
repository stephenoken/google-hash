class Bootstrap
  def initialize
    textFile = IO.readlines("example.in")
    scenarioConfig = textFile[0].split
    $table = {
      :rows => scenarioConfig[0],
      :cols => scenarioConfig[1],
      :drones => scenarioConfig[2],
      :turns => scenarioConfig[3],
      :max_payload => scenarioConfig[4]
    }

    $products = textFile[2].split
    # puts $products

    # number_of_warehouses = textFile[3..-1]
    # puts number_of_warehouses
    warehouses = get_warehouse(textFile,textFile[3])
  end

  def get_warehouse(textFile,number_of_warehouses)
    puts number_of_warehouses
    return number_of_warehouses
  end
end

class Drone
  def initialize()

  end

  def load

  end

  def deliver

  end

  def unload

  end

  def wait

  end
end
bootstrap = Bootstrap.new
