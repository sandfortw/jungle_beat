include Enumerable

class LinkedList
  attr_accessor :name
  attr_reader :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def prepend(value)
    if @head.nil?
      @head = value
      @tail = value
    else
      value.next_node = @head
      @head = value
    end
  end

  def append(value)
    if @head.nil?
      @head = value
      @tail = value
    else
      @tail.next_node= value
      @tail = value
    end
  end

  def count
    count = 0
    return 0 if @head.nil?

    entry = @head
    until entry.nil?
      count += 1
      entry = entry.next_node
    end
    count
  end

  def at(index)
    entry = @head
    index.times do
      entry = entry.next_node
    end
    entry
  end

  def previous_from(index)
    return nil if index == 0

    entry = @head
    (index - 1).times do |_i|
      entry = entry.next_node
    end
    entry
  end

  def pop
    deleted = @tail
    @tail = previous_from(count - 1)
    @tail.next_node= nil
    deleted
  end

  def contains?(value)
    entry = @head
    until entry.nil?
      return true if entry.data == value

      entry = entry.next_node
    end
    false
  end

  def find(value)
    if contains?(value)
      entry = @head
      count = 0
      until entry.data == value || entry.nil?
        count += 1
        entry = entry.next_node
      end
      return count
    end
    nil
  end

  def to_string
    entry = @head
    accumulator = []
    until entry.nil?
      accumulator << "#{entry.data}"
      entry = entry.next_node
    end
    accumulator.join(' ')
  end

  def insert_at(value, index)
    new_node = Node.new(value)
    if index == 0
      prepend(new_node)
    elsif index == (count - 1)
      append(new_node)
    else
      previous = at((index - 1))
      after = at((index))
      previous.next_node= new_node
      new_node.next_node= after
    end
  end

  def remove_at(index)
    if index == 0
      @head = @head.next_node
    elsif index == (count - 1)
      @tail = at((index - 1))
      @tail.next_node= nil
    else
      previous = at((index - 1))
      after = at((index + 1))
      previous.next_node= after
    end
  end
end
