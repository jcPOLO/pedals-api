require 'rails_helper'

RSpec.describe Component, type: :model do
  it { should have_many(:projects) }
  it { should have_many(:projects).through(:components_projects) }
  it { should validate_presence_of(:component_type) }
  it { should belong_to(:component_type) }
end