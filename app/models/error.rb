class Error < ActiveRecord::Base
	def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |error|
        csv << error.attributes.values_at(*column_names)
      end
    end
  end
end
