class RingTable < Array
  def [](n)
    self[n]=Array.new if super(n) == nil
    super(n)
  end
end

class RingOfModulo
  attr_accessor :add, :mul, :m, :units
  
  def initialize(m)
    @m = m != nil ? m.to_i : 6

    @add = RingTable.new(@m)
    @mul = RingTable.new(@m)
    @units = []
    @m.times do |x|
      @add[x] = Array.new(@m,0)
      @mul[x] = Array.new(@m,0)
    end

    @m.times do |i|
      @m.times do |j|
        @add[i][j] = (i+j) % @m
        @mul[i][j] = (i*j) % @m
      end
    end
    groupOfUnits
  end
  
  def groupOfUnits
    @m.times do |i|
      if @mul[i].include?(1)
        @units.push(@mul[i].index(1))
      end
    end
    @units = @units.uniq.sort
  end
  
  def list
    puts "Addition tables modulo #{@m}"
    @add.collect { |a| print('[' + a*','+']'+"\n") }
    puts "Multiplication tables modulo #{m}"
    @mul.collect { |b| print('[' + b*','+']'+"\n") }
    print("A Group of Units modulo #{m} = {#{@units*', '}}\n")
  end
end

m = ARGV[0]
myRing = RingOfModulo.new(m)
myRing.list if m
