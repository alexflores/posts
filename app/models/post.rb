class Post < ActiveRecord::Base
	validates :title, :presence => true
	validates :text, :presence => true
	has_many :comments

    def self.search(search)
      if search 

         where('category LIKE ?', "%#{search}%")

      else

         scoped

      end    
 
    end

end
