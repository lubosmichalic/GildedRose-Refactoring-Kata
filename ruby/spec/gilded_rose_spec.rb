# require File.join(File.dirname(__FILE__), 'gilded_rose')
require 'gilded_rose'

describe GildedRose do
  before(:each) do
    sleep(0.1)
  end

  describe "#update_quality on a normal_item" do
    it "does not change the name" do
      items = [Item.new('bread', 0, 0)]
      GildedRose.new(items).update_quality_and_sell_in()
      expect(items[0].name).to eq "bread"
    end
    it 'changes the quality and sell_in of a normal item' do
      items = [Item.new('bread', 3, 2)]
      GildedRose.new(items).update_quality_and_sell_in()
      expect(items[0].to_s).to eq "bread, 2, 1"
    end
    it 'changes the quality by -1 of a normal item' do
      items = [Item.new('bread', 3, 2)]
      GildedRose.new(items).update_quality_and_sell_in()
      expect(items[0].quality).to eq 1
    end
    it 'changes the sell-in by -1 of a normal item' do
      items = [Item.new('bread', 3, 2)]
      GildedRose.new(items).update_quality_and_sell_in()
      expect(items[0].sell_in).to eq 2
    end
    it 'changes the quality and sell_in of a normal item when quality 0' do
      items = [Item.new('bread', 3, 2)]
      GildedRose.new(items).update_quality_and_sell_in()
      expect(items[0].to_s).to eq "bread, 2, 1"
    end
    it 'changes the quality and sell_in of a normal item when quality 50' do
      items = [Item.new('bread', 3, 2)]
      GildedRose.new(items).update_quality_and_sell_in()
      expect(items[0].to_s).to eq "bread, 2, 1"
    end
    it 'if the sell_by date has hit 0 , quality changes by ' do
      items = [Item.new('bread', 0, 3)]
      GildedRose.new(items).update_quality_and_sell_in()
      expect(items[0].to_s).to eq "bread, -1, 1"
    end
    it 'if the sell_by date has hit 0 , quality changes by ' do
      items = [Item.new('bread', -1, 3)]
      GildedRose.new(items).update_quality_and_sell_in()
      expect(items[0].to_s).to eq "bread, -2, 1"
    end

  end

  describe "#update_quality of Aged Brie" do
    it "does not change the name" do
      items = [Item.new('Aged Brie', 0, 0)]
      GildedRose.new(items).update_quality_and_sell_in()
      expect(items[0].name).to eq 'Aged Brie'
    end
    it 'changes the quality and sell_in of a Aged Brie' do
      items = [Item.new('Aged Brie', 3, 2)]
      GildedRose.new(items).update_quality_and_sell_in()
      expect(items[0].to_s).to eq "Aged Brie, 2, 3"
    end
    it 'changes the quality by +1 of a Aged Brie' do
      items = [Item.new('Aged Brie', 3, 2)]
      GildedRose.new(items).update_quality_and_sell_in()
      expect(items[0].quality).to eq 3
    end
    it 'changes the sell-in by -1 of a Aged Brie' do
      items = [Item.new('Aged Brie', 3, 2)]
      GildedRose.new(items).update_quality_and_sell_in()
      expect(items[0].sell_in).to eq 2
    end
    it 'changes the quality and sell_in of a Aged Brie when quality 0' do
      items = [Item.new('Aged Brie', 3, 0)]
      GildedRose.new(items).update_quality_and_sell_in()
      expect(items[0].to_s).to eq "Aged Brie, 2, 1"
    end
    it 'changes the quality and sell_in of a Aged Brie when quality 50' do
      items = [Item.new('Aged Brie', 3, 50)]
      GildedRose.new(items).update_quality_and_sell_in()
      expect(items[0].to_s).to eq "Aged Brie, 2, 50"
    end
    it 'if the sell_by date has hit 0 , quality changes by ' do
      items = [Item.new('Aged Brie', 0, 3)]
      GildedRose.new(items).update_quality_and_sell_in()
      expect(items[0].to_s).to eq "Aged Brie, -1, 5"
    end
  end

  describe "#update_quality of Sulfuras, Hand of Ragnaros" do
    it "does not change the name" do
      items = [Item.new('Sulfuras, Hand of Ragnaros', 0, 0)]
      GildedRose.new(items).update_quality_and_sell_in()
      expect(items[0].name).to eq 'Sulfuras, Hand of Ragnaros'
    end
    it 'changes the quality and sell_in of a Sulfuras, Hand of Ragnaros' do
      items = [Item.new('Sulfuras, Hand of Ragnaros', 3, 2)]
      GildedRose.new(items).update_quality_and_sell_in()
      expect(items[0].to_s).to eq "Sulfuras, Hand of Ragnaros, 3, 2"
    end
    it 'changes the quality by +1 of a Sulfuras, Hand of Ragnaros' do
      items = [Item.new('Sulfuras, Hand of Ragnaros', 3, 2)]
      GildedRose.new(items).update_quality_and_sell_in()
      expect(items[0].quality).to eq 2
    end
    it 'changes the sell-in by -1 of a Sulfuras, Hand of Ragnaros' do
      items = [Item.new('Sulfuras, Hand of Ragnaros', 3, 2)]
      GildedRose.new(items).update_quality_and_sell_in()
      expect(items[0].sell_in).to eq 3
    end
    it 'changes the quality and sell_in of a Sulfuras, Hand of Ragnaros when quality 0' do
      items = [Item.new('Sulfuras, Hand of Ragnaros', 3, 0)]
      GildedRose.new(items).update_quality_and_sell_in()
      expect(items[0].to_s).to eq "Sulfuras, Hand of Ragnaros, 3, 0"
    end
    it 'changes the quality and sell_in of a Sulfuras, Hand of Ragnaros when quality 50' do
      items = [Item.new('Sulfuras, Hand of Ragnaros', 3, 50)]
      GildedRose.new(items).update_quality_and_sell_in()
      expect(items[0].to_s).to eq "Sulfuras, Hand of Ragnaros, 3, 50"
    end
    it 'if the sell_by date has hit 0 , quality changes by ' do
      items = [Item.new('Sulfuras, Hand of Ragnaros', 0, 3)]
      GildedRose.new(items).update_quality_and_sell_in()
      expect(items[0].to_s).to eq "Sulfuras, Hand of Ragnaros, 0, 3"
    end
  end

  describe "#update_quality of Backstage passes to a TAFKAL80ETC concert" do
    it "does not change the name" do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 0)]
      GildedRose.new(items).update_quality_and_sell_in()
      expect(items[0].name).to eq 'Backstage passes to a TAFKAL80ETC concert'
    end
    it 'changes the quality and sell_in of a TAFKAL80ETC concert' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 3, 2)]
      GildedRose.new(items).update_quality_and_sell_in()
      expect(items[0].to_s).to eq "Backstage passes to a TAFKAL80ETC concert, 2, 5"
    end
    it 'changes the quality by +1 of a TAFKAL80ETC concert' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 3, 2)]
      GildedRose.new(items).update_quality_and_sell_in()
      expect(items[0].quality).to eq 5
    end
    it 'changes the sell-in by -1 of a TAFKAL80ETC concert' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 3, 2)]
      GildedRose.new(items).update_quality_and_sell_in()
      expect(items[0].sell_in).to eq 2
    end
    it 'changes the quality and sell_in of a TAFKAL80ETC concert when quality 0' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 3, 0)]
      GildedRose.new(items).update_quality_and_sell_in()
      expect(items[0].to_s).to eq "Backstage passes to a TAFKAL80ETC concert, 2, 3"
    end
    it 'changes the quality and sell_in of a TAFKAL80ETC concert when quality 50' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 3, 50)]
      GildedRose.new(items).update_quality_and_sell_in()
      expect(items[0].to_s).to eq "Backstage passes to a TAFKAL80ETC concert, 2, 50"
    end
    it 'changes the quality and sell_in of a TAFKAL80ETC concert when sell-in > 6' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 7, 20)]
      GildedRose.new(items).update_quality_and_sell_in()
      expect(items[0].to_s).to eq "Backstage passes to a TAFKAL80ETC concert, 6, 22"
    end
    it 'changes the quality and sell_in of a TAFKAL80ETC concert when sell-in > 11' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 12, 20)]
      GildedRose.new(items).update_quality_and_sell_in()
      expect(items[0].to_s).to eq "Backstage passes to a TAFKAL80ETC concert, 11, 21"
    end
    it 'if the sell_by date has hit 0 , quality changes by ' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 4)]
      GildedRose.new(items).update_quality_and_sell_in()
      expect(items[0].to_s).to eq "Backstage passes to a TAFKAL80ETC concert, -1, 0"
    end
  end

end
