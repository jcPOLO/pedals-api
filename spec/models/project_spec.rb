require 'rails_helper'

RSpec.describe Project, type: :model do
  it { should have_many(:components) }
  it { should have_many(:components).through(:components_projects) }
  it { should validate_presence_of(:name) }
end