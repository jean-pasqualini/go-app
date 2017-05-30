build:
	@docker run -e CGO_ENABLED=0 -v ${PWD}/src:/go/src/app -v ${PWD}/bin:/go/bin -it google/golang go install -a -ldflags '-s'
run:
	@docker run -v ${PWD}/src:/go/src/app -v ${PWD}/bin:/go/bin -it google/golang go run /go/src/app/app.go
build-for-docker: build
	@echo 'image myapp created with id :'
	@tar c bin/app | docker import - myapp
run-for-docker: build-for-docker
	@docker run --entrypoint=/bin/app --rm -it myapp
