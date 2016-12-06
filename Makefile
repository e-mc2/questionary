migrate:
	docker-compose run --rm -e RAILS_ENV=development web rake db:migrate
	docker-compose run --rm -e RAILS_ENV=test web rake db:migrate

rollback:
	docker-compose run --rm -e RAILS_ENV=development web rake db:rollback
	docker-compose run --rm -e RAILS_ENV=test web rake db:rollback

db:
	docker-compose run --rm RAILS_ENV=development web rake db:create
	docker-compose run --rm RAILS_ENV=test web rake db:create

rspec:
	docker-compose run --rm -e RAILS_ENV=test web rspec --format doc

console:
	docker-compose run --rm web rails console

routes:
	docker-compose run --rm web rake routes

g:
	docker-compose run --rm web rails generate
