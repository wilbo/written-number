def dutch_number number
  if ( (number < 0) || (number > 100) )
    return "Geef me een nummer tussen de 0 en de 100"
  elsif number == 0
    return "nul"  
  end

  # init return string
  written_number = ""

  # data
  d_ones = ["een", "twee", "drie", "vier", "vijf", "zes", "zeven", "acht", "negen"]
  d_tens = ["tien", "twintig", "dertig", "veertig", "vijftig", "zestig", "zeventig", "tachtig", "negentig"]
  d_teens = ["elf", "twaalf", "dertien", "veertien", "vijftien", "zestien", "zeventien", "achtien", "negentien"]
  d_glue = ["en"]

  # testing for hundreds
  left = number

  # if the given number is 100, write will equal 1
  # else it wil round to 0
  write = left / 100

  # if the given number is 100, left will equal 0
  # else it wil just return the given number
  left = left - write * 100

  if write > 0
    return "honderd"    
  end

  # testing for tens
  write = left / 10
  left = left - write * 10

  if write > 0
    # number in the teens -and- not a ten
    if ((write == 1) and (left > 0))
      # -1 because of indexed array count
      written_number += d_teens[left-1]
      # where done here
      left = 0
    else
      if left == 0
        written_number += d_tens[write-1]
      else
        written_number += d_glue[0] + d_tens[write-1] 
      end
    end
  end

  # testing for ones
  write = left
  left = 0

  if write > 0
    written_number = d_ones[write-1] + written_number
  end

  return written_number
end

input = gets.chomp.to_i
puts dutch_number input


# test
# $i = 0
# $num = 100
# while $i <= $num  do
#    puts dutch_number $i
#    $i +=1
# end


