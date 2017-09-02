class Uzytkownik < ActiveRecord::Base
 has_secure_password
 
    EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
 
    validates :imie,
            :presence => {:in => true, :message => "Pole nie może być puste."}
            
    validates :nazwisko,
            :presence => {:in => true, :message => "Pole nie może być puste."}
            
     validates :uzytkownik,
            :presence => {:in => true, :message => "Pole nie może być puste."},
            :length => {:within => 4..25, :message => "Długość nazwy powinna zawierać się między 4 a 25 znaków."},
            :uniqueness => true
            
     validates :email,
            :presence => {:in => true, :message => "Pole nie może być puste."},
            :length => {:maximum => 100, :message => "Za długi email."},
            :format => {:with => EMAIL_REGEX, :message => "Niepoprawny format."},
            :confirmation => true
            
     validates :password,
            :presence => {:in => true, :message => "Pole nie może być puste."}
     
     validates :password_confirmation,
            :presence => {:in => true, :message => "Pole nie może być puste."}
            
    scope :sortuj, lambda{order("nazwisko ASC","imie ASC")}
 
end
