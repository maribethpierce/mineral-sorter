require 'pry'

array = ["3", "abcdde", "baccd", "eeabg"]
# STDIN.read.split("\n").each do |a|
#   array << a
# end
class MineralSorter

  def initialize(array)
    @number = array.shift.to_i
    @array = array
  end

  def all_minerals
    mineral_list = []
    @array.each do |a|
      a.split("").each do |mineral|
        mineral_list << mineral
      end
    end
    mineral_list
  end

  def unique_minerals
    self.all_minerals.uniq
  end

  def recurring_minerals
    common_minerals = []
    self.unique_minerals.each do |m|
      counter = 0
      @array.each do |rock|
        rock_minerals = rock.split("")
        if rock_minerals.include?(m)
          counter+=1
        end
      end
      if counter == @number
        common_minerals << m
      end
    end
    common_minerals
  end
end

arr = MineralSorter.new(array)

print arr.recurring_minerals.count
