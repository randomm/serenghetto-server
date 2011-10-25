class BarcodeLocation < ActiveRecord::Base
  belongs_to :user, :foreign_key => :user_id
  belongs_to :barcode, :foreign_key => :barcode_id
end
