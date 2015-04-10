class Profile < ActiveRecord::Base
attr_accessible   :name, :email


def self.import(file)
  spreadsheet = open_spreadsheet(file)
  header = spreadsheet.row(1)

  (2..spreadsheet.last_row).each do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
puts "===================================#{row.to_hash.slice(*row.to_hash.keys)}"
    profile = find_by_email(row["email"]) || new
    profile.attributes = row.to_hash.slice(*row.to_hash.keys)
    profile.save!


  end
end	

def self.open_spreadsheet(file)
  case File.extname(file.original_filename)
  when ".csv" then Roo::Csv.new(file.path)
  when ".xls" then Roo::Excel.new(file.path)
  when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
  else raise "Unknown file type: #{file.original_filename}"
  end
end

end
