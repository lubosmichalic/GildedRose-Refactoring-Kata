class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality_and_sell_in()
    @items.each do |item|
      if item.name == 'bread'
        update_quality_and_sell_in_of_bread(item)
      end
      if item.name == 'Aged Brie'
        update_quality_and_sell_in_of_aged_brie(item)
      end
      if item.name == 'Sulfuras, Hand of Ragnaros'
        update_quality_and_sell_in_of_hand_of_ragnaros(item)
      end
      if item.name == 'Backstage passes to a TAFKAL80ETC concert'
        update_quality_and_sell_in_of_backstage_pass(item)
      end


      # if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
      #   if item.quality > 0
      #     if item.name != "Sulfuras, Hand of Ragnaros"
      #       item.quality = item.quality - 1
      #     end
      #   end
      # else
      #   if item.quality < 50
      #     item.quality = item.quality + 1
      #     if item.name == "Backstage passes to a TAFKAL80ETC concert"
      #       if item.sell_in < 11
      #         if item.quality < 50
      #           item.quality = item.quality + 1
      #         end
      #       end
      #       if item.sell_in < 6
      #         if item.quality < 50
      #           item.quality = item.quality + 1
      #         end
      #       end
      #     end
      #   end
      # end
      # if item.name != "Sulfuras, Hand of Ragnaros"
      #   item.sell_in = item.sell_in - 1
      # end
      # if item.sell_in < 0
      #   if item.name != "Aged Brie"
      #     if item.name != "Backstage passes to a TAFKAL80ETC concert"
      #       if item.quality > 0
      #         if item.name != "Sulfuras, Hand of Ragnaros"
      #           item.quality = item.quality - 1
      #         end
      #       end
      #     else
      #       item.quality = item.quality - item.quality
      #     end
      #   else
      #     if item.quality < 50
      #       item.quality = item.quality + 1
      #     end
      #   end
      # end
    end
  end

  def update_quality_and_sell_in_of_bread(item)
    item.sell_in -= 1
    item.quality -= 1 if item.sell_in < 0
    item.quality -= 1
  end
  def update_quality_and_sell_in_of_aged_brie(item)
    item.sell_in -= 1
    return if item.quality >= 50
    item.quality += 1 if item.sell_in < 0
    item.quality += 1
    return
  end
  
  def update_quality_and_sell_in_of_hand_of_ragnaros(item)
  end

  def update_quality_and_sell_in_of_backstage_pass(item)
    item.sell_in -= 1
    return if item.quality >= 50
    return item.quality = 0 if item.sell_in < 0
    item.quality += 1 if item.sell_in < 6
    item.quality += 1 if item.sell_in < 11
    item.quality += 1
    return
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
