require_relative '../config.rb'

# Convert from excel to CSV
# using in2csv
def convert_excel_to_csv

  Dir["data/#{@year}/*.xlsx"].sort.each_with_index do |file_path, index|
    csv_filename = file_path.gsub('xlsx', 'csv')
    puts "#{index+1}: #{file_path} > #{csv_filename}"
    puts "Converting to CSV..."
    system("in2csv #{file_path} > #{csv_filename}")
    puts
  end

end

# Run
convert_excel_to_csv