require_relative 'spec_helper'

class SpecBase < Minitest::Spec
  before do
    $uiquery = nil
    $args = nil
  end

  after do
    # nop
  end

  describe 'Base' do
    describe 'Base.raise_if_invalid' do
      it 'should raise' do
        proc { Button.text(:symbol) }.must_raise(RuntimeError)
        proc { Button.touch(:symbol) }.must_raise(RuntimeError)
        proc { ListView.count(:symbol) }.must_raise(RuntimeError)
        proc { ListView.touch(:symbol) }.must_raise(RuntimeError)
        proc { TextView.text(:symbol) }.must_raise(RuntimeError)
        proc { TextView.touch(:symbol) }.must_raise(RuntimeError)
      end
    end

    describe 'Base.parse_query' do
      it 'should parse query' do
        Button.parse_query(nil).must_equal('Button')
        Button.parse_query(0).must_equal('Button index:0')
        Button.parse_query('myId').must_equal("Button marked:'myId'")
        ListView.parse_query(nil).must_equal('ListView')
        ListView.parse_query(0).must_equal('ListView index:0')
        ListView.parse_query('myId').must_equal("ListView marked:'myId'")
        TextView.parse_query(nil).must_equal('TextView')
        TextView.parse_query(0).must_equal('TextView index:0')
        TextView.parse_query('myId').must_equal("TextView marked:'myId'")
      end
    end
  end
end
