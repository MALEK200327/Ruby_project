BLANK = -1
WALL = -2
# plant_garden function 
def plant_garden(wall_position, plant_details, garden_size)
  garden = Array.new(garden_size) { Array.new(garden_size, BLANK)}
  count = 0
  #constructing the plants using its index position in the garden 
  plant_details.each do |details|
  x = details[0]
  y = details[1]
  if x<garden_size && y<garden_size
    garden[y][x] = count
  end
  count+=1
end
#constructing the walls in the garden
wall_position.each do |wall|
 x = wall[0]
  y = wall[1]
  if x<garden_size && y<garden_size
    garden[y][x] = WALL
  end
end
  garden 
end

CH_WALL = '@'
CH_BLANK = ' '
# function display garden
def display_garden(garden)
  puts CH_WALL * (garden.length + 2)
  garden.each do |row|
    row_printable = []
    row.each do |cell|
      if cell == BLANK
        row_printable << CH_BLANK
      elsif cell == WALL
        row_printable << CH_WALL
      else
        row_printable << cell
      end
    end
    puts "#{CH_WALL}#{row_printable.join('')}#{CH_WALL}"
  end
  puts CH_WALL * (garden.length + 2)
end
# function get_plant_at checks if the cell is empty or not...
def get_plant_at(x, y, garden)
  if garden.length > 0  
    if garden[y][x] >= 0 
      return garden[y][x]
    else
      return -1
    end
  end
  return -1
end
# function can_grow_into checks 8 cells around the cell given if any of the neighbours cells occupied by plant return true else false
def can_grow_into(x, y, garden, plant_id)
  if get_plant_at(x, y, garden) == BLANK 
      return true
      elsif get_plant_at(x, y-1, garden) == plant_id
        return true
      elsif get_plant_at(x, y+1, garden) == plant_id
        return true
        
      elsif get_plant_at(x+1, y-1, garden)== plant_id
        return true
          
      elsif get_plant_at(x+1, y, garden)== plant_id
        return true
          
      elsif get_plant_at(x+1, y+1, garden)== plant_id
        return true
            
      elsif get_plant_at(x-1, y-1, garden) == plant_id 
        return true
      
      elsif get_plant_at(x-1, y, garden) == plant_id
        return true
      
      elsif get_plant_at(x-1, y+1, garden) == plant_id 
        return true
              
      else
        return false
     end
end

# Euclidian distance between coordinates (x,y) and (p_x,p_y)
def distance_squared(x, y, p_x, p_y)
  (p_x - x) * (p_x - x) + (p_y - y) * (p_y - y)
end
# function may_grow_into_cell
def may_grow_into_cell(x, y, garden, plant_details, plant_id, time)
  p_x = plant_details[plant_id][0]
  p_y = plant_details[plant_id][1]
  g = plant_details[plant_id][2]
  dist = Math.sqrt(distance_squared(x, y, p_x, p_y))
    if g*time >= dist && can_grow_into(x, y, garden, plant_id) == true 
      return true
     else
      return false
    end
end

def determine_occupancy(x, y, garden, plant_details, time)
	return WALL
end

def grow(time_steps, initial_garden, plant_details)
  initial_garden
end

if __FILE__ == $PROGRAM_NAME
# This is what you can use to experiment with the above functions.

  plant_details = [[0, 0, 0], [20, 0, 0], [5, 4, 0.5], [6, 6, 0.6], [8, 1, 1.01], [7, 13, 0.7], [8, 13, 0.7],[2, 13, 0.5]]
  wall_position = [[7, 2], [8, 2], [9, 2], [7, 13], [6, 12], [6, 13], [7, 12], [8, 12], [9, 12], [10, 12], [3, 13]]
  garden = plant_garden(wall_position, plant_details, 15)
  display_garden grow(0, garden, plant_details)
  display_garden grow(1, garden, plant_details)
  display_garden grow(2, garden, plant_details)
  display_garden grow(3, garden, plant_details)
end
