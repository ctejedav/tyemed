class Company < ActiveRecord::Base
  

  
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |company|
        csv << company.attributes.values_at(*column_names)
      end
    end
  end
  
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
