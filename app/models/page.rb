class Page < ActiveRecord::Base
attr_accessible :name, :email

def self.import(file)
  spreadsheet = open_spreadsheet(file)
  header = spreadsheet.row(1)
(2..spreadsheet.last_row).each do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
   page = find_by_email(row["email"]) || new
   page.attributes = row.to_hash.slice(*row.to_hash.keys)
    page.save!


  end
end	

def self.open_spreadsheet(file)
  case File.extname(file.original_filename)
  when ".csv" then Roo::Csv.new(file.path)
  when ".xls" then Roo::Excel.new(file.path)
  when ".xlsx" then Roo::Excelx.new(file.path)
  else raise "Unknown file type: #{file.original_filename}"
  end
end


end

