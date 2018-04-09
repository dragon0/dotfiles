VENV = . env/bin/activate;

run: env db
	$(VENV) FLASK_APP=server.py flask run

dev: env
	$(VENV) FLASK_APP=server.py FLASK_DEBUG=1 flask run

test: env
	$(VENV) python tests.py

db: dataset.csv
	$(VENV) python initdb.py

env: requirements.txt
	test -d env || python3 -m venv env
	$(VENV) pip install -r requirements.txt
	touch env

# Just an example; requirements.txt should be created manually
requirements.txt:
	echo flask > $@

freeze:
	$(VENV) pip freeze > requirements.txt

clean:
	$(RM) data.db
	$(RM) -r __pycache__
clean-env:
	$(RM) -r env

.PHONY: run dev test env db freeze

