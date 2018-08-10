require 'rails_helper'

RSpec.describe Address, type: :model do
  describe "init 解析字串" do
    describe "完整地址" do
      it "市,區,路" do
        address = Address.new("臺北市文山區福興路4巷1號")
        expect(address.city).to eq("臺北市")
        expect(address.area).to eq("文山區")
        expect(address.road).to eq("福興路")
        expect(address.scope).to eq("4")
      end

      it "市,區,段" do
        address = Address.new("桃園市龜山區忠義路１段870-1號")
        expect(address.city).to eq("桃園市")
        expect(address.area).to eq("龜山區")
        expect(address.road).to eq("忠義路１段")
        expect(address.scope).to eq("870")
      end

      it "市,區,街" do
        address = Address.new("臺中市沙鹿區成功東街77號")
        expect(address.city).to eq("臺中市")
        expect(address.area).to eq("沙鹿區")
        expect(address.road).to eq("成功東街")
        expect(address.scope).to eq("77")
      end 

      it "縣,鄉" do 
        address = Address.new("花蓮縣壽豐鄉壽豐路一段79號")
        expect(address.city).to eq("花蓮縣")
        expect(address.area).to eq("壽豐鄉")
        expect(address.road).to eq("壽豐路一段")
        expect(address.scope).to eq("79")
      end  

      it "縣,鎮" do
        address = Address.new("花蓮縣玉里鎮城中三街74號")
        expect(address.city).to eq("花蓮縣")
        expect(address.area).to eq("玉里鎮")
        expect(address.road).to eq("城中三街")
        expect(address.scope).to eq("74")
      end

      it "縣,市" do
        address = Address.new("花蓮縣花蓮市花崗街44巷3號")
        expect(address.city).to eq("花蓮縣")
        expect(address.area).to eq("花蓮市")
        expect(address.road).to eq("花崗街")
        expect(address.scope).to eq("44")
      end
    end   

    describe "更正地址 City的部分" do
      it "台 => 臺" do
        address = Address.new("台北市文山區福興路4巷1號")
        expect(address.city).to eq("臺北市")
      end

      it "北市 => 臺北市" do 
        address = Address.new("北市文山區福興路4巷1號")
        expect(address.city).to eq("臺北市")
      end

      it "中市 => 臺中市" do
        address = Address.new("中市沙鹿區成功東街77號")
        expect(address.city).to eq("臺中市")
      end

      it "南市 => 臺南市" do
        address = Address.new("南市北區成功路380號")
        expect(address.city).to eq("臺南市")
      end

      it "去除原有郵遞號" do
        address = Address.new("70443台南市北區成功路380號")
        expect(address.city).to eq("臺南市")
      end
    end 
  end
end
