require 'rails_helper'

RSpec.describe House, type: :model do
  it {should belong_to :agent}
end
