ifeq ($(OS), Windows_NT)
activate:
	julia --project=.
test:
	julia ./test/testrunner.jl
endif