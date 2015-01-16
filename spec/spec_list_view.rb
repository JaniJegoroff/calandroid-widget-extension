require_relative 'spec_helper'

class SpecListView < Minitest::Spec
  before do
    $uiquery = nil
    $args = nil
  end

  after do
    # nop
  end

  describe 'ListView' do
    describe 'ListView.count' do
      it 'should call Calabash query method with correct parameters' do
        $stub_query_response = [1]
        ListView.count.must_equal(1)
        $uiquery.must_equal('ListView')
        $args.first.must_equal(:count)

        $stub_query_response = [3]
        ListView.count.must_equal(3)
        $uiquery.must_equal('ListView')
        $args.first.must_equal(:count)
      end
    end

    describe 'ListView.scroll_to_index' do
      it 'should call Calabash query method with correct parameters' do
        ListView.scroll_to_index(10)
        $uiquery.must_equal('ListView')
        $args.first.must_equal({:smoothScrollToPosition=>10})
      end
    end
  end
end
