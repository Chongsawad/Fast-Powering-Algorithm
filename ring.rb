class RingTable < Array
  def [](n)
    self[n]=Array.new if super(n) == nil
    super(n)
  end
end

m = ARGV[0].to_i

a = RingTable.new(m)
b = RingTable.new(m)

m.times do |x|
  a[x] = Array.new(m,0)
  b[x] = Array.new(m,0)
end

m.times do |i|
  m.times do |j|
    a[i][j] = i*j%m
    b[i][j] = (i+j)%m
  end
end
puts "Addition tables modulo #{m}"
a.collect { |a| print('[' + a*','+']'+"\n") }
puts "Multiplication tables modulo #{m}"
b.collect { |b| print('[' + b*','+']'+"\n") }