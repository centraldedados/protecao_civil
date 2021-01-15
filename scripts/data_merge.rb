require 'csv'
require_relative '../config.rb'


# create new csv for the final output with the final header
def merge_year

  headers = [
    "Numero",
    "DataOcorrencia",
    "DataFechoOperacional",
    "Natureza",
    "EstadoOcorrencia",
    "Distrito",
    "Concelho",
    "Freguesia",
    "Localidade",
    "Latitude",
    "Longitude",
    "NumeroMeiosTerrestresEnvolvidos",
    "NumeroOperacionaisTerrestresEnvolvidos",
    "NumeroMeiosAereosEnvolvidos",
    "NumeroOperacionaisAereosEnvolvidos"
  ]

  CSV.open("data/anpc-#{@year}.csv", "wb", col_sep: ',', write_headers: true, headers: headers) do |csv|
    Dir["data/#{@year}/*.csv"].sort.each_with_index do |file_path, index|  # for each of your csv files
      puts "#{index+1}: #{file_path.split('/')[2].split('.')[0]}"
      begin
        CSV.foreach(file_path, headers: true, return_headers: false, col_sep: ',', encoding: "ISO8859-1") do |row| # don't output the headers in the rows
          csv << row # append to the final file
        end
      rescue
        puts "ERROR: #{index+1}: #{file_path}"
      end
    end
  end

end

# Run
merge_year
