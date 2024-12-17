require 'date'

class Facility
  attr_reader :name, :address, :phone, :services

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

      vehicle.registration_date = Date.today.year
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

Register a vehicle
  Vehicles have the following rules:
    Vehicles 25 years old or older are considered antique and cost $25 to register
    Electric Vehicles (EV) cost $200 to register
    All other vehicles cost $100 to register
    A vehicle’s plate_type should be set to :regular, :antique, or :ev upon successful registration.
Administer a written test
  A written test can only be administered to registrants with a permit and who are at least 16 years of age
Administer a road test
  A road test can only be administered to registrants who have passed the written test
  For simplicity’s sake, Registrants who qualify for the road test automatically earn a license
Renew a driver’s license
  A license can only be renewed if the registrant has already passed the road test and earned a license