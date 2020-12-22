all: $(patsubst %.hs,%,$(wildcard day*.hs))

%: %.hs
	ghc -o $@ $^

