require "./lib/jungle_beat"

describe JungleBeat do 

  before(:each) do 
    @jb = JungleBeat.new
  end

  it 'has a list with a nil head' do
    expect(@jb.list).to be_a(LinkedList)
    expect(@jb.list.head).to eq(nil)
  end

  it 'can append data' do
    @jb.append("deep doo ditt")
    expect(@jb.list.head.data).to eq("deep")
    expect(@jb.list.head.next_node.data).to eq('doo')
  end
  
  it 'can count its elements' do
    @jb.append("deep doo ditt")
    @jb.append("woo hoo shu")
    expect(@jb.count).to eq(6) 
  end
  
end