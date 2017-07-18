#bubble_sort_by method, sort an array accepting a block. The block's return is
#similar to the spaceship operator
def bubble_sort_by(array)
  #loop until everything is swapped by length (sorted)
  loop do
    swapped = false

    (array.length - 1).times do |i|
      #assign to a variable the parameter implicitly returned by the block
      value = yield array[i], array[i+1]
      #check the value from the block and swap if needed (so set swap to true)
      if (value == 1)
        array[i], array[i+1] = array[i+1], array[i]
        swapped = true
      end
    end

  #if nothing is swapped (so the array is sorted), the method will never
  #enter the IF and the swapped variable would be false and will BREAK
  #if swapped is true it just jump the break and go back to the loop
  break if !swapped
  end

  #print inspect and return the array
  puts array.inspect
  return array
end

bubble_sort_by(["hi","hello","hey"]) do |left,right|
  #like the spaceship operator this block return 1 if the element on the left
  #is bigger than the one on the right, -1 if the element on the right is
  #smaller or 0 if they are equal
  if (left.length - right.length < 0)
    -1
  elsif (left.length - right.length > 0)
    1
  else
    0
  end
end
