class Score < ActiveRecord::Base
  belongs_to :user, :foreign_key => :barcode_id

  acts_as_api
  
  api_accessible :default do | t |
    t.add :score
    t.add :updated_at, :as => :last_calculated
  end

end
