COVERAGE_OUT = bin/cover.out
TEST_FLAGS = -race -coverprofile=$(COVERAGE_OUT)

.PHONY: fmt
fmt:
	go mod tidy
	gofumpt -s -w .
	gofumports -w .

.PHONY: lint
lint:
	golangci-lint run ./...

.PHONY: test
test:
	mkdir -p bin
	go test $(TEST_FLAGS) ./...
	go tool cover -html=$(COVERAGE_OUT) -o bin/cover.html
