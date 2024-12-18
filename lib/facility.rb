require 'date'

class Facility
  
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(facility_info)
    @name = facility_info[:name]
    @address = facility_info[:address]
    @phone = facility_info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration')

      vehicle.registration_date = Date.today
      @registered_vehicles << vehicle

      #set plate_type
      if vehicle.electric_vehicle? == true
        vehicle.plate_type = :ev
      elsif vehicle.antique? == true
        vehicle.plate_type = :antique
      else
        vehicle.plate_type = :regular
      end

      #collect_fees
      if vehicle.plate_type == :ev
        @collected_fees += 200
      elsif vehicle.plate_type == :antique
        @collected_fees += 25
      else
        @collected_fees += 100
      end
    end
  end

end

