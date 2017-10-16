require 'httparty'
require 'date'
require 'csv'
require_relative '../config.rb'

export_formats = {
  "xlsx" => 0,
  "csv" => 1,
  "kmz" => 2
}

# Check if export format is correct
if export_formats[@export_format].nil?
 puts "Formato de exportação inexistente. Verifique a configuração."
 exit
end


# URL request parameters
ex = 1
l = 1
d = '' # District, empty for all
n = '' # Occurrence code, empty for all
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

  response = HTTParty.get(
    request_url,
    headers: {"User-Agent" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:42.0) Gecko/20100101 Firefox/42.0"})

  # Setup filename and extension to keep
  filename_extension = @export_format
  file = "data/#{reformat_date(date)}.#{filename_extension}"

  puts "A guardar ficheiro #{filename_extension}..."
  write_file(file, response.body)

  puts
  sleep @sleep_interval
end

puts "Recolha de dados finalizada."


