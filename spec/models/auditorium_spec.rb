require 'spec_helper'

RSpec.describe Auditorium, type: :model do
  subject { build(:auditorium) }
  
  it { should validate_presence_of(:capacity) }
  it { should validate_presence_of(:number) }
end