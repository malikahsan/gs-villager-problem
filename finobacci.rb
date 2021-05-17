class Finobacci
  def calculate(count)
    start_from = 1; n1 = 1; n2 = 1
    sequence, sequence_hash = [], {}

    while start_from <= count.to_i do
      if start_from == 1
        sequence << n1
      elsif start_from == 2
        sequence << n2
      else
        # sum of the previous 2 numbers
        n3 = n1 + n2
        sequence << n3
        # assigning the new numbers to calculate the next number in the sequence
        n1 = n2
        n2 = n3
      end
      sequence_hash[start_from] = sequence.sum
      text = start_from == 1 ? "On the #{ordinal(start_from)} year she kills 1 villager" : "On the #{ordinal(start_from)} year she kills #{sequence.join('+')}=#{sequence_hash[start_from]} villagers"
      puts text
      start_from += 1
    end

    return sequence_hash
  end

  def ordinal(val)
    ending =  case val % 100
                when 11, 12, 13 then 'th'
              else
                case val % 10
                  when 1 then 'st'
                  when 2 then 'nd'
                  when 3 then 'rd'
                else 'th'
                end
              end
    return "#{val}#{ending}"
  end
end