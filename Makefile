
run:
	ruby scripts/data_scrape.rb

merge:
	ruby scripts/data_merge.rb 

cleanup:
	rm -i data/[0-9]*