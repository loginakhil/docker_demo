all:
	docker build -f Dockerfile -t freespace_app .

run:
	docker run freespace_app

.PHONY: all run
