require 'open-uri'
require 'date'
require 'fileutils'
require_relative '../config.rb'


# Export formats
export_formats = {
  "xlsx" => 0,
  "csv" => 1,
  "kmz" => 2
}

# Check for configuration errors
## Check if export format is correct
if export_formats[@export_format].nil?
  puts "Formato de exportação inexistente. Verifique a configuração."
  exit
end
## Check for export dates interval >= 7 days
#elsif (@export_end_date - @export_start_date > 7)
#  puts "Intervalo de datas a exportar não pode ser superior a 7 dias."
#  exit
#end

# Browser agent
browser_agent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:42.0) Gecko/20100101 Firefox/42.0"


# URL request parameters
ex = 0
l = 1
d = @district_id
n = @occurrence_id
s = @export_start_date
f = @export_end_date
e = export_formats[@export_format]


# Date formatting helpers
# Format date in the proper format for Prociv endpoint
def format_date(date)
  date.to_s.gsub('-','.')
end

def reformat_date(date)
  date.to_s.gsub('.','-')
end

# Write file helper
def write_file(file, content)
  File.open(file, 'w') {
    |file| file.write(content)
  }
end


# Setup all the dates we want
current_date = @export_start_date
date_range = [] # Array with dates to download
while (current_date <= @export_end_date) # Creates array of dates with the start_date and end_date
  date_range << format_date(current_date)
  current_date = current_date + 1
end

puts "Tempo de espera entre pedidos: #{@sleep_interval} segundos"
puts


# Iterate over dates
date_range.each_with_index do |date, index|
  request_url = "http://www.prociv.pt/pt-PT/Paginas/export.aspx?ex=#{ex}&l=#{l}&d=#{d}&n=#{n}&s=#{date}&f=#{date}&e=#{e}"
  puts "A pedir as ocorrências de #{reformat_date(date)}..."

  response = URI.open(
    request_url,
    "User-Agent" => browser_agent
  ).read

  # Setup filename and extension to keep
  filename_extension = @export_format
  year = date.split('.')[0].to_s
  year_dir  = FileUtils.mkdir_p "data/#{year}"
  file = "data/#{year}/#{reformat_date(date)}.#{filename_extension}"

  puts "A guardar ficheiro #{filename_extension}..."
  write_file(file, response)

  puts
  sleep @sleep_interval
end

puts "Recolha de dados finalizada."


