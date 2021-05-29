RESULT_DIR := ./spec/lua/zebrazone/virtes/screenshot
screenshot:
	nvim --clean -n +"lua dofile('./spec/lua/zebrazone/virtes/scenario.lua')('${RESULT_DIR}')" +"quitall!"
.PHONY: screenshot
