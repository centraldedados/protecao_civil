install:
	pip install csvkit

scrape:
	ruby scripts/data_scrape.rb

convert:
	ruby scripts/data_convert.rb

merge:
	ruby scripts/data_merge.rb 

cleanup:
	rm -rf data/[0-9]*