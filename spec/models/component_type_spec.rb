require 'rails_helper'

RSpec.describe ComponentType, type: :model do
  it { should have_many(:components) }
end