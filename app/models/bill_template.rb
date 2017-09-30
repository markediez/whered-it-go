class BillTemplate < ApplicationRecord
  belongs_to :reminder_template, required: false
end
