require 'spec_helper'

RSpec.describe Movie, type: :model do
  subject { build(:movie) }
  
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:runtime) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:rating) }
end