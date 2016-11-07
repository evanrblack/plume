require 'test_helper'

module GenderableTest
  extend Minitest::Spec::DSL

  it 'must have a valid gender' do
    [
      [nil, false],
      ['male', true],
      ['female', true],
      [0, true]
    ].each do |value, expected|
      model.gender = value
      model.validate
      model.errors.keys.include?(:gender).wont_equal expected
    end
  end

  it 'will have a subj., obj., and poss. for each gender' do
    Genderable::GENDERS.each do |gender|
      model.gender = gender
      model.gender_subjective.wont_be :blank?
      model.gender_objective.wont_be :blank?
      model.gender_possessive.wont_be :blank?
    end
  end
end
