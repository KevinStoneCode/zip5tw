class Zip5Controller < ApplicationController
  def query
    @address = Address.new(params[:address])
    if not @address.scope.empty?
      @zip5_addresses = Zip5Address.where("city = ? and area = ? and road = ? and begin <= ? and end >= ?", @address.city, @address.area, @address.road, @address.scope, @address.scope)
    elsif not @address.road.empty?
      @zip5_addresses = Zip5Address.where("city = ? and area = ? and road = ? ", @address.city, @address.area, @address.road)
    else
      @zip5_addresses = Zip5Address.where("city = ? and area = ? ", @address.city, @address.area)
    end    
  end
end
