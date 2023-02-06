class Dull < ApplicationRecord
    attr_accessor :filter_text
    has_one_attached :csv_file
end
