class LinkedList
  attr_reader :head
  
  class Node
    attr_accessor :next_node
    attr_reader :value

    def initialize(value)
      @value = value 
      @next_node = nil
    end
  end
  
  def initialize
    @head_element = nil
  end

  def head
    return empty_list unless @head_element
    @head_element.value 
  end

  def tail
    return empty_list unless @head_element
    tail_element.value
  end
  
  def append(value)
    if @head_element.nil? 
      @head_element = Node.new(value) 
    else        
      return empty_list unless tail_element
      tail_element.next_node = Node.new(value)
    end
    value
  end

  def prepend(value)
    if @head_element.nil?
      @head_element = Node.new(value)
    else
      temp = @head_element
      @head_element = Node.new(value)
      @head_element.next_node = temp
    end
    value
  end

  def size
    return 0 if @head_element.nil?
    counter = 0
    actual_node = @head_element
    while actual_node
      counter += 1
      actual_node = actual_node.next_node
    end
    counter
  end

  def at(index)
    return empty_list unless @head_element
    actual_node = @head_element
    index.times do
      actual_node = actual_node.next_node
    end
    actual_node.value
  end

  def find (value)
    return empty_list unless @head_element
    counter = 0
    actual_node = @head_element
    while actual_node
      return counter if actual_node.value == value
      counter += 1
      actual_node = actual_node.next_node
    end
    return nil
  end

  def contains? (value)
    return empty_list unless @head_element
    actual_node = @head_element
    while actual_node
      return true if actual_node.value == value
      actual_node = actual_node.next_node
    end
    return false
  end

  def pop
    return empty_list unless @head_element
    value = tail_element.value
    if @head_element.next_node.nil?
      @head_element = nil
    else 
      actual_node = @head_element
      while actual_node.next_node.next_node
        actual_node = actual_node.next_node 
      end
      actual_node.next_node = nil
    end
    return value
  end

  def to_s
    return empty_list unless @head_element
    result_string = ""
    actual_node = @head_element
    while actual_node
      result_string += "( #{actual_node.value} ) => "
      actual_node = actual_node.next_node
    end
    result_string += "nil"
  end

  private

  def empty_list 
    "List is empty."
  end

  def tail_element
    return nil unless head
    return @head_element unless @head_element.next_node
    actual_node = @head_element
    begin
      actual_node = actual_node.next_node
    end while actual_node.next_node
    actual_node
  end

end
