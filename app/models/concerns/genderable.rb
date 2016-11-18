# This concern adds functionality models having a gender.
module Genderable
  extend ActiveSupport::Concern

  GENDERS = %w(male female).freeze

  PRONOUNS = {
    male: %w(he him his),
    female: %w(she her her)
  }.freeze

  included do
    enum gender: GENDERS
    validates :gender, inclusion: {
      in: Genderable::GENDERS,
      message: 'is invalid'
    }
  end

  def gender_subjective
    PRONOUNS[gender.to_sym][0]
  end

  def gender_objective
    PRONOUNS[gender.to_sym][1]
  end

  def gender_possessive
    PRONOUNS[gender.to_sym][2]
  end
end
