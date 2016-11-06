require "test_helper"

describe Login do
  let(:login) { Login.new }

  it "must be valid" do
    value(login).must_be :valid?
  end
end
