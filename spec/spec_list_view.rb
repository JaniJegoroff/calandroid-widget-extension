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
    describe 'ListView.class_name' do
      it 'should return class name' do
        ListView.class_name.must_equal('ListView')
      end
    end

    describe 'ListView.touch and aliases' do
      it 'should call Calabash touch method with correct parameters' do
        ListView.touch
        $uiquery.must_equal("#{ListView.class_name}")

        ListView.touch(0)
        $uiquery.must_equal("#{ListView.class_name} index:0")

        ListView.touch('myId')
        $uiquery.must_equal("#{ListView.class_name} marked:'myId'")

        ListView.tap
        $uiquery.must_equal("#{ListView.class_name}")

        ListView.tap(0)
        $uiquery.must_equal("#{ListView.class_name} index:0")

        ListView.tap('myId')
        $uiquery.must_equal("#{ListView.class_name} marked:'myId'")
      end
    end

    describe 'ListView.property and aliases' do
      it 'should call Calabash query method with correct parameters' do
        ListView.property(:finland)
        $uiquery.must_equal("#{ListView.class_name}")
        $args.first.must_equal(:finland)

        ListView.prop(:finland)
        $uiquery.must_equal("#{ListView.class_name}")
        $args.first.must_equal(:finland)

        ListView.p(:finland)
        $uiquery.must_equal("#{ListView.class_name}")
        $args.first.must_equal(:finland)
      end
    end

    describe 'ListView.id' do
      it 'should call Calabash query method with correct parameters' do
        ListView.id
        $uiquery.must_equal("#{ListView.class_name}")
        $args.first.must_equal(:id)
      end
    end
  end
end
