class Score < ActiveRecord::Base
  belongs_to :user, :foreign_key => :barcode_id

  acts_as_api
  
  api_accessible :default do | t |
    t.add :score
    t.add :updated_at, :as => :last_calculated
  end

  def self.set_score(barcode=nil)
    count = Barcode.count(:conditions => "code = '"+barcode.code.to_s+"'")
    score = (100 / count).round
    score_instance = Score.where(:barcode_id => barcode.id).first
    unless score_instance
      Score.create({
        :score => score,
        :barcode_id => barcode.id
      })
    else
      score_instance.score = score
      score_instance.save
    end
  end

end
