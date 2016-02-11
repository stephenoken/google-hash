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
    puts $table
  end
end

class Grid
  def initialize()

  end
end
bootstrap = Bootstrap.new
