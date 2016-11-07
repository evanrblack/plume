# -*- coding: utf-8 -*-
require 'test_helper'

module NameableTest
  extend Minitest::Spec::DSL

  it 'must have a valid first_name' do
    [
      [nil, false],
      ['', false],
      ['George', true],
      ['🐙', true]
    ].each do |value, expected|
      model.first_name = value
      model.validate
      model.errors.keys.include?(:first_name).wont_equal expected
    end
  end

  it 'must have a valid last_name' do
    [
      [nil, false],
      ['', false],
      ['Foreman', true],
      ['👏💯😂', true]
    ].each do |value, expected|
      model.last_name = value
      model.validate
      model.errors.keys.include?(:last_name).wont_equal expected
    end
  end
end
