createdb:
	docker-compose run --rm web rake db:create

rspec:
	docker-compose run --rm -e RAILS_ENV=test web rspec --format doc

console:
	docker-compose run --rm web rails console

rake:
	docker-compose run --rm web rake

g:
	docker-compose run --rm web rails generate
