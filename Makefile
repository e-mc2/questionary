migrate:
	docker-compose run --rm -e RAILS_ENV=development web rake db:migrate
	docker-compose run --rm -e RAILS_ENV=test web rake db:migrate

rollback:
	docker-compose run --rm -e RAILS_ENV=development web rake db:rollback
	docker-compose run --rm -e RAILS_ENV=test web rake db:rollback

rspec:
	docker-compose run --rm -e RAILS_ENV=test web rspec --format doc

console:
	docker-compose run --rm -e RAILS_ENV=development web rails console

routes:
	docker-compose run --rm web rake routes

heel:
	docker-compose run --rm -e RAILS_ENV=test -p 4331:4331 --user root web sh -c "heel -r tmp/capybara --no-launch-browser"

init:
	docker-compose build
	docker-compose run --rm -e RAILS_ENV=development web rake db:create
	make migrate

run:
	docker-compose up



# If the first argument is "run"...
ifeq (test, $(firstword $(MAKECMDGOALS)))
	# use the rest as arguments for "run"
  RUN_ARGS := $(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))
	# ...and turn them into do-nothing targets
  $(eval $(RUN_ARGS):; @:)
endif

.PHONY: test
test:
	docker-compose run --rm -e RAILS_ENV=test web rspec --format doc $(RUN_ARGS)
