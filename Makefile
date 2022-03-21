.DEFAULT: all

.PHONY: all
all: build run

.PHONY: build
build:
	go build


.PHONY: test.login
test.login:
	http -v --json POST localhost:8000/login username=admin password=admin

.PHONY: test.refresh
test.refresh:
	http -v -f GET localhost:8000/auth/refresh_token "Authorization:Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NDc4ODAyMzMsImlkIjoiYWRtaW4iLCJvcmlnX2lhdCI6MTY0Nzg3NjYzM30.thd3NpbK-D7EkHPG5oAIEz54Dq3dMiMCXFnTBo9NO2o" "Content-Type: application/json"

.PHONY: test.h1
test.h1:
	http -f GET localhost:8000/auth/hello "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NDc4ODAyMzMsImlkIjoiYWRtaW4iLCJvcmlnX2lhdCI6MTY0Nzg3NjYzM30.thd3NpbK-D7EkHPG5oAIEz54Dq3dMiMCXFnTBo9NO2o" "Content-Type: application/json"


.PHONY: test.hello
test.hello:
	http -f GET localhost:8000/auth/hello "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NDc4ODAyMzMsImlkIjoiYWRtaW4iLCJvcmlnX2lhdCI6MTY0Nzg3NjYzM30.thd3NpbK-D7EkHPG5oAIEz54Dq3dMiMCXFnTBo9NO2o" "Content-Type: application/json"

.PHONY: run
run:
	./gin-jwt-demo