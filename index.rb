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
    puts $products[0]
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
