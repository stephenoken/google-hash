class Bootstrap
  def initialize
    test = "1235"
    puts eval(test)+1
    $text_file = IO.readlines("example.in")

    $products = $text_file[2].split
    # puts $products

    # number_of_warehouses = $text_file[3..-1]
    # puts number_of_warehouses
    number_of_warehouses = $text_file[3].to_i
    $warehouses = get_warehouse(number_of_warehouses,4)
    puts $warehouses

    orders_index = 4 + (2 * number_of_warehouses)
    number_of_orders = $text_file[orders_index].to_i

    $orders = get_orders(number_of_orders,orders_index+1)

    scenarioConfig = $text_file[0].split
    $table = {
      :rows => scenarioConfig[0].to_i,
      :cols => scenarioConfig[1].to_i,
      :drones => createDrone(scenarioConfig[2].to_i).flatten,
      :turns => scenarioConfig[3],
      :max_payload => scenarioConfig[4]
    }
    puts $table

    puts $orders
    execute_orders($orders);
  end

  def execute_orders(orders)
    orders[0]
    drone = get_nearest_drone()

  end

  def get_nearest_drone()
    $warehouses.each do |warehouse|
      puts warehouse[:coordinates]
    end
    return true
  end
  def get_warehouse(number_of_warehouses,index)
    arr = []
    warehouse = {
      :coordinates => [$text_file[index].split[0].to_i,$text_file[index].split[1].to_i],
      :products => $text_file[index + 1].split
    }
    if(number_of_warehouses == 1)
      return warehouse
    end
    arr.push(warehouse);
      arr.push(self.get_warehouse(number_of_warehouses-1,index+2))
      return arr
  end

  def get_orders(number_of_orders, file_index)
    arr= []
    order = {
      :coordinates => $text_file[file_index].split,
      :num_of_items => $text_file[file_index+1].split,
      :product_type => $text_file[file_index+2].split
    }
    if (number_of_orders == 1)
      return order
    end
    arr.push(order)
    arr.push(self.get_orders(number_of_orders-1,file_index+3))

    return arr
  end

  def createDrone(number_of_drones)
    drone = {
      :location => $warehouses[0][:coordinates]
    }
    if(number_of_drones == 1)
      return drone
    end
    return [].push(drone).push(createDrone(number_of_drones-1))
  end
end
bootstrap = Bootstrap.new
