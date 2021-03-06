# rubocop:disable Metrics/ClassLength

require_relative 'spec_helper'

# Test class for Base
class SpecBase < Minitest::Spec
  before do
    @opr = Calabash::Android::Operations
  end

  describe 'Base' do
    classes = [Button, FrameLayout, ImageButton, LinearLayout, ListView, TextView]
    classes.each do |klass|
      describe "#{klass}.class_name" do
        it 'should return class name' do
          klass.class_name.must_equal(klass.to_s)
        end
      end

      describe "#{klass}.touch and aliases" do
        it 'should call Calabash touch method with correct parameters' do
          klass.touch
          @opr.ui_query.must_equal("#{klass.class_name}")

          klass.touch(0)
          @opr.ui_query.must_equal("#{klass.class_name} index:0")

          klass.touch('myId')
          @opr.ui_query.must_equal("#{klass.class_name} marked:'myId'")

          klass.tap
          @opr.ui_query.must_equal("#{klass.class_name}")

          klass.tap(0)
          @opr.ui_query.must_equal("#{klass.class_name} index:0")

          klass.tap('myId')
          @opr.ui_query.must_equal("#{klass.class_name} marked:'myId'")
        end
      end

      describe "#{klass}.property and aliases" do
        it 'should call Calabash query method with correct parameters' do
          klass.property(:finland)
          @opr.ui_query.must_equal("#{klass.class_name}")
          @opr.args.first.must_equal(:finland)

          klass.prop(:finland)
          @opr.ui_query.must_equal("#{klass.class_name}")
          @opr.args.first.must_equal(:finland)

          klass.p(:finland)
          @opr.ui_query.must_equal("#{klass.class_name}")
          @opr.args.first.must_equal(:finland)
        end
      end

      describe "#{klass}.id" do
        it 'should call Calabash query method with correct parameters' do
          klass.id
          @opr.ui_query.must_equal("#{klass.class_name}")
          @opr.args.first.must_equal(:id)
        end
      end

      describe "#{klass}.help" do
        it 'should return public methods' do
          klass.help.must_be_kind_of(Array)
          klass.h.must_be_kind_of(Array)

          klass.help.must_include(:help)
          klass.h.must_include(:h)

          klass.help.must_equal(klass.public_methods(false))
          klass.h.must_equal(klass.public_methods(false))
        end
      end

      describe "#{klass}.query and aliases" do
        it 'should call Calabash query method with correct parameters' do
          klass.query
          @opr.ui_query.must_equal("#{klass.class_name}")
          klass.q
          @opr.ui_query.must_equal("#{klass.class_name}")

          klass.query(1)
          @opr.ui_query.must_equal("#{klass.class_name} index:1")
          klass.q(2)
          @opr.ui_query.must_equal("#{klass.class_name} index:2")

          klass.query('myId')
          @opr.ui_query.must_equal("#{klass.class_name} marked:'myId'")
          klass.q('myId')
          @opr.ui_query.must_equal("#{klass.class_name} marked:'myId'")
        end
      end

      describe "#{klass}.flash and aliases" do
        it 'should call Calabash flash method with correct parameters' do
          klass.flash
          @opr.ui_query.must_equal("#{klass.class_name}")
          klass.f
          @opr.ui_query.must_equal("#{klass.class_name}")

          klass.flash(1)
          @opr.ui_query.must_equal("#{klass.class_name} index:1")
          klass.f(2)
          @opr.ui_query.must_equal("#{klass.class_name} index:2")

          klass.flash('myId')
          @opr.ui_query.must_equal("#{klass.class_name} marked:'myId'")
          klass.f('myId')
          @opr.ui_query.must_equal("#{klass.class_name} marked:'myId'")
        end
      end
    end

    describe 'Base.fail_if_invalid' do
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
