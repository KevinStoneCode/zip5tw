class Address
  attr_reader :city, :area, :road, :scope, :origin_address, :origin_scope

  def initialize(str)
    str = String.new("") if str.nil?
    str = str.strip
    @origin_address = String.new(str)

    if ind = str.index("縣") || ind = str.index("市")
      @city = str.slice!(0..ind)
      @city = correct_city(@city)
    else
      @city = String.new("")
    end

    if ind = str.index("鄉") || ind = str.index("鎮") || ind = str.index("市") || ind = str.index("區")
      @area = correct_area(@city, str.slice!(0..ind))
    else
      @area = String.new("")
    end

    if ind = str.index("段") || ind = str.index("街") || ind = str.index("路")
      @road = str.slice!(0..ind)
      @road = correct_road(@road)
    else
      @road = String.new("")
    end
    # 沒有路名只有村莊名的情況
    if @road.empty? && (not str.empty?)
      if ind = str.index(/[0-9]/)
        @road = str.slice!(0..ind-1)
      else
        @road = String.new(str)
      end
    end

    @origin_scope = String.new("") if not @origin_scope = String.new(str)
    # 只取第一個數字
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
    
    # 舊五都
    str = str.sub("臺北縣", "新北市")
    str = str.sub("桃園縣", "桃園市")
    str = str.sub("中縣", "中市")
    str = str.sub("南縣", "南市")
    str = str.sub("高雄縣", "高雄市")

    if str.size == 2
      str = str.sub("北市", "臺北市")
      str = str.sub("中市", "臺中市")
      str = str.sub("南市", "臺南市")
    end
    return str
  end

  def correct_area(city_str, area_str)
    if city_str.index("市") 
      area_str = area_str.sub("鄉", "區")
      area_str = area_str.sub("鎮", "區")
      area_str = area_str.sub("市", "區")
    end
    return area_str
  end

  def correct_road(str)
    if str.index("段")
      str = str.sub("１", "一")
      str = str.sub("２", "二")
      str = str.sub("３", "三")
      str = str.sub("４", "四")
      str = str.sub("５", "五")
      str = str.sub("６", "六")
      str = str.sub("７", "七")
      str = str.sub("８", "八")
      str = str.sub("９", "九")
      str = str.sub("1", "一")
      str = str.sub("2", "二")
      str = str.sub("3", "三")
      str = str.sub("4", "四")
      str = str.sub("5", "五")
      str = str.sub("6", "六")
      str = str.sub("7", "七")
      str = str.sub("8", "八")
      str = str.sub("9", "九")
    end
    return str
  end
end