rspec:
	docker-compose run -e RAILS_ENV=test web rspec --format doc
