
@sleep_interval = 2.5 # para não sobrecarregar o servidor da ANPC
@export_format = "csv" # xlsx, csv ou kmz

@district_id =  # distrito, deixar vazio para todos os distrito. Ler README para os IDs de cada distrito.
@occurrence_id =  # natureza da ocorrência, vazio para todas. Ler README para os IDs de cada natureza de ocorrência.

@export_start_date = Date.parse('2017.06.01') # data inicial a exportar
@export_end_date = Date.parse('2017.06.30') # data final a exportar
