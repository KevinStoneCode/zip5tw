class Address
  attr_reader :city, :area, :road, :scope, :origin_address, :origin_scope

  def initialize(str)
    str = String.new("") if str.nil?
    @origin_address = String.new(str)

    if ind = str.index("縣") || ind = str.index("市")
      @city = str.slice!(0..ind)
      @city = correct_city(@city)
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

    @origin_scope = String.new("") if not @origin_scope = String.new(str)
    @scope = String.new("") if not @scope = str[/[0-9]+/]
  end

  def empty?
    @origin_address.empty?
  end

  private

  def correct_city(str)
    # 清除原郵遞區號（如果有）
    str = str[/[^0-9]+/]
    # 俗體轉繁體
    str = str.sub("台", "臺")
    if str.size == 2
      str = str.sub("北市", "臺北市")
      str = str.sub("中市", "臺中市")
      str = str.sub("南市", "臺南市")
    end
    return str
  end
end