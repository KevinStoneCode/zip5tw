# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'

def correct_road!(str)
  str.sub!("１", "一")
  str.sub!("２", "二")
  str.sub!("３", "三")
  str.sub!("４", "四")
  str.sub!("５", "五")
  str.sub!("６", "六")
  str.sub!("７", "七")
  str.sub!("８", "八")
  str.sub!("９", "九")
end

file = File.read('db/zip5.txt')
data_hashs = JSON.parse(file)
data_hashs.each do |data_hash|
  case data_hash["Scope"][0]
  when "單", "雙", "連"
    case data_hash["Scope"][0] 
    when "單"
      data_hash["Side"] = "odd" 
    when "雙"
      data_hash["Side"] = "even" 
    when "連"
      data_hash["Side"] = "serial" 
    end
    
    if data_hash["Scope"].include?("以上")
      data_hash["Begin"] = data_hash["Scope"][/[0-9]+/]
      data_hash["End"] = 99999
    elsif data_hash["Scope"].include?("以下") 
      data_hash["Begin"] = 0
      data_hash["End"] = data_hash["Scope"][/[0-9]+/]
    elsif data_hash["Scope"].include?("至")
      scope_arr = data_hash["Scope"].split("至")
      data_hash["Begin"] = scope_arr[0][/[0-9]+/]
      data_hash["End"] = scope_arr[1][/[0-9]+/]
    else
      data_hash["Begin"] = 0
      data_hash["End"] = 99999 
    end
  when "全"
    data_hash["Side"] = "all"
    data_hash["Begin"] = 0
    data_hash["End"] = 99999 
  else
    data_hash["Side"] = "one"
    data_hash["Begin"] = data_hash["Scope"][/[0-9]+/]
    data_hash["End"] = data_hash["Scope"][/[0-9]+/]
  end 
  correct_road!(data_hash["Road"])
  #puts data_hash
  Zip5Address.create!(zip5: data_hash["Zip5"],
                      city: data_hash["City"],
                      area: data_hash["Area"],
                      road: data_hash["Road"],
                      scope:data_hash["Scope"],
                      side: data_hash["Side"],
                      begin:data_hash["Begin"],
                      end:  data_hash["End"])
end