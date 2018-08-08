class Address
  attr_reader :city, :area, :road, :scope, :origin_address

  def initialize(str)
    str = String.new("") if str.nil?
    @origin_address = String.new(str)

    if ind = str.index("縣") || ind = str.index("市")
      @city = str.slice!(0..ind)
    else
      @city = String.new("")
    end

    if ind = str.index("鄉") || ind = str.index("鎮") || ind = str.index("市") || ind = str.index("區")
      @area = str.slice!(0..ind)
    else
      @area = String.new("")
    end

    if ind = str.index("段") || ind = str.index("街") || ind = str.index("路")
      @road = str.slice!(0..ind)
    else
      @road = String.new("")
    end

    @scope = str
  end

  private
  def get_city(str)
    if ind = str.index("縣")
      return str.slice!(0..ind)
    elsif ind = str.index("市")
      return str.slice!(0..ind)
    else
      return ""
    end        
  end
end