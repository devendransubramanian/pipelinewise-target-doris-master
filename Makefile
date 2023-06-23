venv:
	python3 -m venv venv ;\
	. ./venv/bin/activate ;\
	pip install --upgrade pip setuptools wheel ;\
	pip install -e .[test]

pylint:
	. ./venv/bin/activate ;\
	pylint --rcfile .pylintrc target_doris/

unit_test:
	. ./venv/bin/activate ;\
	pytest --cov=target_doris  --cov-fail-under=44 tests/unit -v

env:
  	export TARGET_QUERY_PORT=5432
  	export TARGET_FE_DBNAME=target_db
  	export TARGET_FE_USER=my_user
  	export TARGET_FE_PASSWORD=secret
  	export TARGET_FE_HOST=localhost
  	export TARGET_FE_SCHEMA=public

integration_test: env
	. ./venv/bin/activate ;\
	pytest tests/integration --cov=target_doris  --cov-fail-under=87 -v
