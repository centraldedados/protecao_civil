
@sleep_interval = 2.5 # so we won't the ANPC server too much
@export_days_interval = 7 # maximum export interval is 7
@export_format = "csv" # XLSX, CSV or KMZ

@district_id =  # District, empty for all, check README for District IDs
@occurrence_id =  # Occurrence nature, empty for all, check README for Occurrence IDs

@export_start_date = Date.parse('2017.01.01')
@export_end_date = Date.parse('2017.01.01')