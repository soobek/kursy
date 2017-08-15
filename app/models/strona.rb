class Strona < ActiveRecord::Base
    belongs_to :kategorie
    has_many :artykuls
end
