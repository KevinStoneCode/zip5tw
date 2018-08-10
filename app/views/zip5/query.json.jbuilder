json.array!(@zip5_addresses) do |zip5_address|
  json.extract! zip5_address, :zip5, :scope
  json.ori_address @address.origin_address
  json.ori_address_with_zip "#{zip5_address.zip5} #{@address.origin_address}"
  json.format1 "#{zip5_address.zip5} #{zip5_address.city}#{zip5_address.area}#{zip5_address.road}#{@address.origin_scope}"
end