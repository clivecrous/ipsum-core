require_relative '../lib/ipsum-core'

describe 'Ipsum' do
  it 'generates different words in latin' do
    expect(Ipsum::word(:latin)).not_to eq Ipsum::word(:latin)
  end

  describe 'whith test dictionary' do
    before(:all) do
      Ipsum.add_dictionary :test,
        {""=>{0=>{"f"=>1, "b"=>2}}, "f"=>{1=>{"o"=>1}}, "fo"=>{2=>{"o"=>1}}, "foo"=>{3=>{"\n"=>1}}, "b"=>{1=>{"a"=>2}}, "ba"=>{2=>{"r"=>1, "z"=>1}}, "bar"=>{3=>{"\n"=>1}}, "baz"=>{3=>{"\n"=>1}}}
    end

    it 'generates words of 3 letters' do
      100.times { expect(Ipsum::word(:test).length).to be == 3 }
    end

    it 'generates sentences using all 3 unique words' do    
      expect(  Ipsum::sentence(1000, :test).downcase.scan(/\w+/).uniq.sort  ).to eq ['bar','baz','foo']
    end
  end
end