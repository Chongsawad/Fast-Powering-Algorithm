
base = ARGV[0] != nil ? ARGV[0].to_i : 3
power = ARGV[1] != nil ? ARGV[1].to_i : 218
mod = ARGV[2] != nil ? ARGV[2].to_i : 1000

s = power.to_s(2)

i = 0
c = 1
s.reverse.each_char do |bit|
  if bit == "1"
    c *= base**(2**i)
  end
  i+=1
end
puts c%mod
