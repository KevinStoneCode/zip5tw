class Zip5Controller < ApplicationController
  def query
    @address = Address.new(params[:address])
  end
end
