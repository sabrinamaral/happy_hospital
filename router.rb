class Router
  def initialize(controller_patient, controller_room)
    @controller_patient = controller_patient
    @controller_room = controller_room
    @running = true
  end

  def run
    puts 'Welcome to Happy Hospital'
    puts 'HAPPY HOSPITAL'.center('-', 10)

    while @running
      display_options
      gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    # when 1 then @controller.list
    # when 2 then @controller.add
    # when 3 then @controller.add_from_internet
    # when 4 then @controller.toggle_done
    # when 5 then @controller.remove
    when 0 then stop
    else
      puts "Please press 1, 2, 3, 4, 5 or 0"
    end
  end

  def stop
    @running = false
  end

  def display_options
    puts ""
    puts "How can we help you today?"
    puts "1 - List all patients"
    puts "2 - Add a new patient"
    puts "3 - List all rooms"
    puts "4 - Add a new room"
    puts "5 - Remove a patient"
    puts "0 - Stop and exit the program"
  end

end
