class House < ApplicationRecord
  belongs_to :agent

  def self.for_sale
    self.where(for_sale: true)
  end

  def self.alphasort
    self.order(:address)
  end
end
