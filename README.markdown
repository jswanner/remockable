# Remockable

A collection of RSpec 2 matchers to simplify your web app specs.


## Background

The goal of this project is to provide a modern replacement to the now
unmaintained Remarkable project. Remarkable was a great asset when Rails 2.3
was current, but now that Rails 3.0 has become mainstream, a gap has been left
by still unreleased Remarkable 4.0.

In looking at the code for Remarkable to determine the feasibility of continuing
work on Remarkable itself, it seems clear that the scope of that project has
outgrown its usefulness for most users. It was with this conclusion in mind that
Remockable was born. It's an attempt to start with a clean slate but maintain
the original goal of Remarkable in spirit.


## Active Model Matchers

The following Active Model matchers are supported:

  * allow_mass_assignment_of
  * validate_acceptance_of
  * validate_confirmation_of
  * validate_exclusion_of
  * validate_format_of
  * validate_inclusion_of
  * validate_length_of
  * validate_numericality_of
  * validate_presence_of


## Active Record Matchers

The following Active Record matchers are supported:

  * have_column
  * have_index
  * have_scope
  * belongs_to
  * have_one
  * have_many
  * have_and_belong_to_many
  * validate_associated
  * validate_uniqueness_of


## Installation

Add the `remockable` gem to your `Gemfile`:

    gem 'remockable'

Then run `bundle install` to install the gem.

You'll also want to make sure the library is required by RSpec, so add the
following to your `spec_helper.rb` or someone else where it will get loaded
when your specs do:

    require 'remockable'


## Copyright

Copyright © 2010-2011 Tyler Hunt. See LICENSE for details.
