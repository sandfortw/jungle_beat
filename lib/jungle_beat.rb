class JungleBeat
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(string)
    string.scan(/\w+/).each do |element|
      node = Node.new(element)
      @list.append(node)
    end
  end

  def count
    @list.count
  end

  def play
    beats = @list.to_string
    `say -r 200 -v Boing "#{beats} "`
  end

end