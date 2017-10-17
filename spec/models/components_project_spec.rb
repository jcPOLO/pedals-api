require 'rails_helper'

RSpec.describe ComponentsProject, type: :model do
  it { should belong_to(:component) }
  it { should belong_to(:project) }
  it { should validate_presence_of(:amount) }
end