
install:
	gem install httparty --user-install

scrape:
	cd scripts; ruby data_export.rb
