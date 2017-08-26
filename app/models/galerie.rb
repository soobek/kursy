class Galerie < ActiveRecord::Base

    has_many :zdjecies
    
    has_attached_file :zdjecie,
					 :styles => {:medium => "600x600>", :thumb => "200x200>" }
								
	validates_attachment_content_type :zdjecie,
    content_type: ["image/jpeg", "image/gif", "image/png"] , :message => '--- akceptuje tylko pliki PNG GIF i JPG ----'
    validates_attachment_size :zdjecie, less_than: 1.megabytes, :message => '--- za duży plik max rozmiar to 1 MB ----'
    
     validates :nazwa,
                :presence => {:message => "---Wprowadź tytuł artykułu.---"},
                :length => {:maximum => 120, :message => "---Za długi tytuł galerii.---"}
    
    scope :widoczna, lambda {where(:widoczny => true)}
    scope :niewidoczna, lambda {where(:widoczny => false)}
    scope :sortuj, lambda {order("galeries.pozycja ASC")}
    scope :najnowsza, lambda {order("galeries.created_at DESC")}
end
