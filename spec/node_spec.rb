require './lib/node'

describe Node do
  before(:each) do
    @node1 = Node.new(1)
    @node2 = Node.new(2)
    @node3 = Node.new(3)
  end

  it 'has data' do
    expect(@node1.data).to eq(1)
    expect(@node2.data).to eq(2)
    expect(@node3.data).to eq(3)
  end

  it 'has a next node that is nil by default' do
    expect(@node1.next_node).to eq(nil)
    expect(@node2.next_node).to eq(nil)
    expect(@node3.next_node).to eq(nil)
  end

  it 'can have a different value' do
    @node1.data = 'foo'
    @node2.data = 'bar'
    @node3.data = 'blarg'

    expect(@node1.data).to eq('foo')
    expect(@node2.data).to eq('bar')
    expect(@node3.data).to eq('blarg')
  end

  it 'can have a different next node' do
    @node1.next_node = @node2
    @node2.next_node = @node3

    expect(@node1.next_node).to eq @node2
    expect(@node2.next_node).to eq @node3
  end
end
