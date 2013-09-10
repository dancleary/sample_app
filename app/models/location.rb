class Location < ActiveRecord::Base
	validates :name, presence: true, length: { maximum: 50}, uniqueness: {case_sensitive: false}
	
	validates :address, presence: true, uniqueness: {case_sensitive: false}
	validates :food, presence: true
	validates :price, presence: true
	
	def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
end
