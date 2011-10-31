class BarcodeLocation < ActiveRecord::Base
  belongs_to :user, :foreign_key => :user_id
  belongs_to :barcode, :foreign_key => :barcode_id

  def as_json(options={})
    super(
      :only => [:id, :name, :geom, :accuracy]
    )
  end

end
