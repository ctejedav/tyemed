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
  
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Company.create! row.to_hash
    end
  end
end
