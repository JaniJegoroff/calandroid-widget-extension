[![Gem Version](https://badge.fury.io/rb/calandroid-widget-extension.svg)](http://badge.fury.io/rb/calandroid-widget-extension)
[![Build Status](https://travis-ci.org/JaniJegoroff/calandroid-widget-extension.svg?branch=master)](https://travis-ci.org/JaniJegoroff/calandroid-widget-extension)
[![Coverage Status](https://coveralls.io/repos/JaniJegoroff/calandroid-widget-extension/badge.svg?branch=master)](https://coveralls.io/r/JaniJegoroff/calandroid-widget-extension?branch=master)
[![Code Climate](https://codeclimate.com/github/JaniJegoroff/calandroid-widget-extension/badges/gpa.svg)](https://codeclimate.com/github/JaniJegoroff/calandroid-widget-extension)
[![Dependency Status](https://gemnasium.com/JaniJegoroff/calandroid-widget-extension.svg)](https://gemnasium.com/JaniJegoroff/calandroid-widget-extension)

calandroid-widget-extension
==========

Calabash-android widget extension provides convenient metaclasses for Calabash usage.

You can utilise these classes in `calabash-android console` as well as in your test automation code.

See similar extension for Calabash-ios: [calios-uikit-extension](https://github.com/JaniJegoroff/calios-uikit-extension)

Installation
==========

In your Gemfile:

`gem 'calandroid-widget-extension'`

Install gem manually:

`$ gem install calandroid-widget-extension`

Supported widgets
==========

Currently small subset of widgets are supported. Supported widgets are:

`Button`
`FrameLayout`
`ImageButton`
`LinearLayout`
`ListView`
`TextView`

Example use cases
==========

Launch calabash-android console (irb)

`$ calabash-android console <app.apk>`

Load calandroid-widget-extension

`irb> require 'calandroid-widget-extension'`

Launch your application

`irb> start_test_server_in_background`

Execute some example Calabash and equivalent `calandroid-widget-extension` commands

`touch('button')`
> **`Button.touch`**

`touch('button index:1')`
> **`Button.touch(1)`**

`touch("button marked:'buttonId'")`
> **`Button.touch('buttonId')`**

`flash("button marked:'buttonId'")`
> **`Button.flash('buttonId')`**

`query("button marked:'buttonId'", :text).first`
> **`Button.text('buttonId')`**

`query('ListView', :count).first`
> **`ListView.count`**

`query('ListView', smoothScrollToPosition: 10)`
> **`ListView.scroll_to_index(10)`**

`query('TextView', :text).first`
> **`TextView.text`**

See available methods for a certain metaclass

> **`Button.help`**

Did you notice alias methods?

> **`Button.help`** --> **`Button.h`**

> **`Button.query`** --> **`Button.q`**

> **`Button.flash`** --> **`Button.f`**

> **`Button.property`** --> **`Button.prop`** --> **`Button.p`**

> **`Button.touch`** --> **`Button.tap`**

Okay, I think you got the point. Time to utilise `calandroid-widget-extension` methods in your test automation code now!

Run the tests
==========

`$ bundle`

`$ bundle exec rake`

License
==========

MIT
