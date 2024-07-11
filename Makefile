.PHONY: test test-heroku-24 test-heroku-20

test: test-heroku-24 test-heroku-20

test-heroku-24:
	@echo "Running tests in docker (heroku-24)..."
	@docker run -v $(shell pwd):/buildpack:ro --rm -e "STACK=heroku-24" heroku/heroku:24 bash -c 'cp -r /buildpack /buildpack_test; cd /buildpack_test/; test/run;'
	@echo ""

test-heroku-20:
	@echo "Running tests in docker (heroku-20)..."
	@docker run -v $(shell pwd):/buildpack:ro --rm -e "STACK=heroku-20" heroku/heroku:20 bash -c 'cp -r /buildpack /buildpack_test; cd /buildpack_test/; test/run;'
	@echo ""
