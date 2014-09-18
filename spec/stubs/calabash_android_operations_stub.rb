require 'calabash-android/operations'

module Calabash::Android::Operations
  def query(uiquery, *args)
    $uiquery = uiquery
    $args = args
    $stub_query_response
  end

  def flash(uiquery, *args)
    $uiquery = uiquery
    $args = args
  end

  def touch(uiquery, opts={})
    $uiquery = uiquery
    $opts = opts
  end
end

class CalabashAndroidOperationsStubClass
  include Calabash::Android::Operations
end
