class Zip5Controller < ApplicationController
  def query
    @address = Address.new(params[:address])
    if not @address.scope.empty?
      excluded_side = @address.scope.to_i.odd? ? 'even' : 'odd'
      @zip5_addresses = Zip5Address.where("city = ? and area = ? and road = ? and begin <= ? and zip5_addresses.end >= ? and side <> ?", @address.city, @address.area, @address.road, @address.scope, @address.scope, excluded_side)
    elsif not @address.road.empty?
      @zip5_addresses = Zip5Address.where("city = ? and area = ? and road = ? ", @address.city, @address.area, @address.road)
    else
      @zip5_addresses = Zip5Address.where("city = ? and area = ? ", @address.city, @address.area)
    end    
  end
end
